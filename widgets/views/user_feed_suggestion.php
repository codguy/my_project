<div class="col-md-12 grid-margin">
    <div class="card rounded">
        <div class="card-body">
            <h5>suggestions for you</h5><br>
            <?php

            use yii\helpers\Url;

            foreach ($users->each() as $model) { ?>

                <div class="d-flex justify-content-between mb-2 pb-2 border-bottom">
                    <div class="d-flex align-items-center hover-pointer">
                        <img class="rounded-circle" src="<?= $model->getImageUrl() ?>" alt="..." style="overflow: hidden; object-fit: cover;" width="50px" height="50px">
                        <div class="ml-2">
                            <p style="margin-bottom: 5px;"><?= $model->username ?></p>
                            <p class="tx-11 text-muted">12 Mutual Friends</p>
                        </div>
                    </div>
                    <a href="<?= Url::toRoute(['user/view', 'id' => $model->id]) ?>">
                        <button class="btn btn-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-plus" data-toggle="tooltip" title="" data-original-title="Connect">
                                <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                <circle cx="8.5" cy="7" r="4"></circle>
                                <line x1="20" y1="8" x2="20" y2="14"></line>
                                <line x1="23" y1="11" x2="17" y2="11"></line>
                            </svg>
                        </button>
                    </a>
                </div>
            <?php }
            ?>
        </div>
    </div>
</div>