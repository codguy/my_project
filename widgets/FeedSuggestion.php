<?php

namespace app\widgets;

use app\models\Users;
use yii\helpers\Html;

class FeedSuggestion extends \yii\bootstrap4\Widget
{
    public $user;

    public function init()
    {
        parent::init();
        $this->user = Users::find()->cache(60)->limit(10);
    }

    public function run()
    {
        return $this->render('user_feed_suggestion', ['users' => $this->user]);
    }
}
