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

/* @var $this yii\web\View */
/* @var $model app\models\Users */

\yii\web\YiiAsset::register($this);

?>
<style>
</style>
<div class="users-view">

	<div class="container">
		<div class="main-body">

			<!-- Breadcrumb -->
			<nav aria-label="breadcrumb" class="main-breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><?=Html::a('Home', ['site/index'])?></li>

					<li class="breadcrumb-item"><?=Html::a('Users', ['user/index'])?></li>
					<li class="breadcrumb-item active" aria-current="page">User Profile</li>
				</ol>
			</nav>
			
			
			
			  <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">

            <!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle"
                       src="../../dist/img/user4-128x128.jpg"
                       alt="User profile picture">
                </div>

                <h3 class="profile-username text-center">Nina Mcintire</h3>

                <p class="text-muted text-center">Software Engineer</p>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>Followers</b> <a class="float-right">1,322</a>
                  </li>
                  <li class="list-group-item">
                    <b>Following</b> <a class="float-right">543</a>
                  </li>
                  <li class="list-group-item">
                    <b>Friends</b> <a class="float-right">13,287</a>
                  </li>
                </ul>

                <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- About Me Box -->
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
            <!-- /.card -->
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card">
              <div class="card-header p-2">
                <ul class="nav nav-pills">
                  <li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">Activity</a></li>
                  <li class="nav-item"><a class="nav-link" href="#timeline" data-toggle="tab">Timeline</a></li>
                  <li class="nav-item"><a class="nav-link" href="#settings" data-toggle="tab">Settings</a></li>
                </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="active tab-pane" id="activity">
                    <!-- Post -->
                    <div class="post">
                      <div class="user-block">
                        <img class="img-circle img-bordered-sm" src="../../dist/img/user1-128x128.jpg" alt="user image">
                        <span class="username">
                          <a href="#">Jonathan Burke Jr.</a>
                          <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
                        </span>
                        <span class="description">Shared publicly - 7:30 PM today</span>
                      </div>
                      <!-- /.user-block -->
                      <p>
                        Lorem ipsum represents a long-held tradition for designers,
                        typographers and the like. Some people hate it and argue for
                        its demise, but others ignore the hate as they create awesome
                        tools to help create filler text for everyone from bacon lovers
                        to Charlie Sheen fans.
                      </p>

                      <p>
                        <a href="#" class="link-black text-sm mr-2"><i class="fas fa-share mr-1"></i> Share</a>
                        <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i> Like</a>
                        <span class="float-right">
                          <a href="#" class="link-black text-sm">
                            <i class="far fa-comments mr-1"></i> Comments (5)
                          </a>
                        </span>
                      </p>

                      <input class="form-control form-control-sm" type="text" placeholder="Type a comment">
                    </div>
                    <!-- /.post -->

                    <!-- Post -->
                    <div class="post clearfix">
                      <div class="user-block">
                        <img class="img-circle img-bordered-sm" src="../../dist/img/user7-128x128.jpg" alt="User Image">
                        <span class="username">
                          <a href="#">Sarah Ross</a>
                          <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
                        </span>
                        <span class="description">Sent you a message - 3 days ago</span>
                      </div>
                      <!-- /.user-block -->
                      <p>
                        Lorem ipsum represents a long-held tradition for designers,
                        typographers and the like. Some people hate it and argue for
                        its demise, but others ignore the hate as they create awesome
                        tools to help create filler text for everyone from bacon lovers
                        to Charlie Sheen fans.
                      </p>

                      <form class="form-horizontal">
                        <div class="input-group input-group-sm mb-0">
                          <input class="form-control form-control-sm" placeholder="Response">
                          <div class="input-group-append">
                            <button type="submit" class="btn btn-danger">Send</button>
                          </div>
                        </div>
                      </form>
                    </div>
                    <!-- /.post -->

                    <!-- Post -->
                    <div class="post">
                      <div class="user-block">
                        <img class="img-circle img-bordered-sm" src="../../dist/img/user6-128x128.jpg" alt="User Image">
                        <span class="username">
                          <a href="#">Adam Jones</a>
                          <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
                        </span>
                        <span class="description">Posted 5 photos - 5 days ago</span>
                      </div>
                      <!-- /.user-block -->
                      <div class="row mb-3">
                        <div class="col-sm-6">
                          <img class="img-fluid" src="../../dist/img/photo1.png" alt="Photo">
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                          <div class="row">
                            <div class="col-sm-6">
                              <img class="img-fluid mb-3" src="../../dist/img/photo2.png" alt="Photo">
                              <img class="img-fluid" src="../../dist/img/photo3.jpg" alt="Photo">
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-6">
                              <img class="img-fluid mb-3" src="../../dist/img/photo4.jpg" alt="Photo">
                              <img class="img-fluid" src="../../dist/img/photo1.png" alt="Photo">
                            </div>
                            <!-- /.col -->
                          </div>
                          <!-- /.row -->
                        </div>
                        <!-- /.col -->
                      </div>
                      <!-- /.row -->

                      <p>
                        <a href="#" class="link-black text-sm mr-2"><i class="fas fa-share mr-1"></i> Share</a>
                        <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i> Like</a>
                        <span class="float-right">
                          <a href="#" class="link-black text-sm">
                            <i class="far fa-comments mr-1"></i> Comments (5)
                          </a>
                        </span>
                      </p>

                      <input class="form-control form-control-sm" type="text" placeholder="Type a comment">
                    </div>
                    <!-- /.post -->
                  </div>
                  <!-- /.tab-pane -->
                  <div class="tab-pane" id="timeline">
                    <!-- The timeline -->
                    <div class="timeline timeline-inverse">
                      <!-- timeline time label -->
                      <div class="time-label">
                        <span class="bg-danger">
                          10 Feb. 2014
                        </span>
                      </div>
                      <!-- /.timeline-label -->
                      <!-- timeline item -->
                      <div>
                        <i class="fas fa-envelope bg-primary"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i> 12:05</span>

                          <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>

                          <div class="timeline-body">
                            Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                            weebly ning heekya handango imeem plugg dopplr jibjab, movity
                            jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                            quora plaxo ideeli hulu weebly balihoo...
                          </div>
                          <div class="timeline-footer">
                            <a href="#" class="btn btn-primary btn-sm">Read more</a>
                            <a href="#" class="btn btn-danger btn-sm">Delete</a>
                          </div>
                        </div>
                      </div>
                      <!-- END timeline item -->
                      <!-- timeline item -->
                      <div>
                        <i class="fas fa-user bg-info"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i> 5 mins ago</span>

                          <h3 class="timeline-header border-0"><a href="#">Sarah Young</a> accepted your friend request
                          </h3>
                        </div>
                      </div>
                      <!-- END timeline item -->
                      <!-- timeline item -->
                      <div>
                        <i class="fas fa-comments bg-warning"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i> 27 mins ago</span>

                          <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>

                          <div class="timeline-body">
                            Take me to your leader!
                            Switzerland is small and neutral!
                            We are more like Germany, ambitious and misunderstood!
                          </div>
                          <div class="timeline-footer">
                            <a href="#" class="btn btn-warning btn-flat btn-sm">View comment</a>
                          </div>
                        </div>
                      </div>
                      <!-- END timeline item -->
                      <!-- timeline time label -->
                      <div class="time-label">
                        <span class="bg-success">
                          3 Jan. 2014
                        </span>
                      </div>
                      <!-- /.timeline-label -->
                      <!-- timeline item -->
                      <div>
                        <i class="fas fa-camera bg-purple"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i> 2 days ago</span>

                          <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>

                          <div class="timeline-body">
                            <img src="https://placehold.it/150x100" alt="...">
                            <img src="https://placehold.it/150x100" alt="...">
                            <img src="https://placehold.it/150x100" alt="...">
                            <img src="https://placehold.it/150x100" alt="...">
                          </div>
                        </div>
                      </div>
                      <!-- END timeline item -->
                      <div>
                        <i class="far fa-clock bg-gray"></i>
                      </div>
                    </div>
                  </div>
                  <!-- /.tab-pane -->

                  <div class="tab-pane" id="settings">
                    <form class="form-horizontal">
                      <div class="form-group row">
                        <label for="inputName" class="col-sm-2 col-form-label">Name</label>
                        <div class="col-sm-10">
                          <input type="email" class="form-control" id="inputName" placeholder="Name">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                          <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputName2" class="col-sm-2 col-form-label">Name</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" id="inputName2" placeholder="Name">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputExperience" class="col-sm-2 col-form-label">Experience</label>
                        <div class="col-sm-10">
                          <textarea class="form-control" id="inputExperience" placeholder="Experience"></textarea>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputSkills" class="col-sm-2 col-form-label">Skills</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" id="inputSkills" placeholder="Skills">
                        </div>
                      </div>
                      <div class="form-group row">
                        <div class="offset-sm-2 col-sm-10">
                          <div class="checkbox">
                            <label>
                              <input type="checkbox"> I agree to the <a href="#">terms and conditions</a>
                            </label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group row">
                        <div class="offset-sm-2 col-sm-10">
                          <button type="submit" class="btn btn-danger">Submit</button>
                        </div>
                      </div>
                    </form>
                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
			<!-- /Breadcrumb -->

			<div class="row gutters-sm">
				<div class="col-md-4 mb-3">
					<div class="card">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">
								<img src="<?=$model->getImageUrl()?>" alt="Admin"
									class="profile_pic" height="180" width="180">
								<div class="mt-3">
									<h4><?=$model->username?></h4>
                      <?php
                    $followers = Follow::find()->where([
                        'model' => get_class($model),
                        'model_id' => $model->id
                    ])->count();
                    $following = Follow::find()->where([
                        'model' => get_class($model),
                        'model_id' => $model->id
                    ])
                        ->andWhere([
                        'user_id' => Yii::$app->user->identity->id
                    ])
                        ->one();
                    $msg = ! empty($following) ? 'Unfollow' : 'Follow';
                    $btn = ! empty($following) ? 'btn-outline-info' : 'btn-primary';
                    $delete = (Yii::$app->user->identity->roll_id != Users::ROLE_ADMIN || Yii::$app->user->identity->id == $model->id) ? 'd-none' : '';
                    $update = (Users::isAdmin() || Users::isManager() || Users::isSelf($model->id)) ? '' : 'd-none';
                    ?>
                    
                      <p class="text-secondary mb-1"><span class="followers-count"><?=$followers?></span> followers</p>
					  <?=Html::button($msg, ['class' => "btn $btn",'id' => 'follow','data-id' => $model->id,'data-key' => get_class($model)])?>
                      <?=Html::a('Update', ['user/update','id' => $model->id], ['class' => "btn btn-warning $update"])?>
                      <?=Html::a('Delete', ['user/delete','id' => $model->id], ['class' => "btn btn-outline-danger $delete",'data-method' => 'POST'])?>
