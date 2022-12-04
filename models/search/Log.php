<?php

namespace app\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Log as LogModel;

/**
 * Log represents the model behind the search form of `app\models\Log`.
 */
class Log extends LogModel
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'created_by_id'], 'integer'],
            [['ip', 'action', 'message', 'created_on'], 'safe'],
        ];
    }

    /**
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
        $query = LogModel::find()->orderBy(['id' => SORT_DESC]);

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'created_by_id' => $this->created_by_id,
            // 'created_on' => $this->created_on,
        ]);


        $query->andFilterWhere(['like', 'ip', $this->ip])
            ->andFilterWhere(['like', 'action', $this->action])
            ->andFilterWhere(['like', 'message', $this->message]);
        if (!empty($params['Log']) && !empty($params['Log']['created_on'])) {
            $time = explode(' - ', $params['Log']['created_on']);
            $query->andWhere([
                'between',
                'created_on',
                $time[0],
                $time[1]
            ]);
        }
        return $dataProvider;
    }
}
