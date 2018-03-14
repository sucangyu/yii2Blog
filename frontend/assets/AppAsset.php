<?php

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * Main frontend application asset bundle.
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot/frontend/web/';
    public $baseUrl = '@web/frontend/web/';
    public $css = [
        'statics/css/site.css',
        'statics/css/font-awesome.min.css',
    ];
    public $js = [
        'statics/js/site.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
