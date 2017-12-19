<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\TagsModel */

$this->title = '更新标签: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => '标签管理', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->tag_name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = '更新';
?>
<div class="tags-model-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
