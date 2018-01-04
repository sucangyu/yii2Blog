<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "t_user_sign".
 *
 * @property string $id
 * @property string $user_id
 * @property integer $signcount
 * @property integer $count
 * @property string $lastModifyTime
 * @property string $signHistoy
 */
class TUserSignModel extends BaseModel
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 't_user_sign';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'signcount', 'count'], 'integer'],
            [['lastModifyTime'], 'safe'],
            [['signHistoy'], 'string', 'max' => 500],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'user_id' => Yii::t('app', 'User ID'),
            'signcount' => Yii::t('app', 'Signcount'),
            'count' => Yii::t('app', 'Count'),
            'lastModifyTime' => Yii::t('app', 'Last Modify Time'),
            'signHistoy' => Yii::t('app', 'Sign Histoy'),
        ];
    }
}
