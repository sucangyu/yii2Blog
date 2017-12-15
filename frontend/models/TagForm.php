<?php
namespace frontend\models;

use yii;
use yii\base\Model;
use common\models\TagsModel;

/**
 * 标签表单模型
 */
class TagForm extends Model
{
    public $id;
    public $tags;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            // 必填
            ['tags', 'required'],
            // 遍历
            ['tags', 'each','rule'=>['string']],
        ];
    }

    /**
     * 保存标签集
     */
    public function seveTags(){
        $ids = [];
        if (!empty($this->tags)){
            foreach ($this->tags as $tag){
                $ids[] = $this->_saveTags($tag);
            }
        }
        // var_dump($ids);
        // die;
        return $ids;
    }
    /**
     * 保存标签
     */
    private function _saveTags($tag){

        $model = new TagsModel();
        $res = $model->find()->where(['tag_name'=>$tag])->one();
        //如果没找到已存在标签添加标签
        if (!$res){
            $model->tag_name = $tag;
            $model->post_num = 1;
            if (!$model->save()){
                throw new \ErrorException('保存标签失败');
            }
            return $model->id;
        }else{
            $res->updateCounters(['post_num'=>1]);
        }
        return $res->id;
    }


}
