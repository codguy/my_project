<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use dosamigos\ckeditor\CKEditor;

/* @var $this yii\web\View */
/* @var $model app\models\Course */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="course-form">

    <?php

    $form = ActiveForm::begin([
        'options' => [
            'enctype' => 'multipart/form-data'
        ],
        'id' => 'create-course',
//         'action' => [
//             'course/create'
//         ]
    ]);
    ?>

    
    <div class="col-8 float-left">
        <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'dificulty')->textInput(['type' => 'range', 'min' => 1, 'max' => 3]) ?>
    </div>
	<div class="col-4 float-left"
		style="border: solid 1px grey; border-radius: 10px;">
		<img id="file-ip-1-preview" height="150px;" /><br /> <label
			for="file-ip-1" class="btn btn-primary"
			style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">Upload
			Image</label>
        <?= $form->field($model, 'image', ['template' => '{input}'])->fileInput(['onchange' => "showPreview(event);", 'id' => "file-ip-1", 'class' => 'form-input d-none']) ?>
    </div>

    <?=$form->field($model, 'desciption')->widget(CKEditor::class, ['options' => ['rows' => 6,'class' => 'from-control'],'preset' => 'advanced','clientOptions' => ['toolbar' => [['name' => 'row1','items' => ['Source','-','Bold','Italic','Underline','Strike','-','Subscript','Superscript','RemoveFormat','-','TextColor','BGColor','-','NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','list','indent','blocks','align','bidi','-','Link','Unlink','Anchor','-','ShowBlocks','Maximize']],['name' => 'row2','items' => ['Image','Table','HorizontalRule','SpecialChar','Iframe','-','NewPage','Print','Templates','-','Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo','-','Find','SelectAll','Format','Font','FontSize','base64image']]]]]);?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success', 'id' => 'submit-form']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<script>
    function showPreview(event) {
        if (event.target.files.length > 0) {
            var src = URL.createObjectURL(event.target.files[0]);
            var preview = document.getElementById("file-ip-1-preview");
            preview.src = src;
        }
    }

//     $(document).on('click', '#submit-form', function(){
//         var form = $("#create-course");
//         var data = $(form).serializeArray();
//         $('#create-course').submit();
//     });
</script>