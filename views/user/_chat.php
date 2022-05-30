<?php
use app\models\Message;
use app\models\Users;
use yii\widgets\ListView;
?>
<main class="content">
    <div class="container-fluid m-2 p-0">

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
					<a href="#" class="list-group-item list-group-item-action border-0">
						<div class="badge bg-success float-right"><?php echo Message::find()->where(['created_by' => $msg->created_by])->count()?></div>
						<div class="d-flex align-items-start">
							<img src="<?php echo $messenger->getImageUrl()?>" class="rounded-circle mr-1" alt="Vanessa Tucker" width="40" height="40">
							<div class="flex-grow-1 ml-3">
								<?php echo $messenger->username?>
								<div class="small"><span class="fas fa-circle chat-online mr-1"></span><?php echo $msg->message?></div>
							</div>
						</div>
					</a>
<?php } ?>
					<a href="#" class="list-group-item list-group-item-action border-0">
						<div class="d-flex align-items-start">
							<img src="https://bootdey.com/img/Content/avatar/avatar4.png" class="rounded-circle mr-1" alt="Christina Mason" width="40" height="40">
							<div class="flex-grow-1 ml-3">
								Christina Mason
								<div class="small"><span class="fas fa-circle chat-offline"></span> Offline</div>
							</div>
						</div>
					</a>
					<a href="#" class="list-group-item list-group-item-action border-0">
						<div class="d-flex align-items-start">
							<img src="https://bootdey.com/img/Content/avatar/avatar5.png" class="rounded-circle mr-1" alt="Fiona Green" width="40" height="40">
							<div class="flex-grow-1 ml-3">
								Fiona Green
								<div class="small"><span class="fas fa-circle chat-offline"></span> Offline</div>
							</div>
						</div>
					</a>
					<a href="#" class="list-group-item list-group-item-action border-0">
						<div class="d-flex align-items-start">
							<img src="https://bootdey.com/img/Content/avatar/avatar2.png" class="rounded-circle mr-1" alt="Doris Wilder" width="40" height="40">
							<div class="flex-grow-1 ml-3">
								Doris Wilder
								<div class="small"><span class="fas fa-circle chat-offline"></span> Offline</div>
							</div>
						</div>
					</a>
					<a href="#" class="list-group-item list-group-item-action border-0">
						<div class="d-flex align-items-start">
							<img src="https://bootdey.com/img/Content/avatar/avatar4.png" class="rounded-circle mr-1" alt="Haley Kennedy" width="40" height="40">
							<div class="flex-grow-1 ml-3">
								Haley Kennedy
								<div class="small"><span class="fas fa-circle chat-offline"></span> Offline</div>
							</div>
						</div>
					</a>
					<a href="#" class="list-group-item list-group-item-action border-0">
						<div class="d-flex align-items-start">
							<img src="https://bootdey.com/img/Content/avatar/avatar3.png" class="rounded-circle mr-1" alt="Jennifer Chang" width="40" height="40">
							<div class="flex-grow-1 ml-3">
								Jennifer Chang
								<div class="small"><span class="fas fa-circle chat-offline"></span> Offline</div>
							</div>
						</div>
					</a>

					<hr class="d-block d-lg-none mt-1 mb-0">
				</div>
				<div class="chat-area">
					<?php //echo ListView::widget([
					    
// 					]); ?>
				</div>
			</div>
		</div>
	</div>
</main>