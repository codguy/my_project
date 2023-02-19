<?php
namespace app\components;

use app\models\Notification;
use app\models\Users;
use app\models\image;
use Yii;
use yii\helpers\Inflector;
use yii\helpers\StringHelper;
use yii\helpers\Url;

class NewActiveRecord extends \yii\db\ActiveRecord
{

    const DIFF_EASY = 1;

    const DIFF_NORMAL = 2;

    const DIFF_HARD = 3;

    const STATE_ACTIVE = 1;

    const STATE_INACTIVE = 0;

    const STATE_FREEZE = 3;

    const STATE_DELETED = 4;

    public $image;

    public static function label($n = 1)
    {
        $className = Inflector::camel2words(StringHelper::basename(get_called_class()));
        if ($n == 2)
            return Inflector::pluralize($className);
        return $className;
    }

    public function __toString()
    {
        return $this->label(1);
    }

    public function beforeSave($insert)
    {
        if ($insert) {
            $this->created_by_id = \Yii::$app->user->identity->id ?? Users::ROLE_ADMIN;
            $this->created_on = date('Y-m-d H:i:s');
            if (isset($this->updated_on)) {
                $this->updated_on = date('Y-m-d H:i:s');
            }
        } else {
            $this->updated_on = date('Y-m-d H:i:s a');
        }
        return parent::beforeSave($insert);
    }

    public function afterSave($insert, $changedAttributes)
    {
        \Yii::$app->cache->flush();
        return parent::afterSave($insert, $changedAttributes);
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
        $notification->created_by_id = ! empty(\Yii::$app->user->id) ? \Yii::$app->user->id : Users::ROLE_ADMIN;
        $notification->save(false);
    }

    public static function findOne($condition, $duration = 10)
    {
        if (! is_array($condition)) {
            $condition = [
                'id' => $condition
            ];
        }
        return static::find()->cache($duration)
            ->where($condition)
            ->one();
    }

    public static function findLast($condition, $duration = 10)
    {
        return static::find()->cache($duration)
            ->where($condition)
            ->orderBy([
            'id' => SORT_DESC
        ])
            ->one();
    }

