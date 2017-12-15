<?php
return [
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'language' => 'zh-CN',
    'components' => [
        // 'cache' => [
        //     'class' => 'yii\caching\FileCache',
        // ],
        //cache to db缓存到db
        'cache' => [
            'class' => 'yii\caching\DbCache',
        ],
        //sea mysql配置sae的mysql
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=w.rdc.sae.sina.com.cn;dbname=app_notname',
            'username' => 'mxl5z0lkjz',
            'password' => 'kzwyzxjzjywz4jhhxz35kw5iwz3kkkm5wxwh3w2j',
            'charset' => 'utf8',
        ],
        // //use seastorage for assets使用sae发布资源
        // 'assetManager' =>[
        //     'class'=>'postor\sae\SaeAssetManager',
        //     'assetDomain'=>'assets',
        //     'converter' => [
        //         'class' => 'yii\web\AssetConverter',
        //     ],
        // ],
        // //log to db日志也修改到db
        // 'log' => [
        //     'traceLevel' => YII_DEBUG ? 3 : 0,
        //     'targets' => [
        //         [
        //             'class' => 'yii\log\DbTarget',
        //             'levels' => ['error', 'warning'],
        //         ],
        //     ],
        // ],
    ],
];
