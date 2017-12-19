<?php
use yii\helpers\Url;
?>
<div class="panel">
<!-- 只言片语 -->
<div class="panel-title box-title">
    <span><strong>只言片语</strong></span>
    <span class="pull-right"><a href="#" class="font-12">更多》</a></span>
</div>

<div class="panel-body">
    <form action="/" id="w0" method="post">
        <div class="form-group input-group field-feed-content required">
            <textarea id="feed-content" class="form-control" name="content" placeholder="我的留言" rows="" cols=""></textarea>
            <span class="input-group-btn">
                <button type="button" data-url="<?=Url::to(['site/add-feed'])?>" class="btn btn-primary j-feed"" style="width: auto;height:50px;">发表</button>
            </span>
        </div>
    </form>

    <?php if(!empty($data['feed'])):?>
        <ul class="media-list media-feed feed-index ps-container ps-active-y">
            <?php foreach($data['feed'] as $list):?>
                <li class="media">
                    <div class="media-left">
                        <a href="#" rel="author" data-original-title="" title="">
                            <img width="40px" src="<?=$list['user']['avatar'];?>"/>
                        </a>
                    </div>
                    <div class="media-body" style="font-size: 12px;">
                        <div class="media-content">
                            <span style="color: #00a0e9"><?=$list['user']['username']?></span> 说: <?=$list['content']?>
                        </div>
                        <div class="media-action">
                            <?=date('Y-m-d h:i:s',$list['created_at'])?>
                        </div>
                    </div>
                </li>


            <?php endforeach;?>
        </ul>

    <?php endif;?>
</div>
</div>