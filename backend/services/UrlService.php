<?php
/*
链接管理类
1:统一处理链接
2:用于规范书写
*/
namespace backend\services;

use yii\helpers\Url;

class UrlService{
	//返回一个内连接
	public static function buildUrl( $uri,$params=[] ){
		return Url::toRoute( array_merge( [$uri],$params ) );
	}

	//返回一个空连接
	public static function buildNullUrl(){
		return "javascript:void(0)";
	}
}