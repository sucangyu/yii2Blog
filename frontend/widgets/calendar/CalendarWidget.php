<?php
namespace frontend\widgets\calendar;
/**
 * 日历挂件
 * 正在开发签到功能
 */
use yii\base\Object;
use frontend\models\FeedForm;
use yii;
use yii\base\Widget;
use common\models\TUserSignModel;


class CalendarWidget extends Widget
{
    public $item = [];//

    public function  init(){

    }
    public function run()
    {
        $model = new TUserSignModel();
        $date['time'] = time();//当前年月日时间戳
        $date['ds'] = date('t');//当前月天数
        $date['d'] = date('j');//当前日
        $date['w'] = Date("w", strtotime(Date("Y-m-1"))) ;//获取当月的1日等于星期几
        $where['singYM'] = strtotime (date ('Y-m-1'));//同一年同一月份
        $where['user_id'] = Yii::$app->user->identity->id;//用户id
        //检查同一年同一月份此用户是否创建了签到
        //ps:签到表是一人一年有12条,每一条存的是当月签到的日期
        $res = $model->find()->where($where)->one();
        $data = $res['signHistoy'];//已登录人签到日期数组
        if (!$res) {
           $data = '[]';
        }
        
        //var_dump ($where['singYM']);
        //die;
        return $this->render('index',['date'=>$date,'data'=>$data]);
    }
    

}