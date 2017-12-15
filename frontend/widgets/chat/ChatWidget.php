<?php
namespace frontend\widgets\chat;
/**
 * 文章列表
 */
use yii;
use yii\base\Widget;
use common\models\PostsModel;
use frontend\models\PostForm;
use yii\helpers\Url;
use yii\data\Pagination;

class ChatWidget extends Widget
{
    public $item = [];//

    public function  init(){

    }
    public function run()
    {
        return $this->render('index');
    }
    

}