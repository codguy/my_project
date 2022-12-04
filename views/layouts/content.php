<?php
/* @var $content string */

use yii\bootstrap4\Breadcrumbs;
use yii\helpers\Html;

?>
<div class="content-wrapper" style="overflow:auto;">

    <!-- <div class="card">
        <div class="card-body">
            
        </div>
    </div> -->
    <?php if(Yii::$app->session->has('shadow')){ ?>
    <div class="alert alert-success" role="alert">
        <div class="">This is a shadowed user, switch back to logged in user <?= Html::a('Unshadow', ['user/unshadow'], ['class' => "text-light alert-link ml-2"]) ?></div>
    </div>
    <?php }?>
    <!-- Main content -->
    <div class="content">
        <?= $content ?>
        <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>