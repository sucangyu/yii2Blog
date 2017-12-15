<?php

/* @var $this yii\web\View */
use frontend\widgets\post\PostWidget;
use yii\base\Widget;

?>
<div class="row">
    <div class="col-lg-9">
        <?=PostWidget::widget(['title'=>'最新的文章','limit'=>6])?>
    </div>
    <div class="col-lg-3"></div>
</div>
