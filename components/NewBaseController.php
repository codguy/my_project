<?php
namespace app\components;

use app\models\Log;
use Yii;
use yii\filters\AccessControl;
use yii\filters\AccessRule;
use yii\web\Controller;
use app\models\ActionLog;

/**
 * UserController implements the CRUD actions for Users model.
 */
class NewBaseController extends Controller
{

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'ruleConfig' => [
                    'class' => AccessRule::className()
                ],
                'rules' => [
                    [
                        'actions' => [
                            'clear-cache',
                            'create-backup',
                            'data-backup'
                        ],
                        'allow' => true
                    ]
                ]
            ]
        ];
    }

    public $logMessage = NULL;

    public $writeLog = false;

    public function beforeAction($action)
    {
        if ($action->id == 'ignore' || $action->id == 'accept') {
            $this->enableCsrfValidation = false;
        }

        // Yii::$app->session->setFlash('error', \Yii::$app->controller->id.'/'.$action->id);
        return parent::beforeAction($action);
    }

    public function afterAction($action, $result)
    {
        $result = parent::afterAction($action, $result);
        $params = [
            'GET' => \Yii::$app->request->get(),
            'POST' => \Yii::$app->request->post()
        ];
        $log = new ActionLog();
        $log->status = Yii::$app->response->statusCode;
        $log->controller = Yii::$app->controller->id;
        $log->action = Yii::$app->controller->action->id;
        $log->params = json_encode($params, JSON_PRETTY_PRINT);
        $log->type = \Yii::$app->getRequest()->getMethod();
        $log->save(false);
        return $result;
    }

    public function array_to_string($array_attributes)
    {
        $dataAttributes = array_map(function ($value, $key) {
            if (!is_array($key)) {
                return '&emsp;' . $key . '=>' . $value . ' <br>';
            }
        }, array_values($array_attributes), array_keys($array_attributes));

        $dataAttributes = implode(' ', $dataAttributes);
        return $dataAttributes;
    }

    public function actionClearCache()
    {
        Yii::$app->cache->flush();
        Yii::$app->session->setFlash('success', 'Cache cleared');
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
        // save file
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
        // save file
        $handle = fopen($filepath, 'w+');
        fwrite($handle, $return);
        fclose($handle);
    }
}
