<?php

use app\components\PageHeader;
use app\models\ActionLog;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\helpers\Url;
use yii\widgets\Pjax;
/** @var yii\web\View $this */
/** @var app\models\search\ActionLog $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = Yii::t('app', 'Action Logs');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="action-log-index">

<?= PageHeader::widget(['title' => $this->title]); ?>
    <?php Pjax::begin(); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            'id',
            'status',
            'controller',
            'action',
            'params',
            'type',
            'created_on',
            [
                'attribute' => 'created_by_id',
                'format' => 'raw',
                'value' => function ($model) {
                return $model->getRelatedData('createdBy');
                }
            ],
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, ActionLog $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                 }
            ],
        ],
    ]); ?>

    <?php Pjax::end(); ?>

</div>
