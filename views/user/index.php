<?php
use app\components\PageHeader;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\widgets\Pjax;
use app\models\Users;
use yii\widgets\ListView;
/* @var $this yii\web\View */
/* @var $searchModel app\models\search\Users */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Users');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="users-index">

    <?= PageHeader::widget(['title' => $this->title]); ?>

    <?php
    Pjax::begin([
        'id' => 'users-grid-view',
        'enablePushState' => FALSE
    ]);
    echo ListView::widget([
        'dataProvider' => $dataProvider,
        'itemView' => '_card',
        'id' => "user-view",
        'itemOptions' => [
            'class' => 'item'
        ],
        'layout' => '{items}{pager}',
        // 'pager' => ['class' => \kop\y2sp\ScrollPager::class]
        'pager' => [
            'class' => \kop\y2sp\ScrollPager::className(),
            'container' => '.list-view',
            'triggerOffset' => 100,
            'negativeMargin' => 100,
            'paginationSelector' => '.list-view .pagination',
            'triggerTemplate' => '<div style="text-align: center"><a style="cursor: pointer">{text}</a></div>',
            'noneLeftTemplate' => '<div style="clear: both; width: 100%; text-align: center">{text}</div>'
        ]
    ]);
    Pjax::end();
    ?>


</div>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<script>
    // $("#users-grid-view").html(data.page);
    $(document).pjax('a', '#users-grid-view', {
        push: false
    });
    $(document).ready(function() {
        console.log("ready!");
    });
    $(document).on('click', '.follow', function() {
        var id = $(this).attr('data-id');
        var model = $(this).attr('data-key');
        var arr = {
            id: id,
            model: model
        }
        $.ajax({
            type: 'POST',
            dataType: 'json',
            data: arr,
            url: '<?= Url::toRoute(['user/follow']) ?>',
            success: function(data) {
                location.reload();
            }
        });
    });
</script>