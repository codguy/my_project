<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tbl_email_tempalte".
 *
 * @property int $id
 * @property int $type_id
 * @property string $html
 * @property string $json
 * @property int $created_by
 * @property string|null $created_on
 * @property string|null $updated_on
 */
class EmailTemplate extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tbl_email_tempalte';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['type_id', 'html', 'json', 'created_by'], 'required'],
            [['type_id', 'created_by'], 'integer'],
            [['html', 'json'], 'string'],
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
            'type_id' => 'Type ID',
            'html' => 'Html',
            'json' => 'Json',
            'created_by' => 'Created By',
            'created_on' => 'Created On',
            'updated_on' => 'Updated On',
        ];
    }
}
