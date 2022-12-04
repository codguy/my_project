<?php

namespace app\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\About as AboutModel;

/**
 * About represents the model behind the search form of `app\models\About`.
 */
class About extends AboutModel
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'state_id', 'created_by_id'], 'integer'],
            [['intro', 'address', 'education', 'location', 'work', 'hobbies', 'created_on', 'updated_on'], 'safe'],
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
        $query = AboutModel::find();

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
            'state_id' => $this->state_id,
            'created_by_id' => $this->created_by_id,
            'created_on' => $this->created_on,
            'updated_on' => $this->updated_on,
        ]);

        $query->andFilterWhere(['like', 'intro', $this->intro])
            ->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'education', $this->education])
            ->andFilterWhere(['like', 'location', $this->location])
            ->andFilterWhere(['like', 'work', $this->work])
            ->andFilterWhere(['like', 'hobbies', $this->hobbies]);

        return $dataProvider;
    }
}
