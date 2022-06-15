<?php
use yii\helpers\Url;
use yii\grid\GridView;
?>

<ul class="nav nav-tabs maintabs" id="myTab" role="tablist">
	<li class="nav-item"><a class="nav-link active" id="home-tab"
		data-toggle="tab" href="#home" role="tab" aria-controls="home"
		aria-selected="true">Templates</a></li>
	<li class="nav-item"><a class="nav-link" id="create-template-tab"
		data-toggle="tab" href="#create-template" role="tab"
		aria-controls="feed" aria-selected="false">Design Template</a></li>
</ul>

<div class="tab-content" id="myTabContent">
	<div class="tab-pane fade show active" id="home" role="tabpanel"
		aria-labelledby="home-tab">
		<?php

echo GridView::widget([
    'dataProvider' => $dataProvider,
    'columns' => [
        'id',
        'type_id',
        [
            'attribute' => 'html',
            'format' => 'raw',
            'class' => 'yii\grid\DataColumn', // can be omitted, as it is the default
            'value' => function ($data) {
            return "<iframe src=".Yii::$app->urlManager->createAbsoluteUrl(['user/see-template', 'temp' => $data->id])." width='100%' height='250px;'></iframe>";
            }
        ],
        [
            'class' => 'yii\grid\ActionColumn'
        ]
    ]
]);
?>		
	</div>

	<div class="tab-pane fade" id="create-template" role="tabpanel"
		aria-labelledby="create-template-tab">
		<div class="row">
			<div class="col-md-6">
				<label for="template-name">Template Number</label> <input
					type="number" id="template-name" class="form-control">
			</div>
			<div class="col-md-6">
				<button class="btn btn-success float-right m-4" id="save-btn"
					style="padding: 15px 30px;">Save</button>
			</div>

		</div>
		<label>Template Design</label>
		<div id="editor-container" style="height: 75vh"></div>


		<script src="//editor.unlayer.com/embed.js"></script>

	</div>
</div>

<script>
unlayer.init({
  id: 'editor-container',
  projectId: 1234,
  displayMode: 'email'
});

$(document).on('click', '#save-btn', function(){
	unlayer.exportHtml(function(data) {
		var type = $('#template-name').val();
        var json = JSON.stringify(data.design);
        var html = data.html;
        $.ajax({
            url: '<?php echo Url::toRoute('site/create-email-template') ?>',
            data: {
            	type: type,
            	html: html,
            	json: json	
        	},
            type: "POST",
            success: function () {
                window.reload();
            },
            error: function () {
                console.log("failure");
            }
        });
	});
});
</script>