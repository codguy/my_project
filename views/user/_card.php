<?php

use app\models\Feed;
use yii\helpers\Html;
use app\models\Follow;
use yii\helpers\Url;
use app\models\Users;

$followers = Follow::find()->where([
  'model' => get_class($model),
  'model_id' => $model->id
])->count();

$following = Follow::find()->where([
  'model' => get_class($model),
  'model_id' => $model->id
])->andWhere([
  'created_by_id' => Yii::$app->user->identity->id
]);

$posts = Feed::find()->where(['created_by_id' => $model->id])->count();

$following_count = Follow::find()->where([
  'model' => get_class($model)
])->andWhere([
  'created_by_id' => $model->id
])->count();

$msg = !empty($following->one()) ? 'Unfollow' : 'Follow';
$btn = !empty($following->one()) ? 'btn-outline-info' : 'btn-primary';
$isAdmin = Users::isAdmin() || Users::isManager() ? '' : 'd-none';
?>

<div class="card col-12 col-lg-6 col-xl-4 float-left user px-0 mr-3" style="border-radius: 15px;" id="<?= $model->id ?>">

  <?php if (strtotime($model->created_on) >= strtotime('now') - 3600) { ?>
    <div class="ribbon-wrapper ribbon-lg">
      <div class="ribbon bg-primary">New User</div>
    </div>
  <?php } ?>
  <div class="card-body">
    <div class="row">

      <div class="col-4 mr-2">
        <a href="<?= Url::toRoute(['user/view', 'id' => $model->id]) ?>">
          <img src="<?= $model->getImageUrl() ?>" alt="Generic placeholder image" class="img-fluid" style="width: 180px; height: 180px; border-radius: 10px; object-fit: cover;">
        </a>
      </div>
      <div class="col-7">
        <a href="<?= Url::toRoute(['user/view', 'id' => $model->id]) ?>">
          <h5 class="mb-1"><?= $model->name ?></h5>
          <p class="mb-2 pb-1" style="color: #2b2a2a;"><?= $model->getRole($model->roll_id) ?></p>
          <div class="row justify-content-start rounded-3 p-2 mb-2" style="background-color: #efefef;">
            <div class="col-3">
              <p class="small text-muted mb-1">Post</p>
              <p class="mb-0"><?= $posts ?></p>
            </div>
            <div class="col-4">
              <p class="small text-muted mb-1">Follower</p>
              <p class="mb-0"><?= $followers ?></p>
            </div>
            <div class="col-5">
              <p class="small text-muted mb-1">Following</p>
              <p class="mb-0"><?= $following_count ?></p>
            </div>
          </div>
        </a>
        <div class="row">
          <?php
          echo Html::button($msg, ['class' => "btn $btn follow flex-grow-1 col-xl-5 col-12 mt-1", 'id' => $model->id, 'data-id' => $model->id, 'data-key' => get_class($model)]);
          echo Html::a('<div class = "btn btn-primary"><i class="fa fa-pen text-white" aria-hidden="true"></i></div>', ['update', 'id' => $model->id], ['class' => 'col-xl-2 col-4 mt-1 ' . $isAdmin]);
          echo Html::a('<div class = "btn btn-danger"><i class="fa fa-trash text-white" aria-hidden="true"></i></div>', ['delete', 'id' => $model->id], ['class' => 'col-xl-2 col-4 mt-1 ' . $isAdmin]);
          echo Html::a('<div class = "btn btn-info"><i class="fas fa-copy text-white" aria-hidden="true"></i></div>', ['shadow', 'id' => $model->id], ['class' => 'col-xl-2 col-4 mt-1 ' . $isAdmin]);
          ?>
        </div>
      </div>
    </div>
  </div>

</div>