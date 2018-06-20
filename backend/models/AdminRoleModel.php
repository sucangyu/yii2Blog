<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "admin_role".
 *
 * @property integer $id
 * @property integer $aid
 * @property integer $role_id
 * @property string $created_time
 */
class AdminRoleModel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'admin_role';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'aid', 'role_id'], 'integer'],
            [['aid', 'role_id'], 'required'],
            [['created_time'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'aid' => Yii::t('app', 'Aid'),
            'role_id' => Yii::t('app', 'Role ID'),
            'created_time' => Yii::t('app', 'Created Time'),
        ];
    }
}
