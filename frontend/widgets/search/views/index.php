<?php
use yii\helpers\Url;
use kartik\select2\Select2;
?>
<div class="panel">
<!-- 搜索文章 -->
<div class="panel-title box-title">
    <span><strong>搜索文章</strong></span>
<!--    <span class="pull-right"><a href="#" class="font-12">更多》</a></span>-->
</div>

<div class="panel-body">
    <form action="/" id="w1" method="post">
        <div class="form-group input-group field-search-title search">
            <input type="hidden" value="<?php echo Yii::$app->request->csrfToken; ?>" name="_csrf" >
            <?= Select2::widget([
                'name' => 'title',
                'value' => '',
                'data' => $data,
                'options' => ['multiple' => false, 'placeholder' => '文章标题','id'=>'feed-content','class'=>'form-control'],
            ]);
            ?>
            <span class="input-group-btn">
                <button type="button" data-url="<?=Url::to(['site/postsearch'])?>" class="btn btn-success j-search"" style="width: auto;height:34px;">搜索</button>
            </span>
        </div>
    </form>
</div>
</div>