    public function getTime()
    {
        $start = strtotime($this->created_on);
        $end = strtotime('now');
        $time = ($end - $start) / 60;
        $result = (int) ($time) . ' mins ago';
        if ($time <= 1) {
            $time = (int) ($time / 60);
            $result = 'Just now';
        } elseif ($time >= 60 && $time <= 60 * 24) {
            $time = (int) ($time / 60);
            $result = $time . ' hrs ago';
        } elseif ($time >= 60 * 24 && $time <= 60 * 24 * 2) {
            $time = (int) ($time / 60);
            $result = $time . ' day ago';
        } elseif ($time >= 60 * 24 * 2 && $time <= 60 * 24 * 7) {
            $time = (int) ($time / (60 * 24));
            $result = $time . ' days ago';
        } elseif ($time >= 60 * 24 * 7 && $time <= 60 * 24 * 7 * 2) {
            $time = (int) ($time / (60 * 24 * 7));
            $result = $time . ' week ago';
        } elseif ($time >= 60 * 24 * 7 * 2 && $time <= 60 * 24 * 30) {
            $time = (int) ($time / (60 * 24 * 7));
            $result = $time . ' weeks ago';
        } elseif ($time >= 60 * 24 * 30 && $time <= 60 * 24 * 30 * 2) {
            $time = (int) ($time / (60 * 24 * 30));
            $result = $time . ' month ago';
        } elseif ($time >= 60 * 24 * 30 * 2 && $time <= 60 * 24 * 365) {
            $time = (int) ($time / (60 * 24 * 30));
            $result = $time . ' months ago';
        } elseif ($time >= 60 * 24 * 365 && $time <= 60 * 24 * 365 * 2) {
            $time = (int) ($time / (60 * 24 * 365));
            $result = $time . ' year ago';
        } elseif ($time >= 60 * 24 * 365 * 2) {
            $time = (int) ($time / (60 * 24 * 365));
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
        return ! empty($diff) ? $list[$diff] : $list;
    }

    public static function isAdmin($id = false)
    {
        $user = Users::find()->cache()
            ->where([
            'id' => ! empty($id) ? $id : \Yii::$app->user->identity->id
        ])
            ->one();
        return ($user->roll_id == Users::ROLE_ADMIN) ? true : false;
    }

    public static function isManager($id = false)
    {
        $user = Users::find()->cache()
            ->where([
            'id' => ! empty($id) ? $id : \Yii::$app->user->identity->id
        ])
            ->one();
        return ($user->roll_id == Users::ROLE_MANAGER) ? true : false;
    }

    public static function isTrainer($id = false)
    {
        $user = Users::find()->cache()
            ->where([
            'id' => ! empty($id) ? $id : \Yii::$app->user->identity->id
        ])
            ->one();
        return ($user->roll_id == Users::ROLE_TRAINER) ? true : false;
    }

    public static function isStudent($id = false)
    {
        $user = Users::find()->cache()
            ->where([
            'id' => ! empty($id) ? $id : \Yii::$app->user->identity->id
        ])
            ->one();
        return ($user->roll_id == Users::ROLE_STUDENT) ? true : false;
    }

    public static function isSelfAction()
    {
        return (\Yii::$app->request->get('id') == \Yii::$app->user->id) ? true : false;
    }

    public static function isUsers($id = false)
    {
        return ($id == \Yii::$app->user->identity->getId()) ? true : false;
    }

    public static function isSelfMade($id = false)
    {
        return ($this->created_by_id == \Yii::$app->user->identity->getId()) ? true : false;
    }

    public function createPath($path)
    {
        if (is_dir($path))
            return true;
        $prev_path = substr($path, 0, strrpos($path, '/', - 2) + 1);
        $return = $this->createPath($prev_path);
        return ($return && is_writable($prev_path)) ? mkdir($path, 0777, true) : false;
    }

    public function hasImage()
    {
        $image = image::findLast([
            'model' => get_class($this),
            'model_id' => $this->id
        ], 5);
        return ! empty($image) ? $image : false;
    }

    public function getImageUrl()
    {
        $image = $this->hasImage();
        if (! empty($image)) {
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
            if (! empty($this->image)) {
                $name = $this->id . '-' . time() . '.' . $this->image->extension ?? $this->image->name;
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

    public function getUrl()
    {
        return Url::toRoute([
            'view',
            'id' => $this->id
        ]);
    }

    function ip_info($ip = NULL, $purpose = "location", $deep_detect = TRUE)
    {
        $output = NULL;
        $purpose = str_replace(array(
            "name",
            "\n",
            "\t",
            " ",
            "-",
            "_"
        ), NULL, strtolower(trim($purpose)));
        $support = array(
            "country",
            "countrycode",
            "state",
            "region",
            "city",
            "location",
            "address"
        );
        $continents = array(
            "AF" => "Africa",
            "AN" => "Antarctica",
            "AS" => "Asia",
            "EU" => "Europe",
            "OC" => "Australia (Oceania)",
            "NA" => "North America",
            "SA" => "South America"
        );
        if (filter_var($ip, FILTER_VALIDATE_IP) && in_array($purpose, $support)) {
            $ipdat = @json_decode(file_get_contents("http://www.geoplugin.net/json.gp"));
            if (@strlen(trim($ipdat->geoplugin_countryCode)) == 2) {
                switch ($purpose) {
                    case "location":
                        $output = array(
                            "city" => @$ipdat->geoplugin_city,
                            "state" => @$ipdat->geoplugin_regionName,
                            "country" => @$ipdat->geoplugin_countryName,
                            "country_code" => @$ipdat->geoplugin_countryCode,
                            "continent" => @$continents[strtoupper($ipdat->geoplugin_continentCode)],
                            "continent_code" => @$ipdat->geoplugin_continentCode
                        );
                        break;
                    case "address":
                        $address = array(
                            $ipdat->geoplugin_countryName
                        );
                        if (@strlen($ipdat->geoplugin_regionName) >= 1)
                            $address[] = $ipdat->geoplugin_regionName;
                        if (@strlen($ipdat->geoplugin_city) >= 1)
                            $address[] = $ipdat->geoplugin_city;
                        $output = implode(", ", array_reverse($address));
                        break;
                    case "city":
                        $output = @$ipdat->geoplugin_city;
                        break;
                    case "state":
                        $output = @$ipdat->geoplugin_regionName;
                        break;
                    case "region":
                        $output = @$ipdat->geoplugin_regionName;
                        break;
                    case "country":
                        $output = @$ipdat->geoplugin_countryName;
                        break;
                    case "countrycode":
                        $output = @$ipdat->geoplugin_countryCode;
                        break;
                }
            }
        }
        return $output;
    }

    protected function getControllerID()
    {
        if (empty($this->_controllerId)) {
            $admin = '';
            if (! (\Yii::$app instanceof yii\console\Application)) {
                $adminPath = Yii::$app->controller->module->basePath . DIRECTORY_SEPARATOR . 'controllers/admin';
                if (is_dir($adminPath)) {
                    $admin = 'admin/';
                }
            }
            $modelClass = get_class($this);
            $pos = strrpos($modelClass, '\\');
            $class = substr($modelClass, $pos + 1);
            if($class == 'Users'){
                $class = 'User';
            }
        }
        return $admin . Inflector::camel2id($class);
    }

    public function getModelUrl($action = 'view', $id = null, $absolute = false)
    {
        $params = [
            $this->getControllerID() . '/' . $action
        ];
        if ($id != null) {
            if (is_array($id))
                $params = array_merge($params, $id);
            else
                $params['id'] = $id;
        } elseif ($this->hasAttribute('id')) {
            $params['id'] = $this->id;
        }

        $params = array_filter($params);
        if ($absolute || \Yii::$app instanceof yii\console\Application) {
            return \Yii::$app->getUrlManager()->createAbsoluteUrl($params);
        }
        return \Yii::$app->getUrlManager()->createUrl($params);
    }

    public function getRelatedData($data)
    {
        $model = $this->$data;
        if (! empty($data)) {
            $url = $model->getModelUrl();
            $html = "<a href=".$url.">".$model->username."</a>";
            return $html;
        }
    }
}
?>
