<?php
use app\models\Feed;
use app\widgets\FeedSuggestion;
use app\widgets\UserPhotos;
use yii\data\ActiveDataProvider;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
use yii\widgets\ListView;
?>
<div class="profile-page tx-13">

	<div class="row profile-body mt-4">
		<!-- left wrapper start -->
		<div class="d-none d-md-block col-md-4 col-xl-3 left-wrapper">
			<div class="card rounded">
				<div class="card-body">
					<div class="d-flex align-items-center justify-content-between mb-2">
						<h6 class="card-title mb-0">About</h6>
						<div class="dropdown">
							<button class="btn p-0" type="button" id="dropdownMenuButton"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-more-horizontal icon-lg text-muted pb-3px">
									<circle cx="12" cy="12" r="1"></circle>
									<circle cx="19" cy="12" r="1"></circle>
									<circle cx="5" cy="12" r="1"></circle>
								</svg>
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item d-flex align-items-center" href="#"> <svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="feather feather-edit-2 icon-sm mr-2">
										<path
											d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path>
									</svg> <span class="">Edit</span></a> <a
									class="dropdown-item d-flex align-items-center" href="#"> <svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="feather feather-git-branch icon-sm mr-2">
										<line x1="6" y1="3" x2="6" y2="15"></line>
										<circle cx="18" cy="6" r="3"></circle>
										<circle cx="6" cy="18" r="3"></circle>
										<path d="M18 9a9 9 0 0 1-9 9"></path>
									</svg> <span class="">Update</span></a> <a
									class="dropdown-item d-flex align-items-center" href="#"> <svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="feather feather-eye icon-sm mr-2">
										<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
										<circle cx="12" cy="12" r="3"></circle>
									</svg> <span class="">View all</span></a>
							</div>
						</div>
					</div>
					<p>Hi! I'm Amiah the Senior UI Designer at Vibrant. We hope you
						enjoy the design and quality of Social.</p>
					<div class="mt-3">
						<label class="tx-11 font-weight-bold mb-0 text-uppercase">Joined:</label>
						<p class="text-muted">November 15, 2015</p>
					</div>
					<div class="mt-3">
						<label class="tx-11 font-weight-bold mb-0 text-uppercase">Lives:</label>
						<p class="text-muted">New York, USA</p>
					</div>
					<div class="mt-3">
						<label class="tx-11 font-weight-bold mb-0 text-uppercase">Email:</label>
						<p class="text-muted">me@nobleui.com</p>
					</div>
					<div class="mt-3">
						<label class="tx-11 font-weight-bold mb-0 text-uppercase">Website:</label>
						<p class="text-muted">www.nobleui.com</p>
					</div>
					<div class="mt-3 d-flex social-links">
						<a href="javascript:;"
							class="btn d-flex align-items-center justify-content-center border mr-2 btn-icon github">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-github" data-toggle="tooltip" title=""
								data-original-title="github.com/nobleui">
								<path
									d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path>
							</svg>
						</a> <a href="javascript:;"
							class="btn d-flex align-items-center justify-content-center border mr-2 btn-icon twitter">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-twitter" data-toggle="tooltip" title=""
								data-original-title="twitter.com/nobleui">
								<path
									d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path>
							</svg>
						</a> <a href="javascript:;"
							class="btn d-flex align-items-center justify-content-center border mr-2 btn-icon instagram">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-instagram" data-toggle="tooltip" title=""
								data-original-title="instagram.com/nobleui">
								<rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>
								<path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
								<line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line>
							</svg>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- left wrapper end -->
		<!-- middle wrapper start -->
		<div class="col-md-8 col-xl-6 middle-wrapper">


			<div class="row">
				<div class="col-md-12">
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
    ?>
					<!-- comment box -->
					<h3 class="m-3">Create feed</h3>
					<span class="input-icon m-2"> <!-- <input type="text" class="form-control feed-title" placeholder="Add title..."> -->
						<?= $form->field($model, 'title')->textInput(['maxlength' => true, 'class' => 'form-control feed-title', 'placeholder' => "Add title..."]) ?>
					</span> <span class="input-icon m-2"> <!-- <textarea rows="3" class="form-control feed-text" placeholder="Write something..."></textarea> -->
						<?= $form->field($model, 'desciption')->textarea(['rows' => "3", 'class' => "form-control feed-text", 'placeholder' => "Write something..."]) ?>
						<div class="comment-area-btn">
							<div class="float-end">
								<?= Html::submitButton(Yii::t('app', 'Post'), ['class' => 'btn btn-sm btn-dark waves-effect waves-light float-right']) ?>
							</div>
							<div>
								<a href="#" class="btn btn-sm btn-light text-black-50"><i
									class="far fa-user"></i></a> <a href="#"
									class="btn btn-sm btn-light text-black-50"><i
									class="fa fa-map-marker"></i></a> <a href="#"
									class="btn btn-sm btn-light text-black-50" data-toggle="modal"
									data-target="#exampleModal"><i class="fa fa-camera"></i></a> <a
									href="#" class="btn btn-sm btn-light text-black-50"><i
									class="far fa-smile"></i></a>
							</div>
						</div>
					</span>
					<!-- end comment box -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Uploading a new
										photo</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<p class="body-desc">It will be easier for your friends to
										recognize you if you upload your real photo. You can upload
										the image in JPG, GIF or PNG format.</p>
									<div class="photo-input">
										<center>
											<img src='' alt="Charles Hall" id="file-ip-1-preview"
												style="display: none; max-height: 450px; max-width: 80%;" />
											<?= $form->field($model, 'image')->fileInput(['onchange' => "showPreview(event);", 'id' => "file-ip-1", 'class' => 'form-input d-none']) ?>
											<label class="btn btn-sm btn-primary text-center"
												for="file-ip-1"> Select a file </label>
										</center>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal" aria-label="Close">Upload</button>
								</div>
							</div>
						</div>
					</div>

					<?php ActiveForm::end(); ?>
					<?php

    $query = Feed::find();

    // add conditions that should always apply here

    $dataProvider = new ActiveDataProvider([
        'query' => $query,
        'sort' => [
            'defaultOrder' => [
                'created_on' => SORT_DESC
            ]
        ]
    ]);

    echo ListView::widget([
        'dataProvider' => $dataProvider,
        'layout' => '{items}',
        'itemView' => '_feed'
    ])?>
				</div>

			</div>
		</div>
	<!-- middle wrapper end -->
	<!-- right wrapper start -->
	<div class="d-none d-xl-block col-xl-3 right-wrapper">
		<div class="row">
				<?php echo UserPhotos::widget() ?>
				<?= FeedSuggestion::widget() ?>
			</div>
	</div>
	<!-- right wrapper end -->
</div>
</div>