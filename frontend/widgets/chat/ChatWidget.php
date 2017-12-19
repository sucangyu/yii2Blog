<?php
namespace frontend\widgets\chat;
/**
 * 留言板挂件
 */
use yii\base\Object;
use frontend\models\FeedForm;
use yii;
use yii\base\Widget;


class ChatWidget extends Widget
{
    public $item = [];//

    public function  init(){

    }
    public function run()
    {
        $feed = new FeedForm();
        $data['feed'] = $feed->getList();
        return $this->render('index',['data'=>$data]);
    }
    

}