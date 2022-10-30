<?php

namespace app\widgets;

use yii\helpers\Html;

class FeedSuggestion extends \yii\bootstrap4\Widget
{
    public $user;

    public function init()
    {
        parent::init();
        if ($this->user === null) {
            $this->user = 'Welcome User';
        } else {
            $this->message = 'Welcome ' . $this->user;
        }
    }

    public function run()
    {
        return $this->render('user_feed_suggestion', ['user' => $this->user]);
    }
}
