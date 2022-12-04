<?php

namespace app\components;

use app\models\image;
use app\models\Notification;
use app\models\User;
use app\models\Users;
use Yii;
use yii\web\IdentityInterface;

class NewActiveRecord extends \yii\db\ActiveRecord
{
    const DIFF_EASY = 1;

    const DIFF_NORMAL = 2;

    const DIFF_HARD = 3;

    const STATE_ACTIVE = 1;

    const STATE_INACTIVE = 2;

    const STATE_FREEZE = 3;

    const STATE_DELETED = 4;

    public $image;

    public function beforeSave($insert)
    {
        if(!Yii::$app->user->isGuest){
            if ($insert) {
                $this->created_by_id = \Yii::$app->user->identity->id ?? Users::ROLE_ADMIN;
                $this->created_on = date('Y-m-d H:i:s');
                $this->updated_on = date('Y-m-d H:i:s');
            } else {
                $this->updated_on = date('Y-m-d H:i:s a');
            }
            return parent::beforeSave($insert);
        }
    }

    public static function createNofication($title, $type, $model, $to_user, $icon)
    {
        $notification = new Notification();
        $notification->title = $title;
        $notification->type_id = $type;
        $notification->model_id = $model->id;
        $notification->to_user_id = $to_user;
        $notification->icon = $icon;
        $notification->state_id = Notification::STATE_UNREAD;
        $notification->model = get_class($model);
        $notification->created_on = date('Y-m-d H:i:s');
        $notification->created_by_id = !empty(\Yii::$app->user->id) ? \Yii::$app->user->id : Users::ROLE_ADMIN;
        $notification->save(false);
    }

    public static function findOne($condition, $duration = 10)
    {
        if(!is_array($condition)){
            $condition = [
                'id' => $condition
            ];
        }
        return static::find()->cache($duration)->where($condition)->one();
    }

    public static function findLast($condition, $duration = 10)
    {
        return static::find()->cache($duration)->where($condition)->orderBy(['id' => SORT_DESC])->one();
    }

    public function getTime()
    {
        $start = strtotime($this->created_on);
        $end = strtotime('now');
        $time = ($end - $start) / 60;
        $result = (int)($time) . ' mins ago';
        if ($time <= 1) {
            $time = (int)($time / 60);
            $result = 'Just now';
        } elseif ($time >= 60 && $time <= 60 * 24) {
            $time = (int)($time / 60);
            $result = $time . ' hrs ago';
        } elseif ($time >= 60 * 24 && $time <= 60 * 24 * 2) {
            $time = (int)($time / 60);
            $result = $time . ' day ago';
        } elseif ($time >= 60 * 24 * 2 && $time <= 60 * 24 * 7) {
            $time = (int)($time / (60 * 24));
            $result = $time . ' days ago';
        } elseif ($time >= 60 * 24 * 7 && $time <= 60 * 24 * 7 * 2) {
            $time = (int)($time / (60 * 24 * 7));
            $result = $time . ' week ago';
        } elseif ($time >= 60 * 24 * 7 * 2 && $time <= 60 * 24 * 30) {
            $time = (int)($time / (60 * 24 * 7));
            $result = $time . ' weeks ago';
        } elseif ($time >= 60 * 24 * 30 && $time <= 60 * 24 * 30 * 2) {
            $time = (int)($time / (60 * 24 * 30));
            $result = $time . ' month ago';
        } elseif ($time >= 60 * 24 * 30 * 2 && $time <= 60 * 24 * 365) {
            $time = (int)($time / (60 * 24 * 30));
            $result = $time . ' months ago';
        } elseif ($time >= 60 * 24 * 365 && $time <= 60 * 24 * 365 * 2) {
            $time = (int)($time / (60 * 24 * 365));
            $result = $time . ' year ago';
        } elseif ($time >= 60 * 24 * 365 * 2) {
            $time = (int)($time / (60 * 24 * 365));
            $result = $time . ' years ago';
        }
        return $result;
    }

    public function getDificulty($diff)
    {
        $list = [
            self::DIFF_EASY => '<span class="badge badge-success">Easy</span>',
            self::DIFF_NORMAL => '<span class="badge badge-primary">Normal</span>',
            self::DIFF_HARD => '<span class="badge badge-danger">Hard</span>'
        ];
        return !empty($diff) ? $list[$diff] : $list;
    }

    public static function isAdmin($id = false)
    {
        $user = Users::find()->cache()->where([
            'id' => !empty($id) ? $id : \Yii::$app->user->identity->id
        ])->one();
        return ($user->roll_id == Users::ROLE_ADMIN) ? true : false;
    }

    public static function isManager($id = false)
    {
        $user = Users::find()->cache()->where([
            'id' => !empty($id) ? $id : \Yii::$app->user->identity->id
        ])->one();
        return ($user->roll_id == Users::ROLE_MANAGER) ? true : false;
    }

    public static function isTrainer($id = false)
    {
        $user = Users::find()->cache()->where([
            'id' => !empty($id) ? $id : \Yii::$app->user->identity->id
        ])->one();
        return ($user->roll_id == Users::ROLE_TRAINER) ? true : false;
    }

    public static function isStudent($id = false)
    {
        $user = Users::find()->cache()->where([
            'id' => !empty($id) ? $id : \Yii::$app->user->identity->id
        ])->one();
        return ($user->roll_id == Users::ROLE_STUDENT) ? true : false;
    }

    public static function isUsers($id = false)
    {
        return ($id == \Yii::$app->user->identity->getId()) ? true : false;
    }

    public function createPath($path)
    {
        if (is_dir($path))
            return true;
        $prev_path = substr($path, 0, strrpos($path, '/', -2) + 1);
        $return = $this->createPath($prev_path);
        return ($return && is_writable($prev_path)) ? mkdir($path, 0777, true) : false;
    }

    public function hasImage()
    {
        $image = image::findLast([
            'model' => get_class($this),
            'model_id' => $this->id
        ], 5);
        return !empty($image) ? $image : false;
    }

    public function getImageUrl()
    {
        $image = $this->hasImage();
        if (!empty($image)) {
            return Yii::$app->request->baseUrl . '/../uploads/' . $image->folder . '/' . $image->name;
        } else {
            return Yii::$app->request->baseUrl . '/images/user-icon.png';
        }
    }

    public function getImage($size = 50)
    {
        return '<img src=' . $this->getImageUrl() . ' height="' . $size . '" width="' . $size . '" class="img-fluid rounded">';
    }

    public function upload()
    {
        if ($this->validate(false)) {
            $class = get_class($this);
            $arr = explode('\\', $class);
            $path = UPLOAD_PATH . end($arr) . '/';
            $this->createPath($path);
            if (!empty($this->image)) {
                $name = $this->id . '-' . time() . '.' . $this->image->extension;
                $full_name = $path . $name;
                $image = new image();
                $image->name = $name;
                $image->folder = end($arr);
                $image->model = $class;
                $image->model_id = $this->id;
                if ($image->save()) {
                    $this->image->saveAs($full_name);
                    return $name;
                }
            }
        } else {
            return false;
        }
    }

    public function getErrorMessage()
    {
        Yii::$app->response->format = 'json';
        return $this->getErrors();
    }
}