<?php

namespace app\components;

use app\models\Log;
use Yii;
use yii\log\DbTarget;

class LogDB extends DbTarget
{

    //overwrite export();
    public function export()
    {
        $log = new Log();
        $log->ip = Yii::$app->request->getUserIP();
        $log->action = $_SERVER['REQUEST_URI'];
        $log->message = implode('&NewLine;', $this->messages[0]);
//         $log->message = json_encode($this->messages[0]);
        $log->type_id = 0;
        $log->created_by_id = Yii::$app->user->getId();
        $log->created_on = date('Y-m-d H:i:s');
        if(!$log->save(false)){
            echo '<pre>';
            var_dump($log);die;
        }
    }
}
