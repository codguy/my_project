<?php

namespace app\widgets;

use app\models\Feed;
use app\models\image;
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
        $images = image::find()->cache(30)->where([
            'model' => Feed::class
        ])->limit(9);
        return $this->render('user_photos_view', ['user' => $this->user, 'images' => $images]);
    }
}
