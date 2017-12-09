<?php
namespace frontend\models;

use yii;
use yii\base\Model;
use common\models\PostsModel;

/**
 * Login form
 */
class PostForm extends Model
{
    public $id;
    public $title;
    public $content;
    public $label_img;
    public $cat_id;
    public $tags;

    public $_lastError = "";


    /*
        定义场景
        SCENARIOS_CAREATE创建
        SCENARIOS_UPDATE更新
    */

    const SCENARIOS_CAREATE = 'careate'; //创建文章
    const SCENARIOS_UPDATE = 'update';   //更新文章

    /*场景设置*/
    public function scenarios()
    {
        $scenarios = [
            self::SCENARIOS_CAREATE=>['title','content','label_img','cat_id'],
            self::SCENARIOS_UPDATE=>['title','content','label_img','cat_id'],
        ];
        return array_merge(parent::scenarios(),$scenarios);
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            // 必填
            [['id', 'title','content','cat_id'], 'required'],
            // 整形
            [['id','cat_id'], 'integer'],
            // 标题长度
            ['title', 'string','min'=>4,'max'=>50],
        ];
    }

    /*文章映射*/
    public function attributeLabels()
    {
        return [
            'id' => '编码',
            'title' => '标题',
            'content' => '内容',
            'label_img' => '标签图',
            'tags' => '标签',
            'cat_id' => '分类',
        ];
    }
    /**
     * Validates the password.
     * This method serves as the inline validation for password.
     *
     * @param string $attribute the attribute currently being validated
     * @param array $params the additional name-value pairs given in the rule
     */
    public function validatePassword($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $user = $this->getUser();
            if (!$user || !$user->validatePassword($this->password)) {
                $this->addError($attribute, 'Incorrect username or password.');
            }
        }
    }

    /**
     * Logs in a user using the provided username and password.
     *
     * @return bool whether the user is logged in successfully
     */
    public function login()
    {
        if ($this->validate()) {
            return Yii::$app->user->login($this->getUser(), $this->rememberMe ? 3600 * 24 * 30 : 0);
        } else {
            return false;
        }
    }


    /**
     * Finds user by [[username]]
     *
     * @return User|null
     */
    protected function getUser()
    {
        if ($this->_user === null) {
            $this->_user = User::findByUsername($this->username);
        }

        return $this->_user;
    }


    /*文章创建*/
    public function create()
    {
        $transaction = Yii::$app->db->beginTransaction();

        try {
            $model = new PostsModel();
            $model->setAttributes($this->attributes);
            $model->summary = $this->_getSummary();
            $model->user_id = Yii::$app->user->identity->id;
            $model->user_name = Yii::$app->user->identity->username;
            $model->is_valid = PostsModel::IS_VALID;
            $model->created_at = time();
            $model->updated_at = time();

            if(!$model->save()) {
                throw new \Exception("文章保存失败！");
            }
            $this->id = $model->id;
            //事件调用
            $this->_eventAfterCreate();

            $transaction->commit();
            return true;
        } catch (\Exception $e) {
            $transaction->rollBack();
            $this->_lastError = $e->getMessage();
            return false;
        }
    }


    /*私有文章简介截取方法*/
    private function _getSummary($s = 0,$e = 90,$char = 'utf-8')
    {
        if (empty($this->content)) {
            return null;
        }

        return (mb_substr(str_replace('&nbsp;', '', strip_tags($this->content)), $s, $e, $char));
    }

    /*创建完成后调用事件方法*/
    public function _eventAfterCreate()
    {

    }


}
