<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot/backend/web/';
    public $baseUrl = '@web/backend/web/';
    // public $css = [
    //     'statics/css/site.css',
    //     'statics/css/font-awesome-4.4.0/css/font-awesome.css',
    //     'statics/css/layout.css',
    // ];
    // public $js = [
    //     'statics/js/jquery-ui.js',
    //     'statics/js/toggles.js',
    //     'statics/js/layout.js',
    //     'statics/js/site.js',
    // ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];


    //引入css js方法二
    public function registerAssetFiles($view){
        //可加动态版本号. 目的 :是浏览器获取最新的css和js文件
        $release = '20180620';
        $this->css = [
            'statics/css/site.css',
            'statics/css/font-awesome-4.4.0/css/font-awesome.css',
            'statics/css/layout.css',
        ];
        $this->js = [
            'statics/js/jquery-ui.js',
            'statics/js/toggles.js',
            'statics/js/layout.js',
            'statics/js/site.js',
        ];
        parent::registerAssetFiles($view);
    }
}
