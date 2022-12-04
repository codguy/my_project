<?php

use app\components\NewGridView;
use app\models\Log;
use kartik\daterange\DateRangePicker;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\widgets\Pjax;

/** @var yii\web\View $this */
/** @var app\models\search\Log $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Logs';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="log-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <?php Pjax::begin(); ?>

    <?= NewGridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'pager' => [
            'class' => \kop\y2sp\ScrollPager::className(),
            'container' => '.grid-view tbody',
            'item' => 'tr',
            'triggerOffset' => 10,
            'negativeMargin' => 200,
            'paginationSelector' => '.grid-view .pagination',
            'triggerTemplate' => '<tr class="ias-trigger"><td colspan="100%" style="text-align: center"><a style="cursor: pointer">{text}</a></td></tr>',
            'noneLeftTemplate' =>'<tr class="ias-noneleft"><td colspan="100%" style="text-align: center">{text}</td></tr>', 
         ],
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'ip:ntext',
            'action:ntext',
            [
                'attribute' => 'message',
                'value' => function ($model) {
                    return strstr($model->message, "\n", true);
                }
            ],
            'created_by_id',
            [
                'attribute' => 'created_on',
                'value' => 'created_on',
                'filter' => DateRangePicker::widget([
                    'model' => $searchModel,
                    'attribute' => 'created_on',
                    'convertFormat' => true,
                    'pluginOptions' => [
                        'timePicker' => true,
                        'timePickerIncrement' => 15,
                        'locale' => [
                            'format' => 'Y-m-d h:i:s'
                        ]
                    ]
                ]),
            ],
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Log $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                }
            ],
        ],
    ]); ?>


    <?php Pjax::end(); ?>

</div>