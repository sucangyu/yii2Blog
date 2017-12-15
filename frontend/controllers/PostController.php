<?php
namespace frontend\controllers;

use common\models\PostsModel;
use Yii;
use yii\web\Controller;
use frontend\models\PostForm;
use common\models\CatsModel;
use common\models\PostExtendsModel;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
/**
 * 文章控制器
 */
class PostController extends BaseController
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index', 'create','upload','ueditor'],
                'rules' => [
                    [
                        'actions' => ['index'],
                        'allow' => true,
                       // 'roles' => ['?'],
                    ],
                    [
                        'actions' => ['create','upload','ueditor'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    '*' => ['get','post'],
                    //'create' => ['get','post'],
                ],
            ],
        ];
    }
    /*扩展类-图片上传,百度编辑器*/
    public function actions()
    {
        return [
            'upload'=>[
                'class' => 'common\widgets\file_upload\UploadAction',     //这里扩展地址别写错
                'config' => [
                    'imagePathFormat' => "/image/{yyyy}{mm}{dd}/{time}{rand:6}",
                ]
            ],
            'ueditor'=>[
                'class' => 'common\widgets\ueditor\UeditorAction',
                'config'=>[
                    //上传图片配置
                    'imageUrlPrefix' => "", /* 图片访问路径前缀 */
                    'imagePathFormat' => "/image/{yyyy}{mm}{dd}/{time}{rand:6}", /* 上传保存路径,可以自定义保存路径和文件名格式 */
                ]
            ]
        ];
    }
    /**
     * 文章列表
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    /**
     * 添加文章
     */
    public function actionCreate()
    {
        $model = new PostForm();
        //定义场景
        $model->setScenario(PostForm::SCENARIOS_CAREATE);
//        var_dump(Yii::$app->request->post());
//        die;
        if($model->load(Yii::$app->request->post()) && $model->validate()){
            if(!$model->create()){
                Yii::$app->session->setFlash('warning', $model->_lastError);
            }else{
                return $this->redirect(['post/view','id'=>$model->id]);
            }
        } 
        
        //获取所有分类
        $cat = CatsModel::getAllCats();
        return $this->render('create',['model'=>$model,'cat'=>$cat]);
    }

    /**
     * 文章详情
     */
    public function actionView($id){
        $model = new PostForm();
        //获取文章详情
        $data = $model->getViewById($id);

        //统计文章附属值
        $modelPE = new PostExtendsModel();
        $modelPE->upCounter();
        return $this->render('view',['data'=>$data]);
    }


}
