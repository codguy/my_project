<?php
namespace app\widgets;

use app\models\Feed;
use app\models\Users;
use Yii;
use yii\data\ActiveDataProvider;

class FlashMessage extends \yii\bootstrap4\Widget
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
        return $this->render('flash_message');
    }
}
