<?php
namespace frontend\controllers;

use frontend\models\FeedForm;
use frontend\models\PostForm;
use Yii;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use frontend\models\LoginForm;
use frontend\models\PasswordResetRequestForm;
use frontend\models\ResetPasswordForm;
use frontend\models\SignupForm;
use frontend\models\ContactForm;
use common\models\TUserSignModel;

/**
 * Site controller
 */
class SiteController extends BaseController
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout', 'signup'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout'],
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
     * 扩展类-图片上传
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
            //图片上传扩展
            'upload'=>[
                'class' => 'common\widgets\file_upload\UploadAction',     //这里扩展地址别写错
                'config' => [
                    'imagePathFormat' => "/image/{yyyy}{mm}{dd}/{time}{rand:6}",
                ]
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        if (Yii::$app->user->isGuest) {
            return $this->actionLogin();
        }
        return $this->render('index');
    }

    /**
     * Logs in a user.
     *
     * @return mixed
     */
    public function actionLogin()
    {
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
     * Logs out the current user.
     *
     * @return mixed
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return mixed
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail(Yii::$app->params['adminEmail'])) {
                Yii::$app->session->setFlash('success', 'Thank you for contacting us. We will respond to you as soon as possible.');
            } else {
                Yii::$app->session->setFlash('error', 'There was an error sending your message.');
            }

            return $this->refresh();
        } else {
            return $this->render('contact', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Displays about page.
     *
     * @return mixed
     */
    public function actionAbout()
    {
        return $this->render('about');
    }

    /**
     * Signs user up.
     *
     * @return mixed
     */
    public function actionSignup()
    {
        $model = new SignupForm();
        if ($model->load(Yii::$app->request->post())) {
            if ($user = $model->signup()) {
                if (Yii::$app->getUser()->login($user)) {
                    return $this->goHome();
                }
            }
        }

        return $this->render('signup', [
            'model' => $model,
        ]);
    }

    /**
     * Requests password reset.
     *
     * @return mixed
     */
    public function actionRequestPasswordReset()
    {
        $model = new PasswordResetRequestForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail()) {
                Yii::$app->session->setFlash('success', 'Check your email for further instructions.');

                return $this->goHome();
            } else {
                Yii::$app->session->setFlash('error', 'Sorry, we are unable to reset password for the provided email address.');
            }
        }

        return $this->render('requestPasswordResetToken', [
            'model' => $model,
        ]);
    }

    /**
     * Resets password.
     *
     * @param string $token
     * @return mixed
     * @throws BadRequestHttpException
     */
    public function actionResetPassword($token)
    {
        try {
            $model = new ResetPasswordForm($token);
        } catch (InvalidParamException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->resetPassword()) {
            Yii::$app->session->setFlash('success', 'New password saved.');

            return $this->goHome();
        }

        return $this->render('resetPassword', [
            'model' => $model,
        ]);
    }


    /**
     * 添加留言
     */
    public function actionAddFeed(){
        $model = new FeedForm();
        $model->content = Yii::$app->request->post('content');
        if ($model->validate()){
            if ($model->create()){
                return json_encode(['status'=>true]);
            }
        }
        return json_decode(['status'=>false,'msg'=>'发布失败']);
    }


    /**
     * 文章搜索
     */
    public function actionPostsearch(){

        $p_id = Yii::$app->request->post('title');

        return $this->redirect(['post/view','id'=>$p_id]);
    }


    /**
     * 日历签到
     */
    public function actionTsign(){
        $model = new TUserSignModel();
        $de = intval (Yii::$app->request->post('de'));
        $where['singYM'] = strtotime (date ('Y-m-1'));//同一年同一月份
        $where['user_id'] = Yii::$app->user->identity->id;//用户id
        //检查同一年同一月份此用户是否创建了签到
        //ps:签到表是一人一年有12条,每一条存的是当月签到的日期
        $res = $model->find()->where($where)->one();

        if ($res){
            //本月已签过执行修改
            $dArr = json_decode ($res['signHistoy']);
            array_push($dArr, $de);//在签到数组末尾加上今日签到日期
            $res->count = $res['count']+1;
            $res->signHistoy = json_encode ($dArr);//接收签到日期
            if ($res->update()){
                return json_encode(['status'=>true]);
            }
            return json_decode(['status'=>false,'msg'=>'签到失败']);
        }else{
            //本月未签过执行添加
            $model->user_id = Yii::$app->user->identity->id;
            $model->signcount = 1;
            $model->count = 1;
            $model->lastModifyTime = date ('Y-m-d H:i:s');
            $model->signHistoy = json_encode (array('0'=>$de));//接收签到日期
            $model->singYM = $where['singYM'];

            if ($model->save ()){
                return json_encode(['status'=>true]);
            }
            return json_decode(['status'=>false,'msg'=>'签到失败']);
        }


        if ($model->validate()){
            if ($model->create()){

            }
        }

    }



}
