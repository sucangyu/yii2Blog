<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;
/* @var $this yii\web\View */
/* @var $searchModel common\models\PostsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '文章管理';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="posts-model-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?php Html::a('添加', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'title'=>[
                'attribute'=>'title',
                'format'=>'raw',
                'value'=>function($model){
                    return '<a href="http://blog.app'.Url::to(['post/view','id'=>$model->id]).'">'.$model->title.'</a>';
                }
            ],
            'summary',
            //'content:ntext',
            //'label_img',
             'cat_id'=>[
                     'label'=>'分类',
                     'attribute'=>'cat_id',
                     'value'=>'cat.cat_name',
             ],
            // 'user_id',
            'user_name',
            'is_valid'=>[
                'label'=>'是否发布',
                'attribute'=>'is_valid',
                'value'=>function($model){
                    return ($model->is_valid == 1)?'有效':'无效';
                },
                'filter'=>['0'=>'无效','1'=>'有效'],
            ],
            'created_at:datetime',
            // 'updated_at',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
