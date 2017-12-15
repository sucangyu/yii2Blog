<?php
namespace frontend\widgets\post;
/**
 * 文章列表
 */
use yii;
use yii\base\Widget;
use common\models\PostsModel;
use frontend\models\PostForm;
use yii\helpers\Url;
use yii\data\Pagination;

class PostWidget extends Widget
{
    public $title = '';//文章标题
    public $limit = 6;//显示条数
    public $more = true;//是否显示更多
    public $page = true;//是否显示分页

    public function run()
    {
        $curPage = Yii::$app->request->get('page',1);
        //查询条件
        $cond = ['=','is_valid',PostsModel::IS_VALID];
        $res = PostForm::getList($cond,$curPage,$this->limit);
        $result['title'] = $this->title?:"最新文章";
        $result['more'] = Url::to(['post/index']);
        $result['body'] = $res['data']?:[];
        //是否显示分页
        if ($this->page){
            $pages = new Pagination(['totalCount'=>$res['count'],'pageSize'=>$res['pageSize']]);
            $result['page'] = $pages;
        }
        return $this->render('index',['data'=>$result]);
    }
    

}