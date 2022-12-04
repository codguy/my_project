<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%tbl_log}}".
 *
 * @property int $id
 * @property string $ip
 * @property string|null $action
 * @property string $message
 * @property int|null $created_by_id
 * @property string|null $created_on
 *
 * @property TblUser $createdBy
 */
class Log extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%tbl_log}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['ip', 'message'], 'required'],
            [['ip', 'action', 'message'], 'string'],
            [['created_by_id'], 'integer'],
            [['created_on'], 'safe'],
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
            'ip' => 'Ip',
            'action' => 'Action',
            'message' => 'Message',
            'created_by_id' => 'Created By ID',
            'created_on' => 'Created On',
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
