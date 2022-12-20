<?php
use app\models\Users;
use yii\helpers\Html;
use yii\helpers\Url;
?>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
        <?php $model = Yii::$app->user->identity; ?>
        <a href="<?=Url::toRoute(['user/view','id' => $model->id]);?>">
			<div class="user-panel mt-3 pb-3 mb-3 d-flex">
				<div class="image">
					<img src="<?= $model->getImageUrl(); ?>"
						class="elevation-2 profile_pic" alt="User Image" height="40px"
						width="40px"
						style="height: 40px !important; width: 40px !important; border: 1px solid white;">
				</div>
				<div class="info">
                    <?php echo $model->username; ?>
                </div>
			</div>
		</a>

		<!-- SidebarSearch Form -->
		<!-- href be escaped -->
		<div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div> 	

		<!-- Sidebar Menu -->
		<nav class="mt-2">
            <?php
            echo \hail812\adminlte\widgets\Menu::widget([
                'items' => [
                    [
                        'label' => 'Login',
                        'url' => [
                            'site/login'
                        ],
                        'icon' => 'sign-in-alt',
                        'visible' => Yii::$app->user->isGuest
                    ],
                    [
                        'label' => 'Home',
                        'url' => [
                            'site/index'
                        ],
                        'icon' => 'fa fa-home'
                    ],
                    [
                        'label' => 'Add users',
                        'url' => [
                            'user/create'
                        ],
                        'iconStyle' => 'fas fa-user',
                        'visible' => Users::isAdmin() || Users::isManager()
                    ],

                    [
                        'label' => 'All users',
                        'url' => [
                            'user/index'
                        ],
                        'iconStyle' => 'fas fa-users'
                    ],
                    [
                        'label' => 'Create course',
                        'url' => [
                            'course/create'
                        ],
                        'iconStyle' => 'fas fa-plus',
                        'visible' => Users::isTrainer()
                    ],
                    [
                        'label' => 'Courses',
                        'url' => [
                            'course/index'
                        ],
                        'iconStyle' => 'fas fa-desktop'
                    ],
                    [
                        'label' => 'Chat',
                        'url' => [
                            'user/chat'
                        ],
                        'iconStyle' => 'fas fa-comments'
                    ],
                    [
                        'label' => 'Template',
                        'url' => [
                            'site/create-email-template'
                        ],
                        'iconStyle' => 'fas fa-paint-brush'
                    ],
                    [
                        'label' => 'Logs',
                        'url' => [
                            'log/index'
                        ],
                        'iconStyle' => 'fa fa-file-text',
                        'visible' => (Yii::$app->user->identity->roll_id <= Users::ROLE_MANAGER) ? true : false
                    ],
                    [
                        'label' => 'Backup',
                        'url' => [
                            'backup/index'
                        ],
                        'iconStyle' => 'fa fa-database',
                        'visible' => (Yii::$app->user->identity->roll_id <= Users::ROLE_MANAGER) ? true : false
                    ]
                ]
            ]);
            ?>
        </nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>