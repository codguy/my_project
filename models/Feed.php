<?php

namespace app\models;

use app\components\NewActiveRecord;
use Yii;

/**
 * This is the model class for table "{{%tbl_feed}}".
 *
 * @property int $id
 * @property string $title
 * @property string|null $desciption
 * @property string|null $created_on
 * @property int|null $created_by_id
 * @property string|null $updated_on
 *
 * @property TblUser $createdBy
 */
class Feed extends NewActiveRecord
{
    public $image;
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%tbl_feed}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title'], 'required'],
            [['desciption'], 'string'],
            [['created_on', 'updated_on'], 'safe'],
            [['created_by_id'], 'integer'],
            [['title'], 'string', 'max' => 50],
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
            'title' => 'Title',
            'desciption' => 'Desciption',
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
