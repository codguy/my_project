<?php
namespace app\models;

use Yii;
use app\components\NewActiveRecord;

/**
 * This is the model class for table "{{%tbl_action_log}}".
 *
 * @property int $id
 * @property string|null $status
 * @property int $controller
 * @property int $action
 * @property int $params
 * @property int $type
 * @property string|null $created_on
 * @property int|null $created_by_id
 *
 * @property TblUser $createdBy
 */
class ActionLog extends NewActiveRecord
{

    /**
     *
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%tbl_action_log}}';
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
                    'controller',
                    'action',
                    'params',
                    'type'
                ],
                'required'
            ],
            [
                [
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
                    'status',
                    'controller',
                    'action',
                    'params',
                    'type',
                ],
                'string',
                'max' => 1000
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
            'status' => Yii::t('app', 'Status'),
            'controller' => Yii::t('app', 'Controller'),
            'action' => Yii::t('app', 'Action'),
            'params' => Yii::t('app', 'Params'),
            'type' => Yii::t('app', 'Type'),
            'created_on' => Yii::t('app', 'Created On'),
            'created_by_id' => Yii::t('app', 'Created By ID')
        ];
    }

    /**
     * Gets query for [[CreatedBy]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCreatedBy()
    {
        return $this->hasOne(Users::class, [
            'id' => 'created_by_id'
        ]);
    }
}
