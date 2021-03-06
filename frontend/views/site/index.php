<?php

/* @var $this yii\web\View */
use frontend\widgets\banner\BannerWidget;
use frontend\widgets\post\PostWidget;
use yii\base\Widget;
use frontend\widgets\chat\ChatWidget;
use frontend\widgets\hot\HotWidget;
use frontend\widgets\tag\TagWidget;
use frontend\widgets\search\SearchWidget;
use frontend\widgets\calendar\CalendarWidget;

$this->title = '博客-首页';
?>

<div class="row">
    <div class="col-lg-9">
        <!-- 图片轮播 -->
        <?=BannerWidget::widget()?>
        <!-- 文章列表 -->
        <?=PostWidget::widget()?>
    </div>
    <div class="col-lg-3">
        <!--搜索-->
        <?=SearchWidget::widget()?>
        <!-- 留言组件 -->
        <?=ChatWidget::widget()?>
        <!-- 热门浏览 -->
        <?=HotWidget::widget()?>
        <!-- 日历 -->
        <?=CalendarWidget::widget()?>
        <!--标签云-->
        <?//=TagWidget::widget()?>
    </div>
</div>