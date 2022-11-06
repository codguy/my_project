<?php

namespace app\models;

use app\components\NewActiveRecord;
use Yii;

/**
 * This is the model class for table "tbl_image".
 *
 * @property int $id
 * @property string $image
 * @property string|null $model
 * @property int $model_id
 * @property string|null $created_on
 * @property int|null $created_by_id
 * @property string|null $updated_on
 */
class image extends NewActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tbl_image';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'model_id'], 'required'],
            [['model_id', 'created_by_id'], 'integer'],
            [['created_on', 'updated_on'], 'safe'],
            [['name', 'model'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'model' => Yii::t('app', 'Model'),
            'model_id' => Yii::t('app', 'Model ID'),
            'created_on' => Yii::t('app', 'Created On'),
            'created_by_id' => Yii::t('app', 'Created By ID'),
            'updated_on' => Yii::t('app', 'Updated On'),
        ];
    }
}
