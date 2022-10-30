<?php

namespace app\widgets;

use yii\helpers\Html;

class UserPhotos extends \yii\bootstrap4\Widget
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
        return $this->render('user_photos_view', ['user' => $this->user]);
    }
}
