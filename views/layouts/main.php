<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;

\hail812\adminlte3\assets\FontAwesomeAsset::register($this);
\hail812\adminlte3\assets\AdminLteAsset::register($this);
$this->registerCssFile('https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback');
$this->registerCssFile('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css');
$this->registerCssFile('https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css');
$this->registerCssFile(Yii::$app->basePath.'/css/site.css');
$assetDir = Yii::$app->assetManager->getPublishedUrl('@vendor/almasaeed2010/adminlte/dist');

$publishedRes = Yii::$app->assetManager->publish('@vendor/hail812/yii2-adminlte3/src/web/js');
$this->registerJsFile($publishedRes[1].'/control_sidebar.js', ['depends' => '\hail812\adminlte3\assets\AdminLteAsset']);
$this->registerJsFile('https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js');
?>

<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
    <style>
   

.profile_pic {
	border-radius: 50%;
	object-fit: cover;
	/* border: 5px solid #007bff; */
	/*box-shadow: 4px 4px 10px 2px gray*/;
}

#tbluser-gender {
	width: 20px;
	float: left;
	margin-top: -7px;
	margin-right: 7px;
}

.Radio-btn {
	float: left;
	margin: 5px 10px 20px 0px;
}

.btn.btn-success.login-btns {
	width: 350px;
	height: 50px;
	box-shadow: 0px 0px 10px grey;
}

#file-ip-1 {
	display: none;
}

.form-input label {
  display:block;
  width:45%;
  height:45px;
  margin-left: 25%;
  line-height:50px;
  text-align:center;
  background:#1172c2;
  color:#fff;
  font-size:15px;
  font-family:"Open Sans",sans-serif;
  text-transform:Uppercase;
  font-weight:600;
  border-radius:5px;
  cursor:pointer;
}

.dropdown-item.dropdown-body {
	height: 250px;
	overflow: auto;
}

.dropdown-menu-lg .dropdown-item {
	padding: .5rem 1rem;
	font-size: 0.9em;
}

.fas.fa-user.btn.btn-outline-primary.btn-sm.mr-1 {
	margin-left: -15px;
}

.sidebar-mini.blank-layout {
	color: white;
	background: radial-gradient(circle, rgba(63,94,251,1) 33%, rgba(0,157,92,1) 100%);
}

.blank-layout .card {
	color: black;
}

.custom-control-label {
	width: 150px;
	margin-left: -40px;
}

.form-group.field-Male {
	margin-top: -25px;
}
    </style>
</head>
<body class="hold-transition sidebar-mini">
<?php $this->beginBody() ?>

<div class="wrapper">

    <!-- Navbar -->
    <?= $this->render('navbar', ['assetDir' => $assetDir]) ?>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <?= $this->render('sidebar', ['assetDir' => $assetDir]) ?>

    <!-- Content Wrapper. Contains page content -->
    <?= $this->render('content', ['content' => $content, 'assetDir' => $assetDir]) ?>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <?= $this->render('control-sidebar') ?>
    <!-- /.control-sidebar -->

    <!-- Main Footer -->
    <?= $this->render('footer') ?>
</div>

<?php $this->endBody() ?>
</body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
$( document ).ready(function() {
    $('.nav-icon').removeClass('fa-circle');
});
</script>
</html>
<?php $this->endPage() ?>
