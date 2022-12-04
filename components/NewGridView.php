<?php

namespace app\components;

use Yii;
use yii\grid\GridView;

class NewGridView extends GridView
{
    public $Export = false;

    public $enable_row_click = false;

    public function export($action)
    {
        $html = $this->renderItems();
        print_r($html);die;
        $file_name = "file_name.xls";
        $excel_file = "Your Html Table Code";
        header("Content-type: application/vnd.ms-excel");
        header("Content-Disposition: attachment; filename=$file_name");
        echo $excel_file;
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
