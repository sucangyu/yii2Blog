<?php
namespace frontend\controllers;

use Yii;
use yii\web\Controller;


/**
 * 基础控制器
 */
class BaseController extends Controller
{
    /**
     * @inheritdoc
     */
    public function beforeAction($action)
    {
        if (!parent::beforeAction($action)) {
            return fasle;
        }
        return true;
    }


}
