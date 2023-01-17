<?php
namespace app\controllers;

use app\components\NewBaseController;
use app\models\Feed;
use app\models\Follow;
use app\models\Like;
use app\models\Notification;
use app\models\Skill;
use app\models\SocialLink;
use app\models\Users;
use app\models\search\Users as UsersSearch;
use Yii;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\UploadedFile;
use app\models\Message;
use yii\web\Response;
use app\models\EmailTemplate;
use yii\filters\AccessControl;
use yii\filters\AccessRule;

/**
 * UserController implements the CRUD actions for Users model.
 */
class UserController extends NewBaseController
{

    /**
     *
     * @inheritDoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'ruleConfig' => [
                    'class' => AccessRule::className()
                ],
                'rules' => [
                    [
                        'actions' => [
                            'ajax'
                        ],
                        'allow' => true
                    ],
                    [
                        'actions' => [
                            'update',
                            'create',
                            'delete',
                            'update-template',
                            'delete-template',
                            'shadow'
                        ],
                        'allow' => true,
                        'matchCallback' => function () {
                            return Users::isAdmin() || Users::isManager();
                        }
                    ],
                    [
                        'actions' => [
                            'update',
                            'create',
                            'delete',
                            'delete-feed',
                            'update-template',
                            'delete-template',
                            'shadow'
                        ],
                        'allow' => true,
                        'matchCallback' => function () {
                            return Users::isSelfAction();
                        }
                    ],

                    [
                        'actions' => [
                            'index',
                            'view',
                            'add-social',
                            'follow',
                            'create-feed',
                            'like-feed',
                            'add-msg',
                            'chat',
                            'chat-box',
                            'send-mail',
                            'see-template',
                            'test',
                            'unshadow'
                        ],
                        'allow' => true,
                        'roles' => [
                            '@'
                        ]
                    ]
                ]
            ],
            'verbs' => [
                'class' => \yii\filters\VerbFilter::className(),
                'actions' => [
                    'delete' => [
                        'post'
                    ]
                ]
            ]
        ];
    }

    /**
     * Lists all Users models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new UsersSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider
        ]);
    }

    /**
     * Displays a single Users model.
     *
     * @param int $id
     *            ID
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id)
        ]);
    }

    /**
     * Creates a new Users model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     *
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Users();
        $obj = rand(100, 999);
        if ($this->request->isPost) {
            if ($model->load($this->request->post())) {
                $model->created_on = date('Y-m-d H:i:s');
                $model->updated_on = date('Y-m-d H:i:s');
                $model->created_by_id = ! empty(\Yii::$app->user->id) ? \Yii::$app->user->id : Users::ROLE_ADMIN;
                $model->state_id = Users::STATE_ACTIVE;
                $model->authKey = 'test' . $obj;
                $model->accessToken = $obj . '-token';
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    if ($model->save()) {
                        if (UploadedFile::getInstance($model, 'image') != null) {
                            $model->image = UploadedFile::getInstance($model, 'image');
                            $model->image = $model->upload();
                        }
                        $title = 'New ' . $model->getRole($model->roll_id);
                        $type = Notification::TYPE_NEW;
                        $users = Users::find()->where([
                            '<=',
                            'roll_id',
                            Users::ROLE_TRAINER
                        ]);
                        foreach ($users->each() as $user) {
                            Notification::createNofication($title, $type, $model, $user->id, 'user');
                        }
                        Notification::createNofication('Welcome', Notification::TYPE_SUCCESS, $model, $model->id, 'user');
                        \Yii::$app->session->setFlash('info', 'New User Added');
                        $this->redirect([
                            'view',
                            'id' => $model->id
                        ]);
                    } else {
                        print_r($model->getErrors());
                    }
                    $transaction->commit();
                } catch (\Exception $e) {
                    $transaction->rollBack();
                    \Yii::$app->session->setFlash('error', $e->getMessage());
                }
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model
        ]);
    }

    /**
     * Updates an existing Users model.
     * If update is successful, the browser will be redirected to the 'view' page.
     *
     * @param int $id
     *            ID
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        if ($this->request->isPost && $model->load($this->request->post())) {
            if (UploadedFile::getInstance($model, 'image') != null) {
                $model->image = UploadedFile::getInstance($model, 'image');
                $model->image = $model->upload();
            }
            $model->updated_on = date('Y-m-d H:i:s');
            if ($model->save(false)) {
                $title = 'Updated : ' . $model->username;
                $type = Notification::TYPE_UPDATED;
                Notification::createNofication($title, $type, $model, $model->id, 'user');
                \Yii::$app->session->setFlash('info', 'User Updated');
                return $this->redirect([
                    'view',
                    'id' => $model->id
                ]);
            }
        }

        return $this->render('update', [
            'model' => $model
        ]);
    }

    /**
     * Deletes an existing Users model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     *
     * @param int $id
     *            ID
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();
        \Yii::$app->session->setFlash('success', 'User Deleted');

        return $this->redirect([
            'index'
        ]);
    }

    /**
     * Finds the Users model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     *
     * @param int $id
     *            ID
     * @return Users the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Users::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(\Yii::t('app', 'The requested page does not exist.'));
    }

    public function actionAddSocial($id = false)
    {
        $newmodel = new SocialLink();
        $post = $this->request->post();
        if (! empty($post)) {
            foreach ($post as $key => $value) {
                if (! empty($value)) {
                    $prev = SocialLink::find()->where([
                        'created_by_id' => $id,
                        'platform' => $key
                    ])->one();
                    if (! empty($prev)) {
                        $prev->link = $value;
                        $prev->updated_on = date('Y-m-d H:i:s');
                        $prev->updateAttributes([
                            'link',
                            'updated_on'
                        ]);
                        $title = 'Updated social link';
                        $type = Notification::TYPE_UPDATED;
                        Notification::createNofication($title, $type, $prev, $id, 'user-plus');
                        continue;
                    }
                    $model = new SocialLink();
                    $model->created_by_id = $id;
                    $model->platform = $key;
                    $model->link = $value;
                    $model->created_on = date('Y-m-d H:i:s');
                    $model->updated_on = date('Y-m-d H:i:s');
                    $transaction = \Yii::$app->db->beginTransaction();
                    try {
                        if ($model->save()) {
                            $title = 'Updated social link';
                            $type = Notification::TYPE_UPDATED;
                            Notification::createNofication($title, $type, $model, $id, 'share-alt');
                        }
                        $transaction->commit();
                    } catch (\Exception $e) {
                        $transaction->rollBack();
                        \Yii::$app->session->setFlash('error', $e->getMessage());
                        print $e;
                    }
                }
            }
            \Yii::$app->session->setFlash('success', 'Social Links added');
            return $this->redirect([
                'user/view',
                'id' => $id
            ]);
        }

        return $this->render('add_social', [
            'model' => $newmodel,
            'id' => $id
        ]);
    }

    public function actionFollow()
    {
        $model = new Follow();
        $post = $this->request->post();
        $user_model = $post['model'];
        $user = $user_model::findOne($post['id']);
        if (! empty($post)) {
            $prev = Follow::findOne([
                'model_id' => $post['id'],
                'model' => $post['model'],
                'created_by_id' => \Yii::$app->user->identity->id
            ]);
            if (! empty($prev)) {
                $prev->delete();
            } else {
                $model->created_by_id = \Yii::$app->user->identity->id;
                $model->model = $post['model'];
                $model->model_id = $post['id'];
                $model->created_on = date('Y-m-d H:i:s');
                $model->updated_on = date('Y-m-d H:i:s');
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    if ($model->save(false)) {
                        $title = 'Followed by ' . \Yii::$app->user->identity->username;
                        $type = Notification::TYPE_NEW;
                        $notification = new Notification();
                        $notification->title = $title;
                        $notification->type_id = $type;
                        $notification->model_id = $user->id;
                        $notification->to_user_id = $user->id;
                        $notification->icon = 'users';
                        $notification->state_id = Notification::STATE_UNREAD;
                        $notification->model = get_class($model);
                        $notification->created_on = date('Y-m-d H:i:s');
                        $notification->created_by_id = ! empty(\Yii::$app->user->id) ? \Yii::$app->user->id : Users::ROLE_ADMIN;
                        $notification->save(false);
                    }
                    $transaction->commit();
                } catch (\Exception $e) {
                    $transaction->rollBack();
                    print $e;
                }
            }
        }
        $count = Follow::find()->where([
            'model_id' => $post['id'],
            'model' => $post['model']
        ])->count();
        \Yii::$app->session->setFlash('Success', 'Folloed');
        return $count;
    }

    public function actionAddSkill()
    {
        $model = new Skill();
        $post = $this->request->post();
        if (! empty($post)) {
            $model->level = $post['level'];
            $model->skill = $post['skill'];
            $model->model = $post['model'];
            $model->model_id = $post['id'];
            $model->created_on = date('Y-m-d H:i:s');
            $model->updated_on = date('Y-m-d H:i:s');
            $model->save();
        }
        $result = Users::getSkillBadge($model->skill, $model->level);
        return $result;
    }

    public function beforeAction($action)
    {
        $this->enableCsrfValidation = false;
        return parent::beforeAction($action);
    }

    public function actionCreateFeed()
    {
        $model = new Feed();
        $post = $this->request->post();
        if (! empty($post)) {
            $model->load($post);
            $model->created_by_id = \Yii::$app->user->id;
            $model->created_on = date('Y-m-d H:i:s');
            $model->updated_on = date('Y-m-d H:i:s');
            if ($model->save()) {
                if (UploadedFile::getInstance($model, 'image') != null) {
                    $model->image = UploadedFile::getInstance($model, 'image');
                    $model->image = $model->upload();
                }
                \Yii::$app->session->setFlash('success', "Your message to display.");
                $title = 'New Post';
                $type = Notification::TYPE_NEW;
                $followers = Follow::find()->where([
                    'model_id' => $model->created_by_id,
                    'model' => get_class(new Users())
                ]);
                foreach ($followers->each() as $follower) {
                    Notification::createNofication($title, $type, $model, $follower->created_by_id, 'feed');
                }
                return $this->redirect([
                    'site/index'
                ]);
            }
        }
    }

    public function actionLikeFeed()
    {
        $model = new Like();
        $post = $this->request->post();
        if (! empty($post)) {
            $another = Like::findOne([
                'model' => $post['model'],
                'model_id' => $post['id'],
                'created_by_id' => \Yii::$app->user->id
            ]);
            if (! empty($another)) {
                $another->delete();
                return true;
            }
            $model->model = $post['model'];
            $model->model_id = $post['id'];
            $model->created_by_id = \Yii::$app->user->identity->id;
            $model->created_on = date('Y-m-d H:i:s');
            $model->updated_on = date('Y-m-d H:i:s');
            if ($model->save()) {
                \Yii::$app->session->setFlash('success', "Your message to display.");
                return true;
            } else {
                return \Yii::$app->session->setFlash('success', $model->getErrorMessage());
            }
        }
    }

    public function actionDeleteFeed($id)
    {
        $feed = Feed::find()->cache()
            ->where([
            'id' => $id
        ])
            ->one();
        $like = Like::find()->where([
            'model' => get_class($feed),
            'model_id' => $feed->id
        ])->all();

        $feed->delete();

        return $this->redirect([
            'site/index'
        ]);
    }

    public function actionAddMsg()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $data = 'NOK';
        $msg = new Message();
        $post = $this->request->post();
        if (! empty($post['msg'])) {
            $msg->message = $post['msg'];
            $msg->created_by_id = \Yii::$app->user->id;
            $msg->created_on = date('Y-m-d H:i:s');
            $msg->updated_on = date('Y-m-d H:i:s');
            $msg->user_id = $post['id'];
            if ($msg->save()) {
                $data = "OK";
            } else {
                Yii::$app->response->format = Response::FORMAT_JSON;
                return $msg->getErrors();
            }
        }
        return $data;
    }

    public function actionChat()
    {
        $message = new Message();
        return $this->render('_chat');
    }

    public function actionChatBox($id)
    {
        $message = Message::find()->where([
            'created_by_id' => $id
        ])
            ->orWhere([
            'user_id' => $id
        ])
            ->all();
        return $this->renderAjax('_chat_area', [
            'model' => $message,
            'id' => $id
        ]);
    }

    public function actionSendMail()
    {
        $template = str_replace("{user_name}", "Satnam", EmailTemplate::find()->cache()
            ->where([
            'id' => 3
        ])
            ->one()->html);
        Yii::$app->mailer->compose('@app/mail/layouts/html', [
            'content' => $template
        ])
            ->setFrom('sanjaykabir23@gmail.com')
            ->setTo('satnam9762@gmail.com')
            ->setSubject('Hey There')
            ->send();
    }

    public function actionSeeTemplate($id)
    {
        $template = EmailTemplate::findOne($id);
        return $template->html;
    }

    public function actionUpdateTemplate($id)
    {
        $template = EmailTemplate::findOne($id);
        return $template->html;
    }

    public function actionDeleteTemplate($id)
    {
        $template = EmailTemplate::findOne($id);
        $template->delete();
        return $this->redirect([
            'site/create-email-template'
        ]);
    }

    public function actionShadow($id)
    {
        $model = $this->findModel($id);
        $shadow_session = Yii::$app->session->set('shadow', Yii::$app->user->id);
        if (Yii::$app->user->login($model, 3600)) {
            return $this->redirect([
                'site/index'
            ]);
        }
    }

    public function actionUnshadow()
    {
        $logged_in_user = Yii::$app->session->get('shadow');
        $model = $this->findModel($logged_in_user);
        Yii::$app->session->remove('shadow');
        if (Yii::$app->user->login($model, 3600 * 24 * 30)) {
            return $this->redirect([
                'user/index'
            ]);
        }
    }
}
