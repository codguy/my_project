<?php

/* @var $this \yii\web\View */
/* @var $content string */
use yii\helpers\Html;

\hail812\adminlte3\assets\FontAwesomeAsset::register($this);
\hail812\adminlte3\assets\AdminLteAsset::register($this);
$this->registerCssFile('https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback');
$this->registerCssFile('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css');
$this->registerCssFile('https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css');
$this->registerCssFile(Yii::$app->basePath . '/css/site.css');
$assetDir = Yii::$app->assetManager->getPublishedUrl('@vendor/almasaeed2010/adminlte/dist');

$publishedRes = Yii::$app->assetManager->publish('@vendor/hail812/yii2-adminlte3/src/web/js');
$this->registerJsFile($publishedRes[1] . '/control_sidebar.js', [
    'depends' => '\hail812\adminlte3\assets\AdminLteAsset'
]);
// $this->registerJsFile('https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js');
?>

<?php

$this->beginPage()?>
<!DOCTYPE html>
<html lang="<?=Yii::$app->language?>">
<head>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
    <meta charset="<?=Yii::$app->charset?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php
    
    $this->registerCssFile('@web/css/bootstrap.css');
    $this->registerCssFile('@web/css/site.css');
    $this->registerCsrfMetaTags()?>
    <title><?=Html::encode($this->title)?></title>
    <?php

    $this->head()?>
   <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    -->
   
</head>
<body class="hold-transition sidebar-mini">
<?php

$this->beginBody()?>

<div class="wrapper">
    <!-- Navbar -->
    <?=$this->render('navbar', ['assetDir' => $assetDir])?>
    <!-- /.navbar -->
    
    <!-- Main Sidebar Container -->
    <?=$this->render('sidebar', ['assetDir' => $assetDir])?>

    <!-- Content Wrapper. Contains page content -->
    <?=$this->render('content', ['content' => $content,'assetDir' => $assetDir])?>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <?=$this->render('control-sidebar')?>
    <!-- /.control-sidebar -->

    <!-- Main Footer -->
    <?=$this->render('footer')?>
</div>

<?php

$this->endBody()?>
</body>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> -->
<script>
$( document ).ready(function() {
    $('.nav-icon').removeClass('fa-circle');
});

</script>
</html>
<?php

$this->endPage()?>