<!--                       <button class="btn btn-outline-primary">Message</button> -->
								</div>
							</div>
						</div>
					</div>
					<div class="card mt-3">
						<ul class="list-group list-group-flush">
							<li
								class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
								<h6 class="mb-0">Social Links</h6>
                    <?php

                    echo Html::a('<i class="fa fa-plus"></i>', [
                        'user/add-social',
                        'user_id' => $model->id
                    ], [
                        'class' => 'btn btn-primary'
                    ])?>
                  </li>
                  <?php
                $socials = SocialLink::find()->where([
                    'user_id' => $model->id
                ]);
                $list = [];
                foreach ($socials->each() as $social) {
                    $list[$social->platform] = $social->link;
                }
                ?>
                  <?php

                if (! empty($list['website'])) {
                    ?>
                  <li
								class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
								<h6 class="mb-0">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="feather feather-globe mr-2 icon-inline">
										<circle cx="12" cy="12" r="10"></circle>
										<line x1="2" y1="12" x2="22" y2="12"></line>
										<path
											d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>
									Website
								</h6> <span class="text-secondary"><?php

                    echo $list['website']?></span>
							</li>
                  <?php
                }
                if (! empty($list['github'])) {
                    ?>
                  <li
								class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
								<h6 class="mb-0">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="feather feather-github mr-2 icon-inline">
										<path
											d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>
									Github
								</h6> <span class="text-secondary"><?php

                    echo $list['github']?></span>
							</li>
                  <?php
                }
                if (! empty($list['twitter'])) {
                    ?>
                  
                  <li
								class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
								<h6 class="mb-0">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="feather feather-twitter mr-2 icon-inline text-info">
										<path
											d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg>
									Twitter
								</h6> <span class="text-secondary"><?php

                    echo $list['twitter']?></span>
							</li>
                  <?php
                }
                if (! empty($list['instagram'])) {
                    ?>
                  
                  <li
								class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
								<h6 class="mb-0">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="feather feather-instagram mr-2 icon-inline text-danger">
										<rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>
										<path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
										<line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>
									Instagram
								</h6> <span class="text-secondary"><?php

                    echo $list['instagram']?></span>
							</li>
                  <?php
                }
                if (! empty($list['facebook'])) {
                    ?>
                  
                  <li
								class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
								<h6 class="mb-0">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="feather feather-facebook mr-2 icon-inline text-primary">
										<path
											d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>
									Facebook
								</h6> <span class="text-secondary"><?php

                    echo $list['facebook']?></span>
							</li>
                  <?php
                }
                ?>
                  
                </ul>
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
                      <?=$model->username?>
                    </div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Email</h6>
								</div>
								<div class="col-sm-9 text-secondary">
                      <?=$model->email?>
                    </div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">State</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<span
										class="badge badge-<?=$model->getBadge($model->state_id)?>"><?=$model->getState($model->state_id)?></span>

								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Date of birth</h6>
								</div>
								<div class="col-sm-9 text-secondary">
                      <?=date('d-M-Y', strtotime($model->dob))?>
                    </div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Gender</h6>
								</div>
								<div class="col-sm-9 text-secondary">
                      <?=$model->gender?>
                    </div>
							</div>
						</div>
					</div>

					<div class="modal fade" id="skillModalCenter" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalCenterTitle"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLongTitle">Add New
										Skill</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<label for="customRange2" class="form-label">Skill Proficiency</label>
									<input type="text" class="form-control" name="Skill"
										id="skill-name"> <label for="level" class="form-label">Skill
										Proficiency</label><br /> <input type="range"
										class="form-range col-12" min="0" max="2" id="level">
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary" id="skill-submit"
										data-id="<?php

        echo $model->id?>"
										data-key="<?php

        echo get_class($model)?>">Save</button>
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
                            if (! empty($skills->count())) {
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
                            ])?>
                         </div>
					</div>

