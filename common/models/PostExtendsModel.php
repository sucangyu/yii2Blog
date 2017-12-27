<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "post_extends".
 *
 * @property integer $id
 * @property integer $post_id
 * @property integer $browser
 * @property integer $collect
 * @property integer $praise
 * @property integer $comment
 */
class PostExtendsModel extends BaseModel
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'post_extends';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['post_id', 'browser', 'collect', 'praise', 'comment'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'post_id' => Yii::t('app', 'Post ID'),
            'browser' => Yii::t('app', 'Browser'),
            'collect' => Yii::t('app', 'Collect'),
            'praise' => Yii::t('app', 'Praise'),
            'comment' => Yii::t('app', 'Comment'),
        ];
    }

    /**
     *更新文章统计
     */
    public function upCounter($cond,$attbute,$num){
        $counter = $this->findOne($cond);
        if (!$counter){
            $this->setAttributes($cond);
            $this->$attbute = $num;
            $this->save();
        }else{
            $countData[$attbute] = $num;
            $counter->updateCounters($countData);
        }
    }
    /**
     * 文章数据关联关系
     */
    public function getExtend(){
        return $this->hasOne(PostsModel::className(),['id'=>'post_id']);

    }

}
