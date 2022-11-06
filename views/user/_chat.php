<?php
use app\models\Message;
use app\models\Users;
use yii\widgets\ListView;
use yii\helpers\Url;
$self_id = Yii::$app->user->id;
?>
<main class="content">
	<div class="container-fluid m-2 p-0">

		<div class="card">
			<div class="row g-0">
				<div class="col-12 col-lg-5 col-xl-3 border-right">

					<div class="px-4 d-none d-md-block">
						<div class="d-flex align-items-center">
							<div class="flex-grow-1">
								<input type="text" class="form-control my-3"
									placeholder="Search...">
							</div>
						</div>
					</div>

<?php

$users = Users::find()->where([
    '!=',
    'id',
    $self_id
]);
foreach ($users->each() as $user) {
    $msg = Message::find()->where([
        'user_id' => $self_id,
        'created_by_id' => $user->id
    ])->orWhere([
        'user_id' => $user->id,
        'created_by_id' => $self_id
    ]);
    ?>
					<a href="#" id="chat-person"
						class="list-group-item list-group-item-action border-0"
						data-id="<?php echo $user->id ?>">
						<div class="badge bg-success float-right"><?php

    echo $msg->count()?></div>
						<div class="d-flex align-items-start">
							<img src="<?php echo $user->getImageUrl()?>"
								class="rounded-circle mr-1 profile_pic" alt="Vanessa Tucker"
								width="40" height="40">
							<div class="flex-grow-1 ml-3">
								<?php echo $user->username?>
								<div class="small">
									<span class="fas fa-circle chat-online mr-1"></span>Online
								</div>
							</div>
						</div>
					</a>
<?php } ?>
					

					<hr class="d-block d-lg-none mt-1 mb-0">
				</div>
				<div id="chat-area" class="col-12 col-lg-7 col-xl-9">
				<?php
    $first_msg = Message::find()->where([
        'user_id' => Yii::$app->user->id
    ])
        ->orderBy([
        'id' => SORT_DESC
    ])
        ->one();
    if (! empty($first_msg)) {
        echo $this->render('_chat_area', [
            'id' => $first_msg->created_by_id
        ]);
    }
    ?>
					
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