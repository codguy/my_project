<?php
namespace app\models\search;

use app\models\ActionLog as ActionLogModel;
use yii\base\Model;
use yii\data\ActiveDataProvider;

/**
 * ActionLog represents the model behind the search form of `app\models\ActionLog`.
 */
class ActionLog extends ActionLogModel
{

    /**
     *
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [
                [
                    'id'
                ],
                'integer'
            ],
            [
                [
                    'controller',
                    'action',
                    'params',
                    'type',
                    'status',
                    'created_on',
                    'created_by_id'
                ],
                'safe'
            ]
        ];
    }

    /**
     *
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = ActionLogModel::find()->orderBy('id desc');

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query
        ]);

        $this->load($params);

        if (! $this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'params' => $this->params,
            'created_on' => $this->created_on,
            'created_by_id' => $this->created_by_id
        ]);

        $query->andFilterWhere([
            'like',
            'controller',
            $this->controller
        ]);
        $query->andFilterWhere([
            'like',
            'created_by_id',
            $this->created_by_id
        ]);
        $query->andFilterWhere([
            'like',
            'action',
            $this->action
        ]);
        $query->andFilterWhere([
            'like',
            'type',
            $this->type
        ]);
        $query->andFilterWhere([
            'like',
            'status',
            $this->status
        ]);

        return $dataProvider;
    }
}
