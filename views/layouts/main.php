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
$this->beginPage()?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="<?= Yii::$app->charset ?>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <?php

    $this->registerCssFile('@web/css/bootstrap.css');
    $this->registerCssFile('@web/css/site.css');
    // Register Tailwind CSS output file
    $this->registerCssFile('@web/css/app.css'); // Added this line
    $this->registerCsrfMetaTags()?>
    <title><?= Html::encode($this->title) ?></title>
    <?php

    $this->head()?>
</head>
<body class="hold-transition sidebar-mini sidebar-collapse">
    <?php

    $this->beginBody()?>

    <div class="wrapper">
        <?= $this->render('navbar', ['assetDir' => $assetDir]) ?>
        <?= $this->render('sidebar', ['assetDir' => $assetDir]) ?>
        <?= $this->render('content', ['content' => $content, 'assetDir' => $assetDir]) ?>
        <?= $this->render('control-sidebar') ?>
        <?= $this->render('footer') ?>
    </div>

    <?php

    $this->endBody()?>
</body>
<script>
    $(document).ready(function() {
        $('.nav-icon').removeClass('fa-circle');
    });
    $(document).on('change', '#flexSwitchCheckChecked', function(){
    	var mode = $(this).is(':checked');
    	localStorage.setItem("dark-mode", mode);
    	console.log(localStorage.getItem("dark-mode"));
    	 if(mode){
    	 	$('body').addClass('dark-mode');
    	 } else {
    	 	$('body').removeClass('dark-mode');
    	 }
    });
    if(localStorage.getItem('dark-mode') == 'true'){
	 	$('body').addClass('dark-mode');
		$('#flexSwitchCheckChecked').attr('checked', 'checked');
	}
    
		
</script>
</html>
<?php

$this->endPage()?>