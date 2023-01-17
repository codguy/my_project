<?php
use app\components\PageHeader;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\ActionLog $model */

$this->title = $model->id;
$this->params['breadcrumbs'][] = [
    'label' => Yii::t('app', 'Action Logs'),
    'url' => [
        'index'
    ]
];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="action-log-view">
<?= PageHeader::widget(['title' => $model->controller.'/'.$model->action]); ?>
    <?php

echo DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'status',
            'controller',
            'action',
            'type',
            [
                'attribute' => 'params',
                'format' => 'raw',
                'value' => function ($model) {
                    return '<pre>' . $model->params . '</pre>';
                }
            ],
            'created_on',
            [
                'attribute' => 'created_by_id',
                'format' => 'raw',
                'value' => function ($model) {
                    return $model->getRelatedData('createdBy');
                }
            ]
        ]
    ])?>

</div>
