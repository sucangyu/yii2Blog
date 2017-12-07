<?php
namespace frontend\models;

use yii;
use yii\base\Model;
use common\models\User;

/**
 * Signup form
 */
class SignupForm extends Model
{
    public $username;
    public $email;
    public $password;
    public $rePassword;
    public $verifyCode;


    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['username', 'trim'],
            ['username', 'required'],
            ['username', 'unique', 'targetClass' => '\common\models\User', 'message' => '此用户名已被占用。'],
            ['username', 'string', 'min' => 3, 'max' => 15],
            ['username', 'match', 'pattern' => '/^[\w\_]{3,15}$/u', 'message' => '用户名是由英文、数字、下划线3-15位字符'],

            ['email', 'trim'],
            ['email', 'required'],
            ['email', 'email'],
            ['email', 'string', 'max' => 255],
            ['email', 'unique', 'targetClass' => '\common\models\User', 'message' => '这个电子邮件地址已被占用。'],

            [['password','rePassword'], 'required'],
            [['password','rePassword'], 'string', 'min' => 6],
            ['rePassword','compare','compareAttribute' => 'password','message' => '两次密码输入不一致.'],

            ['verifyCode', 'captcha'],

        ];
    }
    /*注册映射*/
    public function attributeLabels()
    {
        return [
            'username' => '用户名',
            'email' => yii::t('common','Email'),
            'password' => '密码',
            'rePassword' => '重复密码',
            'verifyCode' => '验证码',
        ];
    }

    /**
     * Signs user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function signup()
    {
        if (!$this->validate()) {
            return null;
        }
        
        $user = new User();
        $user->username = $this->username;
        $user->email = $this->email;
        $user->setPassword($this->password);
        $user->generateAuthKey();
        
        return $user->save() ? $user : null;
    }
}
