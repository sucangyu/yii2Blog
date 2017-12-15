<?php
namespace frontend\widgets\banner;
/**
 * 文章列表
 */
use yii;
use yii\base\Widget;
use common\models\PostsModel;
use frontend\models\PostForm;
use yii\helpers\Url;
use yii\data\Pagination;

class BannerWidget extends Widget
{
    public $item = [];//

    public function  init(){
        if (empty($this->item)){
            $this->item = [
                [
                    'label'=>'demo',
                    'img_url'=>'/statics/images/banner/b_0.png',
                    'url'=>['site/index'],
                    'html'=>'',
                    'active'=>'active',
                ],
                ['label'=>'demo','img_url'=>'/statics/images/banner/b_1.png','url'=>['site/index'],'html'=>''],
                ['label'=>'demo','img_url'=>'/statics/images/banner/b_2.png','url'=>['site/index'],'html'=>''],
            ];
        }
    }
    public function run()
    {
        $data['items'] = $this->item;
        return $this->render('index',['data'=>$data]);
    }
    

}