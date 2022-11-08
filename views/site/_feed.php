<?php

use app\models\Users;
use yii\helpers\Url;
use app\models\Like;
use app\models\Discussion;
use yii\helpers\Html;
?>
<?php
$user = Users::find()->cache()->where($model->created_by_id)->one();
$self = Users::find()->cache()->where(Yii::$app->user->id)->one();
$liked = !empty(Like::findOne([
	'model' => get_class($model),
	'model_id' => $model->id
])) ? 'primary' : '';
$like_count = Like::find()->where([
	'model' => get_class($model),
	'model_id' => $model->id
])->count();

$comments = Discussion::find()->where([
	'model' => get_class($model),
	'model_id' => $model->id
]);

?>

<div class="social-feed-box card">
	<?php if (strtotime($model->created_on) >= strtotime('now') - 3600) { ?>
		<div class="ribbon-wrapper ribbon-lg">
			<div class="ribbon bg-primary">New post</div>
		</div>
	<?php } ?>
	<div class="social-avatar">
		<a href="" class="pull-left">
			<?php echo $user->getImage() ?>
		</a>
		<div class="media-body">
			<a href="#">
				<?php echo $user->username ?>
			</a> <small class="text-muted"><?php echo date('M d, Y H:i A', strtotime($model->created_on)) ?></small>
		</div>
	</div>
	<div class="social-body">
		<h3 class="ml-4"><?php echo $model->title ?></h3>
		<p class="ml-4">
			<?php echo $model->desciption ?>
		</p>
		<?php if (!empty($model->hasImage())) { ?>
			<img src="<?php echo $model->getImageUrl() ?>" class="img-responsive col-11 m-4">
		<?php } ?>

		<p>
		<div class="btn-group">
			<button class="btn btn-white btn-xs like-btn" data-id="<?php echo $model->id ?>" data-key="<?php echo get_class($model) ?>">
				<i class="fa fa-thumbs-up text-<?= $liked ?> mr-2"></i><?= $like_count ?>
			</button>
			<button class="btn btn-white btn-xs">
				<i class="fa fa-comments"></i> Comment
			</button>
			<button class="btn btn-white btn-xs">
				<i class="fa fa-share"></i> Share
			</button>
		</div>



	</div>
	<div class="social-footer" style="overflow: hidden">
		<div class="social-comment">
			<?php
			if (!empty($comments)) {
				foreach ($comments->each() as $comment) {
					$person = Users::findOne($comment->user_id);
			?>
					<div class="d-flex m-3">
						<div class="flex-shrink-0">
							<img class="rounded-circle" src="<?= $person->getImageUrl() ?>" height="50px" width="50px" alt="..." style="overflow: hidden; object-fit: cover;" />
						</div>
						<div class="ms-3 ml-3">
							<div class="fw-bold">
								<span class="font-weight-bold"><?= $person->username ?></span><small class="font-weight-light ml-2"><?php echo date('M d, Y h:i A', strtotime($comment->created_on)) ?></small>
							</div>
							<?php echo $comment->message ?>
						</div>
					</div>
			<?php
				}
			}
			?>
			<div class="social-comment">
				<div class="row">

					<div class="media media-comment">
						<?php echo $self->image ?>
						<form class="form-horizontal" style="width: 100%;">
							<div class="input-group input-group-sm mb-0">



								<input class="form-control form-control-sm" placeholder="Write comment..." id="discuss<?php echo $model->id ?>" style="height: 60px; margin-left:10px;">
								<div class="input-group-append">
									<?php echo Html::button('send', ["id" => "discuss-btn", "class" => "btn btn-secondary discuss-btn", 'data-id' => $model->id, 'data-key' => get_class($model)]) ?>
								</div>
							</div>



					</div>
					</form>
				</div>
			</div>

		</div>

	</div>
</div>

<script>
	$(document).on('click', '.like-btn', function(e) {
		var id = $(this).attr('data-id');
		var model = $(this).attr('data-key');
		var arr = {
			id: id,
			model: model,
		}
		$.ajax({
			type: 'POST',
			dataType: 'json',
			data: arr,
			url: '<?= Url::toRoute(['user/like-feed']) ?>',
			success: function(data) {
				location.reload();
			}
		});
		e.stopImmediatePropagation();
		return false;
	});

	$(document).on('click', '.discuss-btn', function(e) {
		var model_id = $(this).attr('data-id');
		var msg = $('#discuss' + model_id).val();
		var model = $(this).attr('data-key');
		var arr = {
			message: msg,
			model: model,
			model_id: model_id
		}
		$.ajax({
			type: 'POST',
			dataType: 'json',
			data: arr,
			url: '<?= Url::toRoute(['course/discuss']) ?>',
			success: function(data) {
				location.reload();
			}
		});
		e.stopImmediatePropagation();
		return false;
	});
</script>