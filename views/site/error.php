<?php

/** @var yii\web\View $this */
/** @var string $name */
/** @var string $message */
/** @var Exception$exception */
use yii\helpers\Html;
use yii\helpers\Url;

$this->title = $name;
$url = 'https://cdn.dribbble.com/users/285475/screenshots/2083086/dribbble_1.gif';
?>
<style>

/*======================
    404 page
=======================*/
.page_404 {
	padding: 0;
	background: #fff;
	font-family: 'Arvo', serif;
	height: 100vh;
	top: 200px;
}

.page_404  img {
	width: 100%;
}

.four_zero_four_bg {
	background-image:
		url(<?= $url ?>);
	display: flex;
	flex-direction: column;
	min-height: 400px;
	background-position: center;
	top: 200px;
}

.four_zero_four_bg h1 {
	font-size: 80px;
}

.four_zero_four_bg h3 {
	font-size: 80px;
}

.link_404 {
	color: #fff !important;
	padding: 10px 20px;
	background: #39ac31;
	margin: 20px 0;
	display: inline-block;
}

.contant_box_404 {
	margin-top: -50px;
}

.col-sm-10.col-sm-offset-1.text-center {
	top: calc(50% - 200px);
}
</style>

<section class="content page_404 my-auto">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 ">
				<center>
					<div class="col-sm-10 col-sm-offset-1">
						<div class="four_zero_four_bg"></div>

						<div class="contant_box_404">
							<h1 class="text-center "><?= (int) filter_var(Html::encode($this->title), FILTER_SANITIZE_NUMBER_INT) ?></h1>
							<h3 class="h2"><?= nl2br(Html::encode($message)) ?></h3>

							<p></p>

							<a href="<?php echo Yii::$app->homeUrl?>" class="link_404">Go to
								Home</a>
						</div>
					</div>
				</center>
			</div>
		</div>
	</div>
</section>

