<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%tbl_social_link}}".
 *
 * @property int $id
 * @property string $platform
 * @property string $link
 * @property string|null $created_on
 * @property int|null $created_by_id
 * @property string|null $updated_on
 *
 * @property TblUser $createdBy
 */
class SocialLink extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%tbl_social_link}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['platform', 'link'], 'required'],
            [['link'], 'string'],
            [['created_on', 'updated_on'], 'safe'],
            [['created_by_id'], 'integer'],
            [['platform'], 'string', 'max' => 255],
            [['created_by_id'], 'exist', 'skipOnError' => true, 'targetClass' => TblUser::class, 'targetAttribute' => ['created_by_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'platform' => 'Platform',
            'link' => 'Link',
            'created_on' => 'Created On',
            'created_by_id' => 'Created By ID',
            'updated_on' => 'Updated On',
        ];
    }

    /**
     * Gets query for [[CreatedBy]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCreatedBy()
    {
        return $this->hasOne(Users::class, ['id' => 'created_by_id']);
    }
}
