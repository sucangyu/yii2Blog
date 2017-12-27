<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use backend\models\LoginForm;
use common\models\PostExtendsModel;
use common\models\TagsModel;

/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        //查询排名前5的文章浏览量
        $peModel = new PostExtendsModel();
        //查询语句
        $num1 = $peModel->find()->with('extend')->orderBy (['browser'=>SORT_DESC])->limit(5)->asArray()->all();
        foreach ($num1 as $key=>$re1){
            $res1[$key]['name'] = $re1['extend']['title'];
            $res1[$key]['y'] = intval ($re1['browser']);
        }
        $arr1 = json_encode ($res1);
//        var_dump ($arr1);
//        die;
        //查询排名前10标签关联文章量
        $tModel = new TagsModel();
        $num2 = $tModel->find()->orderBy (['post_num'=>SORT_DESC])->limit(10)->asArray()->all();
        foreach ($num2 as $key=>$re2){
            $res2[$key]['name'] = $re2['tag_name'];
            $res2[$key]['y'] = intval ($re2['post_num']);
        }
        $arr2 = json_encode ($res2);
        return $this->render('index',[
            'posts'=>$arr1,
            'tags'=>$arr2,
        ]);
    }

    /**
     * Login action.
     *
     * @return string
     */
    public function actionLogin()
    {
        $this->layout = 'login.php';
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        } else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Logout action.
     *
     * @return string
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }
}
