<?php
use yii\helpers\Url;
use yii\grid\GridView;
?>

<nav class="nav nav-tabs nav-justified col-4">
	<a class="nav-link active" data-toggle="tab" href="#home">Home</a> 
	<a class="nav-link" data-toggle="tab" href="#design">Design</a>
</nav>

<div class="tab-content">
	<div id="home" class="tab-pane active fade in">
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
                return $data->html;
            }
        ],
         [
         'class' => 'yii\grid\ActionColumn'
         ] 
    ],  
 
  

]);
?>
	</div>
	<div id="design" class="tab-pane fade">
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
                console.log("success");
            },
            error: function () {
                console.log("failure");
            }
        });
	});
});
</script>