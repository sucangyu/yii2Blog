<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "role_access".
 *
 * @property integer $id
 * @property integer $role_id
 * @property integer $access_id
 * @property string $areated_time
 */
class RoleAccessModel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'role_access';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['role_id', 'access_id'], 'required'],
            [['role_id', 'access_id'], 'integer'],
            [['areated_time'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'role_id' => Yii::t('app', 'Role ID'),
            'access_id' => Yii::t('app', 'Access ID'),
            'areated_time' => Yii::t('app', 'Areated Time'),
        ];
    }
}