<div class="col-md-12">
<?php

if ($model->id == Yii::$app->user->id) {
    ?>

<?php
    $form = ActiveForm::begin([
        'id' => 'signup-form',
        'options' => [
            'enctype' => 'multipart/form-data',
            'class' => "comment-area-box mb-3 card",
            'style' => "border-radius:10px;border:2px solid silver;"
        ],
        'action' => [
            'user/create-feed'
        ],
        'method' => 'POST',
        'fieldConfig' => [
            'template' => "{input}\n{error}",
            'labelOptions' => [
                'class' => 'col-form-label mr-lg-3'
            ],
            'inputOptions' => [
                'class' => 'form-control'
            ],
            'errorOptions' => [
                'class' => 'invalid-feedback'
            ]
        ]
    ]);
    $feed = new Feed();
    ?>
	<!-- comment box -->
    <h3 class="m-3">Create feed</h3>
    	<span class="input-icon m-2">
            <!-- <input type="text" class="form-control feed-title" placeholder="Add title..."> -->
            <?=$form->field($feed, 'title')->textInput(['maxlength' => true,'class' => 'form-control feed-title','placeholder' => "Add title..."])?>
        </span>
        <span class="input-icon m-2">
            <!-- <textarea rows="3" class="form-control feed-text" placeholder="Write something..."></textarea> -->
            <?=$form->field($feed, 'desciption')->textarea(['rows' => "3",'class' => "form-control feed-text",'placeholder' => "Write something..."])?>
            <div class="comment-area-btn">
                <div class="float-end">
                    <?=Html::submitButton(Yii::t('app', 'Post'), ['class' => 'btn btn-sm btn-dark waves-effect waves-light float-right'])?>
                </div>
                <div>
                    <a href="#" class="btn btn-sm btn-light text-black-50"><i class="far fa-user"></i></a>
                    <a href="#" class="btn btn-sm btn-light text-black-50"><i class="fa fa-map-marker"></i></a>
                    <a href="#" class="btn btn-sm btn-light text-black-50" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-camera"></i></a>
                    <a href="#" class="btn btn-sm btn-light text-black-50"><i class="far fa-smile"></i></a>
                </div>
            </div>
        </span>
    <!-- end comment box -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
Uploading a new photo</h5> <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
            </div>
            <div class="modal-body">
                <p class="body-desc"> 
It will be easier for your friends to recognize you if you upload your real photo. You can upload the image in JPG, GIF or PNG format. </p>
                <div class="photo-input">
                	<center>
            			<img src='' alt="Charles Hall" id="file-ip-1-preview" style="display:none; max-height:450px; max-width:80%;"/> 
                		<?=$form->field($feed, 'image')->fileInput(['onchange' => "showPreview(event);",'id' => "file-ip-1",'class' => 'form-input d-none'])?>
                		<label class="btn btn-sm btn-primary text-center" for="file-ip-1">
                			 Select a file 
            			</label> 
        			</center> 
    			</div>
            </div>
            <div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">Upload</button>
            </div>
        </div>
    </div>
</div>

    <?php

    ActiveForm::end();
    ?>
<?php
}
?>
    <?php

    $query = Feed::find()->where([
        'created_by_id' => $model->id
    ]);

    // add conditions that should always apply here

    $dataProvider = new ActiveDataProvider([
        'query' => $query,
        'sort' => [
            'defaultOrder' => [
                'created_on' => SORT_DESC
            ]
        ]
    ]);

    if ($query->count() > Users::STATE_ZERO) {
        echo ListView::widget([
            'dataProvider' => $dataProvider,
            'layout' => '{items}',
            'itemView' => '_feed'
        ]);
    }

    ?>
