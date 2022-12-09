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


        <div class="page-head">
            <h1><?php echo \yii\helpers\Html::encode($this->title); ?></h1>

            <div class="head-content">
                <?php if ($this->model != null) echo $this->model->getStateBadge(); ?>
                <?php

                $class = 'app\modules\favorite\widgets\Favorite';

                if (class_exists($class) && yii::$app->hasModule('favorite')) {
                    if ($this->model != null) {
                        echo $class::widget([
                            'model' => $this->model
                        ]);
                    }
                }

                ?>
            </div>
            <?php if ($this->showActions) : ?>
                <div class="state-information">


                </div>
            <?php endif; ?>

        </div>

        <!-- panel-menu -->



<?php
    }
}
