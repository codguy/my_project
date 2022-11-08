<div class="col-md-12 grid-margin">
    <div class="card rounded">
        <div class="card-body">
            <h5>latest photos</h5><br>
            <div class="latest-photos">
                <div class="row">
                    <?php
                    foreach ($images->each() as $image) {
                        echo '<div class="col-md-4">
                            <figure>
                                <img class="img-fluid photos-widget" src="' . Yii::$app->request->baseUrl . '/../uploads/Feed/' . $image->name . '">
                            </figure>
                        </div>';
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>