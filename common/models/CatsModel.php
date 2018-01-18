<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "cats".
 *
 * @property integer $id
 * @property string $cat_name
 * @property integer $pid
 * @property integer $sort
 * @property integer $created_at
 */
class CatsModel extends BaseModel
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cats';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cat_name', 'pid', 'sort', 'created_at'], 'required'],
            [['pid', 'sort', 'created_at'], 'integer'],
            [['cat_name'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'cat_name' => '分类名称',
            'pid' => '父ID',
            'sort' => '排序',
            'created_at' => '添加时间',
        ];
    }


    /*获取所有分类*/
    public static function getAllCats(){
        $cat = ['0' => '请选择文章分类'];
        $res = self::find()->asArray()->all();
        if ($res) {
            foreach ($res as $key => $list) {
                $cat[$list['id']] = $list['cat_name'];
            }
        }
        return $cat;
    }
}
