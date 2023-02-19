<style>
#toast-container {
	position: fixed;
	z-index: 999999;
 	pointer-events: none;
	margin-top: 65px;
	margin-right: 10px;
}
.toast {
	border-radius: 8px !important;
}
.toast-progress {
	position: absolute;
	left: 0;
	bottom: 0;
	height: 4px;
	background-color: #fff;
	opacity: .6;
	-ms-filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=60);
	filter: alpha(opacity=60);
}
</style>
<?php
if (Yii::$app->session->hasFlash('success')) :
    echo \odaialali\yii2toastr\Toastr::widget([
        'toastType' => 'success',
        'message' => Yii::$app->session->getFlash('success'),
        'customStyle' => true,
        'options' => [
            'positionClass' => 'toast-top-right',
            'progressBar' => true,
            'timeOut' => 10000,
            'extendedTimeOut' => 5000
        ]
    ]);
endif;

if (Yii::$app->session->hasFlash('error')) :
    echo \odaialali\yii2toastr\Toastr::widget([
        'toastType' => 'error',
        'message' => Yii::$app->session->getFlash('error'),
        'customStyle' => false,
        'options' => [
            'positionClass' => 'toast-top-right',
            'progressBar' => true,
            'timeOut' => 10000,
            'extendedTimeOut' => 500
        ]
    ]);
endif;

if (Yii::$app->session->hasFlash('info')) :
    echo \odaialali\yii2toastr\Toastr::widget([
        'toastType' => 'info',
        'message' => Yii::$app->session->getFlash('info'),
        'customStyle' => true,
        'options' => [
            'positionClass' => 'toast-top-right',
            'progressBar' => true,
            'timeOut' => 10000,
            'extendedTimeOut' => 500
        ]
    ]);
endif;

if (Yii::$app->session->hasFlash('warning')) :
    echo \odaialali\yii2toastr\Toastr::widget([
        'toastType' => 'warning',
        'message' => Yii::$app->session->getFlash('warning'),
        'customStyle' => false,
        'options' => [
            'positionClass' => 'toast-top-right',
            'progressBar' => true,
            'timeOut' => 10000,
            'extendedTimeOut' => 500
        ]
    ]);
endif;

if (Yii::$app->session->hasFlash('danger')) :
    echo \odaialali\yii2toastr\Toastr::widget([
        'toastType' => 'danger',
        'message' => Yii::$app->session->getFlash('danger'),
        'customStyle' => false,
        'options' => [
            'positionClass' => 'toast-top-right',
            'progressBar' => true,
            'timeOut' => 10000,
            'extendedTimeOut' => 500
        ]
    ]);
endif;