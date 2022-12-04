<?php

namespace app\widgets;

use app\models\Feed;
use app\models\Users;
use yii\helpers\Html;

class CreateFeed extends \yii\bootstrap4\Widget
{
    public $model;

    public function init()
    {
        parent::init();
        $this->model = new Feed();
    }

    public function run()
    {
        return $this->render('feeds_form', ['model' => $this->model]);
    }
}
