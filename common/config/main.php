<?php
return [
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'language' => 'zh-CN',
    'components' => [
    	'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=w.rdc.sae.sina.com.cn;dbname=app_notname',
            'username' => 'mxl5z0lkjz',
            'password' => 'kzwyzxjzjywz4jhhxz35kw5iwz3kkkm5wxwh3w2j',
            'charset' => 'utf8',
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
    ],
];
