<?php

namespace app\widgets;

use app\models\Feed;
use app\models\Users;
use Yii;
use yii\data\ActiveDataProvider;
use yii\helpers\Html;
use yii\widgets\ListView;

class LoadFeed extends \yii\bootstrap4\Widget
{
    public $id;

    public function init()
    {
        parent::init();
        if ($this->id === null) {
            $this->id = Yii::$app->user->id;
        }
    }

    public function run()
    {
        $query = Feed::find()->where([
            'created_by_id' => $this->id
        ]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => [
                    'created_on' => SORT_DESC
                ]
            ]
        ]);

        if ($query->count() > Users::STATE_ZERO) {
            return $this->render('feeds_list', ['dataProvider' => $dataProvider]);
        }
    }
}
