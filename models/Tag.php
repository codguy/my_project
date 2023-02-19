<?php
namespace app\models;

use Yii;
use app\components\NewActiveRecord;

/**
 * This is the model class for table "{{%tbl_tag}}".
 *
 * @property int $id
 * @property string $tags
 * @property string|null $model
 * @property int|null $model_id
 * @property int|null $created_by_id
 * @property string|null $created_on
 *
 * @property TblUser $createdBy
 */
class Tag extends NewActiveRecord
{

    /**
     *
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%tbl_tag}}';
    }

    /**
     *
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [
                [
                    'tags'
                ],
                'required'
            ],
            [
                [
                    'model_id',
                    'created_by_id'
                ],
                'integer'
            ],
            [
                [
                    'created_on'
                ],
                'safe'
            ],
            [
                [
                    'tags'
                ],
                'string',
                'max' => 20
            ],
            [
                [
                    'model'
                ],
                'string',
                'max' => 15
            ],
            [
                [
                    'created_by_id'
                ],
                'exist',
                'skipOnError' => true,
                'targetClass' => Users::class,
                'targetAttribute' => [
                    'created_by_id' => 'id'
                ]
            ]
        ];
    }

    /**
     *
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'tags' => Yii::t('app', 'Tags'),
            'model' => Yii::t('app', 'Model'),
            'model_id' => Yii::t('app', 'Model ID'),
            'created_by_id' => Yii::t('app', 'Created By ID'),
            'created_on' => Yii::t('app', 'Created On')
        ];
    }

    /**
     * Gets query for [[CreatedBy]].
     *
     * @return \yii\db\ActiveQuery|yii\db\ActiveQuery
     */
    public function getCreatedBy()
    {
        return $this->hasOne(Users::class, [
            'id' => 'created_by_id'
        ]);
    }

    /**
     *
     * {@inheritdoc}
     * @return TagQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new TagQuery(get_called_class());
    }
}
