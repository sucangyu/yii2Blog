<?php

use miloschuman\highcharts\Highcharts;
/* @var $this yii\web\View */

$this->title = '博客后台管理系统';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container-fluid">
    <div class="col-lg-6">
        <?php
        echo Highcharts::widget ( [
            'options' => '{
                "chart": {
                    "plotBackgroundColor": null,
                    "plotBorderWidth": null,
                    "plotShadow": true
                },
                "title": {
                    "text": "标签使用前十次数"
                },
                "tooltip": {
                    "pointFormat": "{series.name}: <b>{point.y:.1f}次</b>"
                },
                "xAxis": {
                    "type": "category"
                },
                "yAxis": {
                    "title": {
                        "text": "Total percent market share"
                    }

                },
                "legend": {
                    "enabled": false
                },
                "plotOptions": {
                    "series": {
                        "borderWidth": 0,
                        "dataLabels": {
                            "enabled": true,
                            "format": "{point.y}次"
                        }
                    }
                },
                "series": [{
                    "type": "column",
                    "name": "浏览",
                    "colorByPoint": true,
                    "data": '.$posts.'
                }],
                "drilldown": {
                    
                }
            }'
        ]);

        ?>
    </div>
    <div class="col-lg-6">
        <?php
        echo Highcharts::widget ( [
            'options' => '{
                "chart": {
                    "plotBackgroundColor": null,
                    "plotBorderWidth": null,
                    "plotShadow": true
                },
                "title": {
                    "text": "排前5浏览的文章"
                },
                "tooltip": {
                    "pointFormat": "{series.name}: <b>{point.y:.1f}次</b>"
                },
                "xAxis": {
                    "type": "category"
                },
                "yAxis": {
                    "title": {
                        "text": "Total percent market share"
                    }

                },
                "legend": {
                    "enabled": false
                },
                "plotOptions": {
                    "series": {
                        "borderWidth": 0,
                        "dataLabels": {
                            "enabled": true,
                            "format": "{point.y}次"
                        }
                    }
                },
                "series": [{
                    "type": "column",
                    "name": "浏览",
                    "colorByPoint": true,
                    "data": '.$tags.'
                }],
                "drilldown": {
                    
                }
            }'
        ]);
        
        ?>
    </div>


</div>