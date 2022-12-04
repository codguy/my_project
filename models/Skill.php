<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%tbl_skill}}".
 *
 * @property int $id
 * @property string|null $model
 * @property int $model_id
 * @property string $skill
 * @property string|null $created_on
 * @property int|null $created_by_id
 * @property string|null $updated_on
 *
 * @property TblUser $createdBy
 */
class Skill extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%tbl_skill}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['model_id', 'skill'], 'required'],
            [['model_id', 'created_by_id'], 'integer'],
            [['created_on', 'updated_on'], 'safe'],
            [['model'], 'string', 'max' => 255],
            [['skill'], 'string', 'max' => 25],
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
            'model' => 'Model',
            'model_id' => 'Model ID',
            'skill' => 'Skill',
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
        return $this->hasOne(users::class, ['id' => 'created_by_id']);
    }
}
