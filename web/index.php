<?php

// comment out the following two lines when deployed to production

use app\models\User;

defined('YII_DEBUG') or define('YII_DEBUG', true);
defined('YII_ENV') or define('YII_ENV', 'dev');

require __DIR__ . '/../vendor/autoload.php';
require __DIR__ . '/../vendor/yiisoft/yii2/Yii.php';

$config = require __DIR__ . '/../config/web.php';

defined('BASE_PATH') or define('BASE_PATH', __DIR__);
defined('UPLOAD_PATH') or define('UPLOAD_PATH', BASE_PATH . '/../uploads/');

(new yii\web\Application($config))->run();

