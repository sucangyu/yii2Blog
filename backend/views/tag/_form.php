<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\TagsModel */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="tags-model-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'tag_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'post_num')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '添加' : '更新', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
