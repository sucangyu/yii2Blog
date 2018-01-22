<?php

/* @var $this yii\web\View */
use frontend\widgets\post\PostWidget;
use yii\base\Widget;
use frontend\widgets\hot\HotWidget;
use yii\helpers\Url;
use frontend\widgets\tag\TagWidget;
?>
<div class="row">
    <div class="col-lg-9">
        <?=PostWidget::widget(['title'=>'最新的文章','limit'=>6])?>
    </div>
    <div class="col-lg-3">
        <div class="panel">
            <a class="btn btn-success btn-lg btn-block" href="<?=Url::to(['post/create'])?>">创建文章</a>
        </div>
        <!-- 热门浏览 -->
        <?=HotWidget::widget()?>
        <!--标签云-->
        <?=TagWidget::widget()?>
    </div>
</div>
