<?php

/* @var $this \yii\web\View */
/* @var $content string */

\hail812\adminlte3\assets\AdminLteAsset::register($this);
$this->registerCssFile('https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700');
$this->registerCssFile('https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css');
\hail812\adminlte3\assets\PluginAsset::register($this)->add(['fontawesome', 'icheck-bootstrap']);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 3 | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php
    // Register Tailwind CSS output file
    $this->registerCssFile('@web/css/app.css'); // Added this line
    $this->registerCsrfMetaTags();
    ?>
    <?php $this->head() ?>
</head>
<body class="bg-slate-100 flex items-center justify-center min-h-screen">
<?php  $this->beginBody() ?>
<div class="bg-white p-8 rounded-lg shadow-xl w-full max-w-sm">
    <div class="text-center mb-6">
        <a href="<?=Yii::$app->homeUrl?>" class="text-3xl font-bold text-slate-700 hover:text-slate-900"><b>Admin</b>LTE Clone</a>
    </div>
    <!-- /.login-logo -->

    <?= $content ?>
</div>
<!-- /.login-box -->

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>