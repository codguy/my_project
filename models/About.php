<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%tbl_about}}".
 *
 * @property int $id
 * @property int $state_id
 * @property string $intro
 * @property string $address
 * @property string $education
 * @property string $location
 * @property string $work
 * @property string $hobbies
 * @property int $created_by_id
 * @property string|null $created_on
 * @property string|null $updated_on
 *
 * @property TblUser $createdBy
 */
class About extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%tbl_about}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['state_id', 'intro', 'address', 'education', 'location', 'work', 'hobbies', 'created_by_id'], 'required'],
            [['state_id', 'created_by_id'], 'integer'],
            [['intro', 'address', 'education', 'location', 'work', 'hobbies'], 'string'],
            [['created_on', 'updated_on'], 'safe'],
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
            'state_id' => 'State ID',
            'intro' => 'Intro',
            'address' => 'Address',
            'education' => 'Education',
            'location' => 'Location',
            'work' => 'Work',
            'hobbies' => 'Hobbies',
            'created_by_id' => 'Created By ID',
            'created_on' => 'Created On',
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
        return $this->hasOne(TblUser::class, ['id' => 'created_by_id']);
    }
}
