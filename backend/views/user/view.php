<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\User */

$this->title = $model->username;
$this->params['breadcrumbs'][] = ['label' => '用户', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('编辑', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('删除', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '你确定你要删除这个成员吗?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'username',
//            'auth_key',
//            'password_hash',
//            'password_reset_token',
//            'email_validate_token:email',
            'email:email',
            'role',
            'status'=>[
                'label'=>'状态',
                'attribute'=>'status',
                'value'=>function($model){
                    return ($model->status == 10)?'激活':'非激活';
                },
                'filter'=>['0'=>'非激活','10'=>'激活'],
            ],
            'avatar',
            'vip_lv',
            'created_at:datetime',
            'updated_at:datetime',
        ],
    ]) ?>

</div>
