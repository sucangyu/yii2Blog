<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "access".
 *
 * @property integer $id
 * @property string $title
 * @property string $urls
 * @property integer $status
 * @property string $update_time
 * @property string $created_time
 */
class AccessModel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'access';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'urls'], 'required'],
            [['status'], 'integer'],
            [['update_time', 'created_time'], 'safe'],
            [['title'], 'string', 'max' => 50],
            [['urls'], 'string', 'max' => 10000],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'title' => Yii::t('app', 'Title'),
            'urls' => Yii::t('app', 'Urls'),
            'status' => Yii::t('app', 'Status'),
            'update_time' => Yii::t('app', 'Update Time'),
            'created_time' => Yii::t('app', 'Created Time'),
        ];
    }
}
