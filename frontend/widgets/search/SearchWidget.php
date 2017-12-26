<?php
namespace frontend\widgets\search;
/**
 * 留言板挂件
 */
use yii\base\Object;
use frontend\models\PostForm;
use yii;
use yii\base\Widget;


class SearchWidget extends Widget
{
    public $item = [];//

    public function  init(){

    }
    public function run()
    {
        $model = new PostForm();
        $data = $model->getTitleList();
        return $this->render('index',['data'=>$data]);
    }
    

}