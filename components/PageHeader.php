<?php
namespace app\components;

use Yii;
use yii\helpers\Inflector;

class PageHeader extends TBaseWidget
{

    public $title;

    public $subtitle;

    public $model;

    public $showActions = true;

    public $showAdd = true;

    public function run()
    {
        if ($this->title === null) {
            if ($this->model != null) {
                $this->title = (string) $this->model;
            } else {
                $id = str_replace('admin/', '', Yii::$app->controller->id);
                $this->title = Inflector::pluralize(Inflector::camel2words($id));
            }
        }
        if ($this->subtitle === null) {

            $this->subtitle = Inflector::camel2words(Yii::$app->controller->action->id);
        }
        $this->renderHtml();
    }

    public function renderHtml()
    {
        ?>

<div class="card mt-4">
	<div class="page-head card-title">
		<h1 class="px-4" style="font-size: 5rem;"><?php echo \yii\helpers\Html::encode($this->title); ?></h1>

		<div class="head-content">
                <?php

        if ($this->model != null) {
            echo $this->model->getStateBadge();
        }

        ?>
            </div>
            <?php if ($this->showActions) : ?>
                <div class="state-information"></div>
            <?php endif; ?>

        </div>
</div>
<!-- panel-menu -->



<?php
    }
}
