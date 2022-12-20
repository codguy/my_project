<?php

/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */
namespace app\commands;

use app\components\NewConsoleController;

/**
 * This command echoes the first argument that you have entered.
 *
 * This command is provided as an example for you to learn how to create console commands.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class HelloController extends NewConsoleController
{

    /**
     * This command echoes what you have entered as the message.
     *
     * @param string $message
     *            the message to be echoed.
     * @return int Exit code
     */

    public function actionIndex($message = 'hello world')
    {
        $resonse = [];
        $resonse['status'] = 'NOK';
        $resonse['response'] = $message;
        return $this->Consolereturn($resonse);
    }

    public function actionAuto()
    {
        $commands = [
            "hello/index",
            "data/add-user"
        ];
        do {
            $this->ConsolePrint("Time : " . date('Y-m-d h:i:s A') . PHP_EOL);
            foreach ($commands as $command) {
                $this->ConsolePrint("Command : " . $command);
                try {
                    exec("yii " . $command, $output, $retval);
                } catch (\Exception $e) {
                    echo "Exception caught";
                    exit();
                }
                // $this->ConsolePrint($output);
            }
            sleep(5);
        } while (true);
    }
}
