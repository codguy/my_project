<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tbl_message".
 *
 * @property int $id
 * @property string $message
 * @property int $user_id
 * @property int $created_by
 * @property string|null $created_on
 * @property string|null $updated_on
 */
class Message extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tbl_message';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['message', 'user_id', 'created_by'], 'required'],
            [['message'], 'string'],
            [['user_id', 'created_by'], 'integer'],
            [['created_on', 'updated_on'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'message' => 'Message',
            'user_id' => 'User ID',
            'created_by' => 'Created By',
            'created_on' => 'Created On',
            'updated_on' => 'Updated On',
        ];
    }
}
