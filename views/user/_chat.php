<?php
use app\models\Message;
use app\models\Users;
use yii\widgets\ListView;
use yii\helpers\Url;
?>
<main class="content">
    <div class="container-fluid mt-2 p-0">

		<div class="card">
			<div class="row g-0">
				<div class="col-12 col-lg-5 col-xl-3 border-right">

					<div class="px-4 d-none d-md-block">
						<div class="d-flex align-items-center">
							<div class="flex-grow-1">
								<input type="text" class="form-control my-3" placeholder="Search...">
							</div>
						</div>
					</div>
<?php 
$msgs = Message::find()->where([
    'user_id' => Yii::$app->user->id
]);


foreach ($msgs->groupBy('created_by')->each() as $msg){
    
    $messenger = Users::findOne([$msg->created_by]);
?>
					<a href="#" id="chat-person" data-id="<?php echo $msg->created_by ?>" class="list-group-item list-group-item-action border-0">
						<div class="badge bg-success float-right"><?php echo Message::find()->where(['created_by' => $messenger->id])->count()?></div>
						<div class="d-flex align-items-start">
							<img src="<?php echo $messenger->getImageUrl()?>" class="rounded-circle mr-1" alt="Vanessa Tucker" width="40" height="40">
							<div class="flex-grow-1 ml-3">
								<?php echo $messenger->username?>
								<div class="small"><span class="fas fa-circle chat-online mr-1"></span><?php echo $msg->message?></div>
							</div>
						</div>
					</a>
<?php } ?>
					

					<hr class="d-block d-lg-none mt-1 mb-0">
				</div>
				<div id="chat-area" class="col-12 col-lg-7 col-xl-9">
				<?php echo $this->render('_chat_area', ['id' => 3])?>
					
				</div>
			</div>
		</div>
	</div>
</main>

<script>
$(document).on('click', '#chat-person', function(){
	var user = $(this).attr('data-id');
	$.ajax({
	    type: 'GET',
	    data: {
	    	id	: user 
	    },
		url: '<?= Url::toRoute(['user/chat-box'])?>',
		success: function(response) {
			$('#chat-area').html(response);
		}
	});
});
</script>