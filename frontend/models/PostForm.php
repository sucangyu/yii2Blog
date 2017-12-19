<?php
namespace frontend\models;

use yii;
use yii\db\Query;
use yii\base\Model;
use common\models\PostsModel;
use common\models\TagsModel;
use common\models\RelationPostTagsModel;
/**
 * 文章表单
 */
class PostForm extends Model
{
    public $id;
    public $title;
    public $content;
    public $label_img;
    public $cat_id;
    public $tags;

    public $_lastError = "";


    /*
        定义场景
        SCENARIOS_CAREATE创建
        SCENARIOS_UPDATE更新
    */

    const SCENARIOS_CAREATE = 'careate'; //创建文章
    const SCENARIOS_UPDATE = 'update';   //更新文章

    /*定义事件
        EVENT_AFTER_CREATE 创建后事件
        EVENT_AFTER_UPDATE 更新后事件
    */
    const EVENT_AFTER_CREATE = "eventAfterCreate";
    const EVENT_AFTER_UPDATE = "eventAfterUpdate";

    /*场景设置*/
    public function scenarios()
    {
        $scenarios = [
            self::SCENARIOS_CAREATE=>['title','content','label_img','cat_id','tags'],
            self::SCENARIOS_UPDATE=>['title','content','label_img','cat_id','tags'],
        ];
        return array_merge(parent::scenarios(),$scenarios);
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            // 必填
            [['title','content','cat_id'], 'required'],
            // 整形
            [['id','cat_id'], 'integer'],
            // 标题长度
            ['title', 'string','min'=>4,'max'=>50],
            //['tags','string'],
        ];
    }

    /*文章映射*/
    public function attributeLabels()
    {
        return [
            'id' => '编码',
            'title' => '标题',
            'content' => '内容',
            'label_img' => '标签图',
            'tags' => '标签',
            'cat_id' => '分类',
        ];
    }

    public static function getList($cond,$curPage = 1,$pafeSizc = 5,$orderBy = ['id'=>SORT_DESC]){
        $model = new PostsModel();
        //查询语句
        $select = ['id','title','summary','label_img','cat_id','user_id','user_name','is_valid','created_at','updated_at'];
        $qurey = $model->find()
            ->select($select)
            ->where($cond)
            ->with('relate.tag', 'extend')
            ->orderBy($orderBy);
        //获取分页数据
        $res = $model->getPages($qurey,$curPage,$pafeSizc);
        //格式化
        $res['data'] = self::_formatList($res['data']);

        return $res;
    }

    /**
     * 文章列表数据格式化方法
     */
    public static function _formatList($data){
        foreach ($data as &$list){
            $list['tags'] = [];
            if (isset($list['relate']) && !empty($list['relate'])){
                foreach ($list['relate'] as $lt){
                    $list['tags'][] = $lt['tag']['tag_name'];
                }
            }
            unset($list['relate']);
        }

        return $data;
    }


    /*文章创建*/
    public function create()
    {
        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = new PostsModel();
            $model->setAttributes($this->attributes);
            $model->summary = $this->_getSummary();
            $model->user_id = Yii::$app->user->identity->id;
            $model->user_name = Yii::$app->user->identity->username;
            $model->is_valid = PostsModel::IS_VALID;
            $model->created_at = time();
            $model->updated_at = time();
            if(!$model->save()) {
                throw new \Exception("文章保存失败！");
            }
            $this->id = $model->id;
            //事件调用
            $data = array_merge($this->getAttributes(),$model->getAttributes());
            $this->_eventAfterCreate($data);
            $transaction->commit();
            return true;
        } catch (\Exception $e) {
            $transaction->rollBack();
            $this->_lastError = $e->getMessage();
            return false;
        }
    }

    /**
     * @param int $s
     * @param int $e文章更新显示
     * @param string $char
     * @return null|string
     */
    public function getupdate($id)
    {
        $data = PostsModel::find()->with('relate.tag')->where(['id'=>$id])->asArray()->one();
        $data = self::_formatList2($data);
//        $this->title = $data['title'];
//        $this->cat_id = $data['cat_id'];
//        $this->label_img = $data['label_img'];
//        $this->content = $data['content'];
//        $this->tags = $data['tags'];
        $this->setAttributes($data);
    }

    public function update($id)
    {
        $transaction = Yii::$app->db->beginTransaction();
        try{
            $postmodel = PostModel::find()->with('relate.tag')->where(['id'=>$id])->one();
            $postmodel->setAttributes($this->attributes);
            $postmodel->summary = $this->_getSummary(); //生成摘要
            $postmodel->user_id = Yii::$app->user->identity->id;
            $postmodel->user_name = Yii::$app->user->identity->username;
            $postmodel->is_valid = PostModel::IS_VALID;
            $postmodel->updated_at = time();
            if (!$postmodel->save()){
                throw new \yii\base\Exception('文章保存失败!');
            }
            $this->id = $postmodel->id;
            //调用事件
            $data = array_merge($this->getAttributes(),$postmodel->getAttributes());
            $this->_eventAfterCreate($data);
            $transaction->commit();
            return true;
        }catch ( \yii\base\Exception $e)
        {
            $transaction->rollBack();
            $this->_lastError = $e->getMessage();
            return false;
        }
    }
    private function _formatList2($data)
    {
        foreach ($data['relate'] as $list){
            $data['tags'][]= $list['tag']['tag_name'];
        }
        unset($data['relate']);
        return $data;
    }

    /*私有文章简介截取方法*/
    private function _getSummary($s = 0,$e = 90,$char = 'utf-8')
    {
        if (empty($this->content)) {
            return null;
        }
        return (mb_substr(str_replace('&nbsp;', '', strip_tags($this->content)), $s, $e, $char));
    }

    /**
     * 文章创建之后事件
     */
    public function _eventAfterCreate($data)
    {
        //添加事件
        $this->on(self::EVENT_AFTER_CREATE,[$this,'_eventAddTag'],$data);
        //触发事件
        $this->trigger(self::EVENT_AFTER_CREATE);
    }

    /**
     *添加标签事件
     */
    public function _eventAddTag($event){
        //保存标签
        $tag = new TagForm();
        $rpt = new RelationPostTagsModel();
        $tag->tags = $event->data['tags'];
        $tagids = $tag->seveTags();

        //删除原先的关联关系
        RelationPostTagsModel::deleteAll(['post_id'=>$event->data['id']]);
        //批量保存文章标签关联关系
        if (!empty($tagids)){
            foreach ($tagids as $k=>$id){
                // $row[$k]['post_id'] = $this->id;
                // $row[$k]['tag_id'] = $id;
                $_rpt = clone $rpt;
                $_rpt->post_id = $this->id;
                $_rpt->tag_id = $id;
                //如果失败
                if (!$_rpt->save()){
                    throw new \ErrorException("关联关系保存失败");
                }
            }
            // //批量插入
            // $res = (new Query())->createCommand()->batchInsert(RelationPostTagsModel::tableName(),['post_id','tag_id'])->execuye();
            // //如果失败
            // if (!$res)
            //     throw new \ErrorException("关联关系保存失败");
        }
    }

    /**
     *
     */
    public function getViewById($id){
        $res = PostsModel::find()->with('relate.tag', 'extend')->where(['id'=>$id])->asArray()->one();
        if (!$res){
            throw new \ErrorException("文章不存在 ");
        }

        //处理标签格式
        $res['tags'] = [];
        if (isset($res['relate'])&&!empty($res['relate'])){
            foreach ($res['relate'] as $list){
                $res['tags'][] = $list['tag']['tag_name'];
            }
        }
        unset($res['relate']);
        return $res;
    }


}
