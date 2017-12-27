<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "posts".
 *
 * @property integer $id
 * @property string $title
 * @property string $summary
 * @property string $content
 * @property string $label_img
 * @property integer $cat_id
 * @property integer $user_id
 * @property string $user_name
 * @property integer $is_valid
 * @property integer $created_at
 * @property integer $updated_at
 */
class PostsModel extends BaseModel
{
    const IS_VALID = 1;   //已发布
    const NO_VALID = 0;   //未发布
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'posts';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'summary', 'content', 'cat_id', 'user_id', 'user_name', 'is_valid', 'created_at', 'updated_at'], 'required'],
            [['content'], 'string'],
            [['cat_id', 'user_id', 'is_valid', 'created_at', 'updated_at'], 'integer'],
            [['title', 'summary', 'label_img', 'user_name'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'title' => '标题',
            'summary' => '摘要',
            'content' => '内容',
            'label_img' => '标签图',
            'cat_id' => '分类',
            'user_id' => '用户ID',
            'user_name' => '用户名',
            'is_valid' => '是否发布',
            'created_at' => '发布时间',
            'updated_at' => '更新时间',
        ];
    }

    /**
     * 文章标签关联关系
     */
    public function getRelate(){
        return $this->hasMany(RelationPostTagsModel::className(),['post_id'=>'id']);

    }

    /**
     * 文章数据关联关系
     */
    public function getExtend(){
        return $this->hasOne(PostExtendsModel::className(),['post_id'=>'id']);

    }

    /**
     * 标签关联关系
     */
    public function getCat(){
        return $this->hasOne(CatsModel::className(),['id'=>'cat_id']);

    }
}
