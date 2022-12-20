<?php

namespace app\components;

use app\models\Log;
use Yii;
use yii\console\Controller;

/**
 * UserController implements the CRUD actions for Users model.
 */
class NewConsoleController extends Controller
{
    public function ConsolePrint($message)
    {
        print_r($message);
        echo PHP_EOL;
    }
    
    public function Consolereturn($message)
    {
        echo json_encode($message);
    }
    
    public function actionLog($message)
    {
        $log = new Log();
        print_r($message);die;
        $log->ip = Yii::$app->request->getUserIP();
        $log->action = $_SERVER['REQUEST_URI'];
        $log->message = implode('&NewLine;', $this->messages[0]);
        $log->type_id = 1;
        $log->created_by_id = Yii::$app->user->getId();
        $log->created_on = date('Y-m-d H:i:s');
        if(!$log->save()){
            echo '<pre>';
            print_r($log->getErrors());die;
        }
    }
}
