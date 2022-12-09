<?php
use app\components\grid\TGridView;
use app\components\NewGridView;
use app\components\PageHeader;
use app\models\Log;
use kartik\daterange\DateRangePicker;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\helpers\ArrayHelper;
use app\models\Users;

/** @var yii\web\View $this */
/** @var app\models\search\Log $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Logs';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="log-index">

    <?= PageHeader::widget(['title' => $this->title]);?>

    <?php Pjax::begin(); ?>

    <?php

    echo TGridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'exportable' => true,
        'pager' => [
            'class' => \kop\y2sp\ScrollPager::className(),
            'container' => '.grid-view tbody',
            'item' => 'tr',
            'triggerOffset' => 10,
            'negativeMargin' => 500,
            'paginationSelector' => '.grid-view .pagination',
            'triggerTemplate' => '<tr class="ias-trigger"><td colspan="100%" style="text-align: center"><a style="cursor: pointer">{text}</a></td></tr>',
            'noneLeftTemplate' => '<tr class="ias-noneleft"><td colspan="100%" style="text-align: center">{text}</td></tr>'
        ],
        'columns' => [
            [
                'class' => 'yii\grid\SerialColumn'
            ],

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
                'attribute' => 'type_id',
                'format' => 'raw',
                'filter' => Html::activeDropDownList($searchModel, 'type_id', $searchModel->getTypeOption(), [
                    'class' => 'form-control',
                    'prompt' => ''
                ]),
                'value' => function ($model) {
                    return $model->typeBadge;
                }
            ],
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
                ])
            ],
            [
                'class' => ActionColumn::class,
                'urlCreator' => function ($action, Log $model, $key, $index, $column) {
                    return Url::toRoute([
                        $action,
                        'id' => $model->id
                    ]);
                }
            ]
        ]
    ]);
    ?>


    <?php Pjax::end(); ?>

</div>