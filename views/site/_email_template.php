<?php
use yii\grid\GridView;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\Pjax;
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

Pjax::begin([
    'id' => 'template-grid-view',
    'enablePushState' => true
]);

echo GridView::widget([
    'dataProvider' => $dataProvider,
    'columns' => [
        'id',
        'title',
        [
            'attribute' => 'html',
            'format' => 'raw',
            'class' => 'yii\grid\DataColumn', // can be omitted, as it is the default
            'value' => function ($data) {
                return "<iframe src=" . Yii::$app->urlManager->createAbsoluteUrl([
                    'user/see-template',
                    'id' => $data->id
                ]) . " width='100%' height='250px;'></iframe>";
            }
        ],
        [
            'header' => 'Actions',
            'class' => 'yii\grid\ActionColumn',
            'template' => '{veiw}{clone}{edit}{delete}',
            'buttons' => [
                'veiw' => function ($url, $model) {
                    return Html::a('<span class="fa fa-eye fa-sm"></span>', Url::toRoute([
                        'site/see-email-template',
                        'id' => $model->id
                    ]), [
                        'title' => Yii::t('app', 'View'),
                        'class' => 'btn btn-success me-1'
                    ]);
                },
                'clone' => function ($url, $model) {
                    return Html::a('<span class="fa fa-copy fa-sm"></span>', Url::toRoute([
                        'site/clone-email-template',
                        'id' => $model->id
                    ]), [
                        'title' => Yii::t('app', 'Edit'),
                        'class' => 'btn btn-info text-white me-1'
                    ]);
                },
                'edit' => function ($url, $model) {
                    return Html::a('<span class="fa fa-pen fa-sm"></span>', Url::toRoute([
                        'site/update-email-template',
                        'id' => $model->id
                    ]), [
                        'title' => Yii::t('app', 'Edit'),
                        'class' => 'btn btn-warning text-white me-1'
                    ]);
                },
                'delete' => function ($url, $model) {
                    return Html::a('<span class="fa fa-trash"></span>', Url::toRoute([
                        'site/delete-email-template',
                        'id' => $model->id
                    ]), [
                        'title' => Yii::t('app', 'Delete'),
                        'data-method' => 'post',
                        'data-confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                        'class' => 'btn btn-danger me-1'
                    ]);
                }
            ]
        ]
    ],
    'pager' => [
        'class' => \kop\y2sp\ScrollPager::className(),
        'container' => '.grid-view',
        'triggerOffset' => 100,
        'negativeMargin' => 100,
        'paginationSelector' => '.grid-view .pagination',
        'triggerTemplate' => '<tr class="ias-trigger"><td colspan="100%" style="text-align: center"><a style="cursor: pointer">{text}</a></td></tr>',
        'noneLeftTemplate' => '<tr class="ias-noneleft"><td colspan="100%" style="text-align: center"><a style="cursor: pointer">{text}</a></td></tr>'
    ]
]);

Pjax::end();
?>
	</div>

	<div class="tab-pane fade" id="create-template" role="tabpanel"
		aria-labelledby="create-template-tab">
		<div class="row">
			<div class="col-md-6">
				<label for="template-name">Template Name</label> <input type="text"
					id="template-name" class="form-control">
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

	$(document).on('click', '#save-btn', function() {
		unlayer.exportHtml(function(data) {
			var title = $('#template-name').val();
			var json = JSON.stringify(data.design);
			var html = data.html;
			$.ajax({
				url: '<?php echo Url::toRoute('site/create-email-template') ?>',
				data: {
					title: title,
					html: html,
					json: json
				},
				type: "POST",
				success: function() {
					window.reload();
				},
				error: function() {
					console.log("failure");
				}
			});
		});
	});
</script>