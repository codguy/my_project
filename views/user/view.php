<?php

use app\models\Feed;
use app\models\Follow;
use app\models\Skill;
use app\models\SocialLink;
use app\models\Users;
use yii\data\ActiveDataProvider;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ListView;
use yii\bootstrap4\ActiveForm;
use app\models\Course;
use app\widgets\CreateFeed;
use app\widgets\LoadFeed;

/* @var $this yii\web\View */
/* @var $model app\models\Users */

\yii\web\YiiAsset::register($this);

?>
<style>
</style>
<div class="users-view">

  <div class="main-body">

    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="main-breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><?= Html::a('Home', ['site/index']) ?></li>

        <li class="breadcrumb-item"><?= Html::a('Users', ['user/index']) ?></li>
        <li class="breadcrumb-item active" aria-current="page">User Profile</li>
      </ol>
    </nav>
    <!-- /Breadcrumb -->

    <div class="row gutters-sm">
      <div class="col-md-4 mb-3">
        <div class="card">
          <div class="card-body">
            <div class="d-flex flex-column align-items-center text-center">
              <img src="<?= $model->getImageUrl() ?>" alt="Admin" class="profile_pic" height="180" width="180">
              <div class="mt-3">
                <h4><?= $model->username ?></h4>
                <?php
                $followers = Follow::find()->cache(10)->where([
                  'model' => get_class($model),
                  'model_id' => $model->id
                ])->count();
                $following = Follow::find()->cache(10)->where([
                  'model' => get_class($model),
                  'model_id' => $model->id
                ])
                  ->andWhere([
                    'created_by_id' => Yii::$app->user->identity->id
                  ])
                  ->one();
                $msg = !empty($following) ? 'Unfollow' : 'Follow';
                $btn = !empty($following) ? 'btn-outline-info' : 'btn-primary';
                $delete = (Yii::$app->user->identity->roll_id != Users::ROLE_ADMIN || Yii::$app->user->identity->id == $model->id) ? 'd-none' : '';
                $update = (Users::isAdmin() || Users::isManager() || Users::isSelf($model->id)) ? '' : 'd-none';
                ?>

                <p class="text-secondary mb-1"><span class="followers-count"><?= $followers ?></span> followers</p>
                <?= Html::button($msg, ['class' => "btn $btn", 'id' => 'follow', 'data-id' => $model->id, 'data-key' => get_class($model)]) ?>
                <?= Html::a('Update', ['user/update', 'id' => $model->id], ['class' => "btn btn-warning $update"]) ?>
                <?= Html::a('Delete', ['user/delete', 'id' => $model->id], ['class' => "btn btn-outline-danger $delete", 'data-method' => 'POST']) ?>
                <!--                       <button class="btn btn-outline-primary">Message</button> -->
              </div>
            </div>
          </div>
        </div>
        <div class="card mt-3">
          <ul class="list-group list-group-flush">
            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
              <h6 class="mb-0">Social Links</h6>
              <?php

              echo Html::a('<i class="fa fa-plus"></i>', [
                'user/add-social',
                'created_by_id' => $model->id
              ], [
                'class' => 'btn btn-primary'
              ]) ?>
            </li>
            <?php
            $socials = SocialLink::find()->cache(10)->where([
              'created_by_id' => $model->id
            ]);
            $list = [];
            foreach ($socials->each() as $social) {
              $list[$social->platform] = $social->link;
            }
            ?>
            <?php

            if (!empty($list['website'])) {
            ?>
              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                <h6 class="mb-0">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe mr-2 icon-inline">
                    <circle cx="12" cy="12" r="10"></circle>
                    <line x1="2" y1="12" x2="22" y2="12"></line>
                    <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>
                  </svg>
                  Website
                </h6> <span class="text-secondary"><?= $list['website'] ?></span>
              </li>
            <?php
            }
            if (!empty($list['github'])) {
            ?>
              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                <h6 class="mb-0">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-github mr-2 icon-inline">
                    <path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path>
                  </svg>
                  Github
                </h6> <span class="text-secondary"><?= $list['github'] ?></span>
              </li>
            <?php
            }
            if (!empty($list['twitter'])) {
            ?>

              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                <h6 class="mb-0">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-twitter mr-2 icon-inline text-info">
                    <path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path>
                  </svg>
                  Twitter
                </h6> <span class="text-secondary"><?= $list['twitter'] ?></span>
              </li>
            <?php
            }
            if (!empty($list['instagram'])) {
            ?>

              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                <h6 class="mb-0">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-instagram mr-2 icon-inline text-danger">
                    <rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>
                    <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
                    <line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line>
                  </svg>
                  Instagram
                </h6> <span class="text-secondary"><?= $list['instagram'] ?></span>
              </li>
            <?php
            }
            if (!empty($list['facebook'])) {
            ?>

              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                <h6 class="mb-0">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-facebook mr-2 icon-inline text-primary">
                    <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path>
                  </svg>
                  Facebook
                </h6> <span class="text-secondary"><?= $list['facebook'] ?></span>
              </li>
            <?php
            }
            ?>

          </ul>
        </div>
        <div class="card card-primary">
          <div class="card-header">
            <h3 class="card-title">About Me</h3>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <strong><i class="fas fa-book mr-1"></i> Education</strong>

            <p class="text-muted">
              B.S. in Computer Science from the University of Tennessee at Knoxville
            </p>

            <hr>

            <strong><i class="fas fa-map-marker-alt mr-1"></i> Location</strong>

            <p class="text-muted">Malibu, California</p>

            <hr>

            <strong><i class="fas fa-pencil-alt mr-1"></i> Skills</strong>

            <p class="text-muted">
              <span class="tag tag-danger">UI Design</span>
              <span class="tag tag-success">Coding</span>
              <span class="tag tag-info">Javascript</span>
              <span class="tag tag-warning">PHP</span>
              <span class="tag tag-primary">Node.js</span>
            </p>

            <hr>

            <strong><i class="far fa-file-alt mr-1"></i> Notes</strong>

            <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
          </div>
          <!-- /.card-body -->
        </div>
      </div>
      <div class="col-md-8">
        <div class="card mb-3">
          <div class="card-body">
            <div class="row">
              <div class="col-sm-3">
                <h6 class="mb-0">Full Name</h6>
              </div>
              <div class="col-sm-9 text-secondary">
                <?= $model->username ?>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <h6 class="mb-0">Email</h6>
              </div>
              <div class="col-sm-9 text-secondary">
                <?= $model->email ?>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <h6 class="mb-0">State</h6>
              </div>
              <div class="col-sm-9 text-secondary">
                <span class="badge badge-<?= $model->getBadge($model->state_id) ?>"><?= $model->getState($model->state_id) ?></span>

              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <h6 class="mb-0">Date of birth</h6>
              </div>
              <div class="col-sm-9 text-secondary">
                <?= date('d-M-Y', strtotime($model->dob)) ?>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <h6 class="mb-0">Gender</h6>
              </div>
              <div class="col-sm-9 text-secondary">
                <?= $model->gender ?>
              </div>
            </div>
          </div>
        </div>

        <div class="modal fade" id="skillModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Add New
                  Skill</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <label for="customRange2" class="form-label">Skill Proficiency</label>
                <input type="text" class="form-control" name="Skill" id="skill-name"> <label for="level" class="form-label">Skill
                  Proficiency</label><br /> <input type="range" class="form-range col-12" min="0" max="2" id="level">
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="skill-submit" data-id="<?php

                                                                                          echo $model->id ?>" data-key="<?php

                                                                                                                        echo get_class($model) ?>">Save</button>
              </div>
            </div>
          </div>
        </div>

        <div class="card">
          <div class="card-body skill-card">
            <h6>
              <b>Skills : </b>

              <div class="mt-n3 float-right">
                <span class="m-1 p-2 badge badge-pill badge-secondary">Noob</span>
                <span class="m-1 p-2 badge badge-pill badge-primary">Rookie</span>
                <span class="m-1 p-2 badge badge-pill badge-success">Pro</span>
              </div>
            </h6>
            <?php
            $skills = Skill::find()->where([
              'model' => get_class($model),
              'model_id' => $model->id
            ]);
            if (!empty($skills->count())) {
              foreach ($skills->each() as $skill) {
                echo Users::getSkillBadge($skill->skill, $skill->level);
              }
            }
            echo Html::a('<i class="fa fa-plus"></i>', [
              '#'
            ], [
              'class' => 'badge badge-primary',
              'id' => 'add-skill',
              'data-toggle' => "modal",
              'data-target' => "#skillModalCenter"
            ]) ?>
          </div>
        </div>

        <div class="col-md-12">
          <?php

          if ($model->id == Yii::$app->user->id) {
            echo CreateFeed::widget(); //if user opens his own 
          }
          ?>
          <?php

          echo LoadFeed::widget(['id' => $model->id]);

          ?>
        </div>

      </div>
    </div>
  </div>

