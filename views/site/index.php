<?php
use yii\widgets\ListView;
use yii\helpers\Url;
use yii\data\ActiveDataProvider;
use app\models\Feed;
use yii\widgets\ActiveForm;
use yii\helpers\Html;
use app\models\Message;
use yii\widgets\Pjax;
?>

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<div class="container-fluid">
	<div class="row">
		<div class="col-md-6 mt-4">
<?php
$form = ActiveForm::begin([
    'id' => 'signup-form',
    'options' => [
        'enctype' => 'multipart/form-data',
        'class' => "comment-area-box mb-3 card",
        'style' => "border-radius:10px;border:2px solid silver;"
    ],
    'action' => [
        'user/create-feed'
    ],
    'method' => 'POST',
    'fieldConfig' => [
        'template' => "{input}\n{error}",
        'labelOptions' => [
            'class' => 'col-form-label mr-lg-3'
        ],
        'inputOptions' => [
            'class' => 'form-control'
        ],
        'errorOptions' => [
            'class' => 'invalid-feedback'
        ]
    ]
]);
?>
	<!-- comment box -->
			<h3 class="m-3">Create feed</h3>
			<span class="input-icon m-2"> <!-- <input type="text" class="form-control feed-title" placeholder="Add title..."> -->
            <?= $form->field($model, 'title')->textInput(['maxlength' => true, 'class' => 'form-control feed-title', 'placeholder' => "Add title..."]) ?>
        </span> <span class="input-icon m-2"> <!-- <textarea rows="3" class="form-control feed-text" placeholder="Write something..."></textarea> -->
            <?= $form->field($model, 'desciption')->textarea(['rows'=>"3", 'class'=>"form-control feed-text", 'placeholder'=>"Write something..."]) ?>
            <div class="comment-area-btn">
					<div class="float-end">
                    <?= Html::submitButton(Yii::t('app', 'Post'), ['class' => 'btn btn-sm btn-dark waves-effect waves-light float-right']) ?>
                </div>
					<div>
						<a href="#" class="btn btn-sm btn-light text-black-50"><i
							class="far fa-user"></i></a> <a href="#"
							class="btn btn-sm btn-light text-black-50"><i
							class="fa fa-map-marker"></i></a> <a href="#"
							class="btn btn-sm btn-light text-black-50" data-toggle="modal"
							data-target="#exampleModal"><i class="fa fa-camera"></i></a> <a
							href="#" class="btn btn-sm btn-light text-black-50"><i
							class="far fa-smile"></i></a>
					</div>
				</div>
			</span>
			<!-- end comment box -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Uploading a new
								photo</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<p class="body-desc">It will be easier for your friends to
								recognize you if you upload your real photo. You can upload the
								image in JPG, GIF or PNG format.</p>
							<div class="photo-input">
								<center>
									<img src='' alt="Charles Hall" id="file-ip-1-preview"
										style="display: none; max-height: 450px; max-width: 80%;" /> 
                		<?= $form->field($model, 'image')->fileInput(['onchange'=>"showPreview(event);", 'id'=>"file-ip-1", 'class'=>'form-input d-none' ])?>
                		<label class="btn btn-sm btn-primary text-center"
										for="file-ip-1"> Select a file </label>
								</center>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal" aria-label="Close">Upload</button>
						</div>
					</div>
				</div>
			</div>

    <?php ActiveForm::end(); ?>
    <?php

    $query = Feed::find();

    // add conditions that should always apply here

    $dataProvider = new ActiveDataProvider([
        'query' => $query,
        'sort' => [
            'defaultOrder' => [
                'created_on' => SORT_DESC
            ]
        ]
    ]);

    echo ListView::widget([
        'dataProvider' => $dataProvider,
        'layout' => '{items}',
        'itemView' => '_feed'
    ])?>
