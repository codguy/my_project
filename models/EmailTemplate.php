<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%tbl_email_tempalte}}".
 *
 * @property int $id
 * @property int $title
 * @property string $html
 * @property string $json
 * @property int $created_by_id
 * @property string|null $created_on
 * @property string|null $updated_on
 *
 * @property TblUser $createdBy
 */
class EmailTemplate extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%tbl_email_tempalte}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title', 'html', 'json', 'created_by_id'], 'required'],
            [['created_by_id'], 'integer'],
            [['html','title', 'json'], 'string'],
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
            'title' => 'Title',
            'html' => 'Html',
            'json' => 'Json',
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
        return $this->hasOne(Users::class, ['id' => 'created_by_id']);
    }
}
