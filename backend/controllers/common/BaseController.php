<?php
//首页
namespace backend\controllers\common;
use Yii;
use yii\web\Controller;

//基类 , 集成常用公用方法
class BaseController extends Controller{
	//验证登录是否有效

	//设置登录态cookie

	//用户相关信息生成加密校验函数

	//统一post方法
	public function post($key,$default=""){
		return yii::$app->request->post($key,$default);
	}

	//统一get方法
	public function get($key,$default=""){
		return yii::$app->request->get($key,$default);
	}

	//封装json返回值,主用于js ajax 与后端交互返回格式
	/*
		data:数据区 数组
		msg:操作提示语
		code:状态码 200表示成功 同http成功状态码
	*/
	public function renderJSON($data=[],$msg='ok',$code=200){
		header('Content-type:application/json');//设置头部内容格式
		echo json_encode([
			"code"=>$code,
			"data"=>$data,
			"msg"=>$msg,
			"req_id"=>uniqid(),//函数基于以微秒计的当前时间，生成一个唯一的 ID。
		]);
		return Yii::$app->end();
	}
}