</div>

				</div>
			</div>


		</div>
	</div>

</div>
<script>
// jQuery.noConflict();
$(document).on('click','#follow',function(){
	var id = $(this).attr('data-id');
	var model = $(this).attr('data-key');
	var arr = {
	 	  	id : id,
	    	model : model
	}
	$.ajax({
	    type: 'POST',
        dataType: 'json',
	    data: arr,
		url: '<?=Url::toRoute(['user/follow'])?>',
		success: function(data) {
			$('.followers-count').text(data);
			if($('#follow').html() == 'Follow'){
				$('#follow').html('Unfollow');
				$('#follow').removeClass('btn-primary');
				$('#follow').addClass('btn-outline-info');	
			}else{
				$('#follow').html('Follow');
				$('#follow').removeClass('btn-outline-info');
				$('#follow').addClass('btn-primary');
			}
		}
	});
});
$(document).on('click','#skill-submit',function(){
	var skill = $('#skill-name').val();
	var level = $('#level').val();
	var id = $(this).attr('data-id');
	var model = $(this).attr('data-key');
	var arr = {
	 	  	id : id,
	    	model : model,
	    	skill : skill,
	    	level : level
	}
	$.ajax({
	    type: 'POST',
        dataType: 'json',
	    data: arr,
		url: '<?=Url::toRoute(['user/add-skill'])?>',
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
    ])?>');
    		$('#skill-name').val('');
    		$('#level').val('0');
		},
      	complete: function (data) {
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
    ])?>');
    		$('#skill-name').val('');
    		$('#level').val('0');
      	}
	});
});
</script>
