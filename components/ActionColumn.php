<?php
namespace app\components;

use app\models\User;
use Yii;
use yii\helpers\Html;
use app\models\Users;

class ActionColumn extends \yii\grid\ActionColumn
{

    function init()
    {
        parent::init();
        $this->initDefaultButtons();
        $this->urlCreator = function ($action, $model, $key, $index) {
            return $model->getUrl($action);
        };
    }

    protected function initDefaultButtons()
    {
        if (! isset($this->buttons['view'])) {

            $this->buttons['view'] = function ($url, $model, $key) {

                $options = array_merge([
                    'title' => Yii::t('yii', 'View'),
                    'aria-label' => Yii::t('yii', 'View'),
                    'data-pjax' => '0',
                    'class' => 'btn btn-success mr-1 mb-1 waves-effect waves-light'
                ], $this->buttonOptions);
                return Html::a('<i class="users-edit-icon fa fa-eye"></i>', $url, $options);
            };
        }

        if (! isset($this->buttons['update']) /* && empty($this->isValidAction("update")) */) {
            $this->buttons['update'] = function ($url, $model, $key) {

                $options = array_merge([
                    'title' => Yii::t('yii', 'Update'),
                    'aria-label' => Yii::t('yii', 'Update'),
                    'data-pjax' => '0',
                    'class' => 'btn btn-warning mr-1 mb-1 waves-effect waves-light text-white'
                ], $this->buttonOptions);
                return Html::a('<i class="users-edit-icon fa fa-pen"></i>', $url, $options);
            };
        }

        if (! isset($this->buttons['delete']) /* && empty($this->isValidAction("delete")) */) {
            $this->buttons['delete'] = function ($url, $model, $key) {

                $options = array_merge([
                    'title' => Yii::t('yii', 'Delete'),
                    'aria-label' => Yii::t('yii', 'Delete'),
                    'data-confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                    'data-method' => 'post',
                    'data-pjax' => '0',
                    'data-url' => $url,
                    'class' => 'btn btn-danger mr-1 mb-1 waves-effect waves-light'
                ], $this->buttonOptions);
                return Html::a('<i class="users-delete-icon fa fa-trash"></i>', $url, $options);
            };
        }
    }

    public function isValidAction($action)
    {
        if (true) {
            $act = '';
            $user = new User();
            if ($user->ValidateAction($action, $user->isDefaultAction())) {
                $act = "";
            } else {
                $act = "none";
            }
            return $act;
        }
        return '';
    }
}