</div>
<script>
  function showPreview(event) {
    if (event.target.files.length > 0) {
      var src = URL.createObjectURL(event.target.files[0]);
      var preview = document.getElementById("file-ip-1-preview");
      preview.src = src;
      preview.style.display = "block";
    }
  }
  // jQuery.noConflict();
  $(document).on('click', '#follow', function() {
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
        $('.followers-count').text(data);
        if ($('#follow').html() == 'Follow') {
          $('#follow').html('Unfollow');
          $('#follow').removeClass('btn-primary');
          $('#follow').addClass('btn-outline-info');
        } else {
          $('#follow').html('Follow');
          $('#follow').removeClass('btn-outline-info');
          $('#follow').addClass('btn-primary');
        }
      }
    });
  });
  $(document).on('click', '#skill-submit', function() {
    var skill = $('#skill-name').val();
    var level = $('#level').val();
    var id = $(this).attr('data-id');
    var model = $(this).attr('data-key');
    var arr = {
      id: id,
      model: model,
      skill: skill,
      level: level
    }
    $.ajax({
      type: 'POST',
      dataType: 'json',
      data: arr,
      url: '<?= Url::toRoute(['user/add-skill']) ?>',
      success: function(result) {
        location.reload();
        $('#skillModalCenter').modal('hide');
        $('#add-skill').remove();
        $('.skill-card').append(data.responseText);
        $('.skill-card').append('<?php

                                  echo Html::a('<i class="fa fa-plus"></i>', [
                                    '#'
                                  ], [
                                    'class' => 'badge badge-primary',
                                    'id' => 'add-skill',
                                    'data-toggle' => "modal",
                                    'data-target' => "#skillModalCenter"
                                  ]) ?>');
        $('#skill-name').val('');
        $('#level').val('0');
      },
      complete: function(data) {
        location.reload();
        $('#skillModalCenter').modal('hide');
        $('#add-skill').remove();
        $('.skill-card').append(data.responseText);
        $('.skill-card').append('<?php

                                  echo Html::a('<i class="fa fa-plus"></i>', [
                                    '#'
                                  ], [
                                    'class' => 'badge badge-primary',
                                    'id' => 'add-skill',
                                    'data-toggle' => "modal",
                                    'data-target' => "#skillModalCenter"
                                  ]) ?>');
        $('#skill-name').val('');
        $('#level').val('0');
      }
    });
  });
</script>