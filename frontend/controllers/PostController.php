<?php
namespace frontend\controllers;

use Yii;
use yii\web\Controller;


/**
 * 文章控制器
 */
class PostController extends BaseController
{
    /**
     * 文章列表
     */
    public function actionIndex()
    {
        return $this->render('index');
    }


}
