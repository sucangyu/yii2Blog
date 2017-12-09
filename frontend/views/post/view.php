<?php

/* @var $this yii\web\View */
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
$this->title = '创建文章';
$this->params['breadcrumbs'][] = ['label'=>'文章','url'=>['post/index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="row">
	<div class="col-lg-9">
		<div class="panel-title box-title">
			<span>创建文章</span>
		</div>
		<div class="panel-body">
			<?php $form = ActiveForm::begin(['id' => 'contact-form']); ?>

                <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'cat_id')->dropDownlist($cat) ?>

                <?= $form->field($model, 'label_img')->widget('common\widgets\file_upload\FileUpload',[
			        'config'=>[
			            //图片上传的一些配置，不写调用默认配置
			            //'domain_url' => 'http://www.yii-china.com',
			        ]
			    ]) ?>

                <?= $form->field($model, 'content')->widget('common\widgets\ueditor\Ueditor',[
				    'options'=>[
				        'initialFrameHeight' => 400,
				        //'toolbars' => '',//百度编辑器功能
				    ]
				]) ?>


                <?= $form->field($model, 'tags')->widget('common\widgets\tags\TagWidget') ?>

                <div class="form-group">
                    <?= Html::submitButton('发布', ['class' => 'btn btn-primary', 'name' => 'contact-button']) ?>
                </div>

            <?php ActiveForm::end(); ?>
		</div>
	</div>
	<div class="col-lg-3">
		<div class="panel-title box-title">
			<span>注意事项</span>
		</div>
		<div class="panel-body">
			<p>1:dasgdfsag</p>
			<p>1:dasgdfsag</p>
			<p>1:dasgdfsag</p>
		</div>
	</div>
</div>









