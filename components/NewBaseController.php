<?php

namespace app\components;

use Yii;
use yii\web\Controller;

/**
 * UserController implements the CRUD actions for Users model.
 */
class NewBaseController extends Controller
{
    public $logMessage = NULL;

    public $writeLog = false;

    public function beforeAction($action)
    {
        if ($action->id == 'ignore' || $action->id == 'accept') {
            $this->enableCsrfValidation = false;
        }
        //return true;
        return parent::beforeAction($action);
    }

    // public function afterAction($action, $result)
    // {
    //     $response = $result;
    //     return $result;
    // }


    public function actionClearCache()
    {
        Yii::$app->cache->flush();
        Yii::$app->session->getFlash('error', 'Cache cleared');
        return $this->goHome();
    }
    public static function actionCreateBackup($tables = '*', $filepath = BASE_PATH . '/../db/backup.sql')
    {
        if ($tables == '*') {
            $tables = array();
            $tables = Yii::$app->db->schema->getTableNames();
        } else {
            $tables = is_array($tables) ? $tables : explode(',', $tables);
        }
        $return = '';
        foreach ($tables as $table) {
            $result = Yii::$app->db->createCommand('SELECT * FROM ' . $table)->query();
            $return .= 'DROP TABLE IF EXISTS ' . $table . ';';
            $row2 = Yii::$app->db->createCommand('SHOW CREATE TABLE ' . $table)->queryAll();
            $return .= "\n\n" . $row2[0]['Create Table'] . ";\n\n";
            foreach ($result as $row) {
                $return .= 'INSERT INTO ' . $table . ' VALUES(';
                foreach ($row as $data) {
                    $data = addslashes($data);
                    $data = preg_replace("/\n/", "\\n", $data);
                    if (isset($data)) {
                        $return .= '"' . $data . '"';
                    } else {
                        $return .= '""';
                    }
                    $return .= ',';
                }
                $return = substr($return, 0, strlen($return) - 1);
                $return .= ");\n";
            }
            $return .= "\n\n\n";
        }
        //save file
        // $handle = fopen($filepath, 'w+');
        // fwrite($handle, $return);
        // fclose($handle);
        header('Content-Type: application/download');
        header('Content-Disposition: attachment; filename="example.sql"');
        header("Content-Length: " . filesize("example.sql"));

        $handle = fopen($filepath, 'w+');
        fwrite($handle, $return);
        fclose($handle);
    }

    public static function actionDataBackup($tables = '*', $filepath = BASE_PATH . '/../db/data.sql')
    {
        if ($tables == '*') {
            $tables = array();
            $tables = Yii::$app->db->schema->getTableNames();
        } else {
            $tables = is_array($tables) ? $tables : explode(',', $tables);
        }
        $return = '';
        foreach ($tables as $table) {
            $result = Yii::$app->db->createCommand('SELECT * FROM ' . $table)->query();
            $row2 = Yii::$app->db->createCommand('SHOW CREATE TABLE ' . $table)->queryAll();
            foreach ($result as $row) {
                $return .= 'INSERT INTO ' . $table . ' VALUES(';
                foreach ($row as $data) {
                    $data = addslashes($data);
                    $data = preg_replace("/\n/", "\\n", $data);
                    if (isset($data)) {
                        $return .= '"' . $data . '"';
                    } else {
                        $return .= '""';
                    }
                    $return .= ',';
                }
                $return = substr($return, 0, strlen($return) - 1);
                $return .= ");\n";
            }
            $return .= "\n\n\n";
        }
        //save file
        $handle = fopen($filepath, 'w+');
        fwrite($handle, $return);
        fclose($handle);
    }
}