</div>
		<div class="col-md-3" style="position: relative; bottom: 0; right: 0">
			<div class="card card-primary card-outline direct-chat direct-chat-primary">
				<div class="card-header">
					<h3 class="card-title">Direct Chat</h3>
					<div class="card-tools">
						<span data-toggle="tooltip" title="3 New Messages"
							class="badge badge-light">3</span>
						<button type="button" class="btn btn-tool"
							data-card-widget="collapse">
							<i class="fas fa-minus"></i>
						</button>
						<button type="button" class="btn btn-tool" data-toggle="tooltip"
							title="Contacts" data-widget="chat-pane-toggle">
							<i class="fas fa-comments"></i>
						</button>
						<button type="button" class="btn btn-tool"
							data-card-widget="remove">
							<i class="fas fa-times"></i>
						</button>
					</div>
				</div>
				<!-- /.card-header -->
				
				<div class="card-body">
				
	<div class="direct-chat-messages">
	<?php Pjax::begin(['id' => 'chat']) ?>
				<?php 
    				$msg = Message::find()->where([
    				    'created_by' => Yii::$app->user->id
    				])->orWhere([
    				    'user_id' => Yii::$app->user->id
    				]);
    				$msgProvider = new ActiveDataProvider([
    				    'query' => $msg,
    				    'sort' => [
    				        'defaultOrder' => [
    				            'created_on' => SORT_ASC
    				        ]
    				    ]
    				]);
				    echo ListView::widget([
				        'dataProvider' => $msgProvider,
				        'layout' => '{items}',
				        'itemView' => '_msg'
				    ]);
				?>
				
				<?php Pjax::end() ?>
				</div>
			
<?php //echo $this->render('_msg',['model' => msg])?>
  </div>
				<!-- /.card-body -->
				<div class="card-footer">
					<form action="#" method="post">
						<div class="input-group">
							<input type="text" name="message" placeholder="Type Message ..."
								id="chat-msg" class="form-control"> <span
								class="input-group-append">
								<button type="button" id="send-msg" class="btn btn-primary">Send</button>
							</span>
						</div>
					</form>
				</div>
				<!-- /.card-footer-->
			</div>
			<!--/.direct-chat -->
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
$(document).on('click', '#submit-feed', function(){
	var msg = $('.feed-text').val();
	var title = $('.feed-title').val();
	var image = $('#file-ip-1').val();
	var arr = {
		message: msg,
		title: title,
		image: image
	}
	
	console.log(arr);
	/* $.ajax({
	    type: 'POST',
        dataType: 'json',
	    data: arr,
		url: '<?= Url::toRoute(['user/create-feed'])?>',
		success: function(data) {
			location.reload();
		}
	}); */
});

function showPreview(event){
  if(event.target.files.length > 0){
    var src = URL.createObjectURL(event.target.files[0]);
    var preview = document.getElementById("file-ip-1-preview");
    preview.src = src;
    preview.style.display = "block";
  }
}

$(document).on('click', '#send-msg', function(){
	var msg = $('#chat-msg').val();
	$.ajax({
	    type: 'POST',
        dataType: 'json',
	    data: {
	    	msg	: msg 
	    },
		url: '<?= Url::toRoute(['user/add-msg'])?>',
		success: function(response) {
			if(response == 'OK'){
				$.pjax.reload({container: '#chat'});
			}
		}
	});
});

</script>
<script>
  /* const labels = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
  ];

  const data = {
    labels: labels,
    datasets: [{
      label: 'My First dataset',
      backgroundColor: 'rgb(255, 99, 132)',
      borderColor: 'rgb(255, 99, 132)',
      data: [0, 10, 5, 2, 20, 30, 45],
    }]
  };

  const config = {
    type: 'line',
    data: data,
    options: {}
  }; */
  $('#chat-pane-toggle').DirectChat('toggle')
  
</script>
<script>
 /*  const myChart = new Chart(
    document.getElementById('myChart'),
    config
  ); */
</script>