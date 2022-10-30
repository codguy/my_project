<?php
use app\models\Users;

$user = Users::find()->where(['id' => $model->created_by])->one();

?>


<?php if($user->id == Yii::$app->user->id){ ?>
<div class="direct-chat-msg right p-2">
	<div class="direct-chat-infos clearfix">
		<span class="direct-chat-name float-right"><?= $user->username ?></span>
		<span class="direct-chat-timestamp float-left"><?php echo date('d M H:i A', strtotime($model->created_on))?></span>
	</div>
	<img class="direct-chat-img" src="<?= $user->getImageUrl() ?> "
		alt="message user image">
	<div class="direct-chat-text">
          <?php echo $model->message?>
        </div>
</div>
<?php } else { ?>
<div class="direct-chat-msg">
	<div class="direct-chat-infos clearfix">
		<span class="direct-chat-name float-left"><?= $user->username ?></span>
		<span class="direct-chat-timestamp float-right"><?php echo date('d M H:i A', strtotime($model->created_on))?></span>
	</div>
	<img class="direct-chat-img" src="<?= $user->getImageUrl() ?> "
		alt="message user image">
	<div class="direct-chat-text">
          <?php echo $model->message?>
        </div>
</div>


<?php } ?>