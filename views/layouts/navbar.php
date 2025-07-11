<?php
use app\models\Message;
use app\models\Notification;
use app\models\Users;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;

?>
<style>
.ui-autocomplete {
	top: 47px;
	left: 226.517px;
	width: 224px;
	z-index: 99999;
	opacity: .9;
	color: white;
background-color: #495057;
border: 0px;
}
</style>
<!-- Navbar -->
<nav class="bg-gray-800 text-gray-200 shadow-lg" x-data="{ openMobileMenu: false }"> {/* Added x-data for Alpine.js example */}
    <div class="container mx-auto px-4">
        <div class="flex items-center justify-between h-16">
            <!-- Left Section (Pushmenu, Brand/Logo if any) -->
            <div class="flex items-center">
                <button class="p-2 rounded-md text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white" data-widget="pushmenu" aria-label="Toggle sidebar">
                    <i class="fas fa-bars"></i>
                </button>
                <a href="<?= \yii\helpers\Url::home() ?>" class="ml-3 text-xl font-bold hidden sm:block hover:text-white">Academy</a> {/* Example Brand */}
            </div>

            <!-- Center Section (Search - visible on desktop) -->
            <div class="hidden md:flex flex-grow items-center justify-center px-4">
                 <form action="<?= Url::to(['/user/index']) ?>" method="get" class="relative w-full max-w-xs lg:max-w-sm">
                    <?php
                    $searchModel = new \app\models\User();
                    $form = ActiveForm::begin([
                        'action' => Url::to(['/user/index']),
                        'method' => 'get',
                        'options' => ['class' => 'flex w-full']
                    ]);
                    echo $form->field($searchModel, 'username', [
                        'options' => ['tag' => false],
                        'template' => '{input}',
                    ])->widget(\yii\jui\AutoComplete::classname(), [
                        'clientOptions' => [
                            'source' => \app\models\User::find()->select('username')->distinct()->limit(10)->column(),
                        ],
                        'options' => [
                            'placeholder' => 'Search users...',
                            // Adjusted width to be responsive within its container, removed fixed widths like w-48
                            'class' => 'bg-gray-700 text-white placeholder-gray-400 px-3 py-1.5 rounded-md focus:outline-none focus:ring-1 focus:ring-white focus:bg-gray-600 text-sm w-full transition-all duration-300 ease-in-out',
                        ]
                    ])->label(false);
                    ActiveForm::end();
                    ?>
                </form>
            </div>

            <!-- Right Section (Notifications, Messages, User menu - always visible icons & Mobile Menu Toggle) -->
            <div class="flex items-center space-x-1 sm:space-x-3"> {/* Reduced space-x for smaller screens if needed */}
                {/* Messages Dropdown Button */}
        <?php
        if (true) { // Assuming this condition is for showing messages dropdown
            $userForMsg = Yii::$app->user->id; // Simplified for placeholder
            $msgsCount = \app\models\Message::find()->where(['user_id' => $userForMsg])->groupBy(['created_by_id'])->count();
        ?>
        <div class="relative">
            <button type="button" class="p-2 rounded-full text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white" data-toggle="dropdown" aria-label="View messages">
                <i class="far fa-comments"></i>
                <?php if ($msgsCount > 0): ?>
                <span class="absolute top-0 right-0 block h-2 w-2 rounded-full ring-2 ring-white bg-red-500 md:block transform translate-x-1 -translate-y-0.5"></span>
                <span class="sr-only">New messages</span>
                <?php endif; ?>
            </button>
            <!-- Messages Dropdown Panel -->
            <div class="origin-top-right absolute right-0 mt-2 w-80 md:w-96 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none z-50 hidden" id="messages-panel" role="menu" aria-orientation="vertical" aria-labelledby="messages-menu-button">
                <div class="px-4 py-3">
                    <p class="text-sm text-gray-500">
                        You have <span class="font-medium text-gray-700"><?= (int)$msgsCount ?></span> messages {/* Use $msgsCount from button part */}
                    </p>
                </div>
                <div class="border-t border-gray-200"></div>
                <div class="py-1 max-h-80 overflow-y-auto"> {/* Scrollable area */}
                    <?php
                    // Re-fetch or ensure $msgs is available here, original $msgs was defined inside the if(true) block
                    // For safety, re-declaring the query or ensuring $msgs is passed if this were a partial view
                    $messageList = \app\models\Message::find()->where(['user_id' => Yii::$app->user->id])
                        ->groupBy(['created_by_id'])
                        ->orderBy(['id' => SORT_ASC])
                        ->all(); // Use all() to get an array for count and loop

                    if (count($messageList) > 0) {
                        foreach ($messageList as $msg) {
                            $messenger = \app\models\User::find()->cache()
                                ->where(['id' => $msg->created_by_id])
                                ->one();

                            if (!empty($messenger)) {
                    ?>
                    <a href="#" class="block px-4 py-3 hover:bg-gray-100" data-widget="chat-pane-toggle" role="menuitem">
                        <div class="flex items-start">
                            <img src="<?= $messenger->getImageUrl() ?>" alt="<?= Html::encode($messenger->username) ?>'s avatar" class="h-10 w-10 rounded-full mr-3 object-cover">
                            <div class="flex-1 min-w-0">
                                <h3 class="text-sm font-semibold text-gray-800 truncate"><?= Html::encode($messenger->username) ?></h3>
                                <p class="text-xs text-gray-600 truncate"><?= Html::encode($msg->message) ?></p>
                                <p class="text-xs text-gray-400 mt-0.5 flex items-center">
                                    <i class="far fa-clock mr-1.5"></i>
                                    <?= Html::encode($msg->getTime()) ?>
                                </p>
                            </div>
                        </div>
                    </a>
                    <div class="border-t border-gray-100 last:border-b-0"></div> {/* Divider */}
                    <?php
                            } // end if !empty($messenger)
                        } // end foreach
                    } else { // if count == 0
                    ?>
                        <p class="px-4 py-3 text-sm text-gray-500 text-center">No new messages.</p>
                    <?php
                    } // end if count
                    ?>
                </div>
                <div class="border-t border-gray-200"></div>
                <a href="<?= Url::toRoute(['user/chat']) ?>" class="block py-2 px-4 text-sm font-medium text-center text-gray-700 bg-gray-50 hover:bg-gray-100 rounded-b-md">
                    See All Messages
                </a>
            </div>
        </div>
        <?php } ?>

                {/* Notifications Dropdown Button */}
        <?php
        if (!Yii::$app->user->isGuest) {
            $notificationsCount = \app\models\Notification::find()->cache(10)
                ->where(['!=', 'state_id', \app\models\Notification::STATE_DELETED])
                ->andWhere(['to_user_id' => Yii::$app->user->identity->id])
                ->count();
        ?>
        <div class="relative">
            <button type="button" class="p-2 rounded-full text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white" data-toggle="dropdown" aria-label="View notifications">
                <i class="far fa-bell"></i>
                <?php if ($notificationsCount > 0): ?>
                <span class="absolute top-0 right-0 block h-2 w-2 rounded-full ring-2 ring-white bg-yellow-400 md:block transform translate-x-1 -translate-y-0.5"></span>
                <span class="sr-only">New notifications</span>
                <?php endif; ?>
            </button>
            <!-- Notifications Dropdown Panel -->
            <div class="origin-top-right absolute right-0 mt-2 w-80 md:w-96 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none z-50 hidden" id="notifications-panel" role="menu" aria-orientation="vertical" aria-labelledby="notifications-menu-button">
                <div class="px-4 py-3 flex justify-between items-center">
                    <p class="text-sm text-gray-500">
                        You have <span class="font-medium text-gray-700"><?= (int)$notificationsCount ?></span> notifications {/* Use $notificationsCount from button part */}
                    </p>
                    {/* Optional: <a href="#" class="text-xs text-indigo-600 hover:text-indigo-500">View all</a> */}
                </div>
                <div class="border-t border-gray-200"></div>
                <div class="py-1 max-h-80 overflow-y-auto"> {/* Scrollable area */}
                    <?php
                    $notificationList = \app\models\Notification::find()->cache(10)
                        ->where(['!=', 'state_id', \app\models\Notification::STATE_DELETED])
                        ->andWhere(['to_user_id' => Yii::$app->user->identity->id])
                        ->orderBy(['id' => SORT_DESC])
                        ->all();

                    if (count($notificationList) > 0) {
                        foreach ($notificationList as $notification) {
                            $iconColorClass = 'text-gray-400'; // Default
                            $colorName = $notification->getColor($notification->type_id);
                            if ($colorName === 'primary') $iconColorClass = 'text-blue-500';
                            else if ($colorName === 'success') $iconColorClass = 'text-green-500';
                            else if ($colorName === 'warning') $iconColorClass = 'text-yellow-500';
                            else if ($colorName === 'danger') $iconColorClass = 'text-red-500';
                            else if ($colorName === 'info') $iconColorClass = 'text-sky-500';
                    ?>
                    <a href="<?= Html::encode(is_string($notification->url) ? $notification->url : '#') ?>" class="block px-4 py-3 hover:bg-gray-100" role="menuitem">
                        <div class="flex items-center">
                            <div class="flex-shrink-0 mr-3">
                                <i class="fa fa-<?= Html::encode($notification->icon ?: 'bell') ?> <?= $iconColorClass ?>" style="width: 1.25rem; height: 1.25rem; line-height: 1.25rem;"></i> {/* Added line-height for better vertical centering of fa icons */}
                            </div>
                            <div class="flex-1 min-w-0">
                                <p class="text-sm text-gray-700 truncate"><?= Html::encode($notification->title) ?></p>
                                <p class="text-xs text-gray-400 mt-0.5 flex items-center">
                                    <i class="far fa-clock mr-1.5"></i>
                                    <?= Html::encode($notification->getTime()) ?>
                                </p>
                            </div>
                        </div>
                    </a>
                    <div class="border-t border-gray-100 last:border-b-0"></div> {/* Divider */}
                    <?php
                        } // end foreach
                    } else { // if count == 0
                    ?>
                        <p class="px-4 py-3 text-sm text-gray-500 text-center">No new notifications.</p>
                    <?php
                    } // end if count
                    ?>
                </div>
                <?php if (count($notificationList) > 0): ?>
                <div class="border-t border-gray-200"></div>
                <?= Html::a('Clear All Notifications', ['notification/clear'], [
                    'class' => 'block py-2 px-4 text-sm font-medium text-center text-gray-700 bg-gray-50 hover:bg-gray-100 rounded-b-md',
                    'data-method' => 'post',
                ]) ?>
                <?php endif; ?>
            </div>
        </div>
        <?php } ?>

                {/* User/Logout Dropdown */}
                <div class="relative">
                    <div>
                        <button type="button" class="max-w-xs bg-gray-800 rounded-full flex items-center text-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white" id="user-menu-button" aria-expanded="false" aria-haspopup="true" data-toggle="dropdown">
                            <span class="sr-only">Open user menu</span>
                            <i class="far fa-user p-2 rounded-full text-gray-200 hover:text-white"></i>
                        </button>
                    </div>
                    <div class="origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5 focus:outline-none z-50 hidden" role="menu" aria-orientation="vertical" aria-labelledby="user-menu-button" id="user-menu-panel">
                        <?= Html::a('Logout <i class="fas fa-sign-out-alt ml-1"></i>', ['/site/logout'], [
                            'data-method' => 'post',
                            'class' => 'block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-gray-900 w-full text-left',
                            'role' => 'menuitem'
                        ]) ?>
                    </div>
                </div>

                {/* Mobile Menu Toggle for Nav Links */}
                <div class="md:hidden">
                    <button @click="openMobileMenu = !openMobileMenu" type="button" class="p-2 rounded-md text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white" aria-controls="mobile-menu-panel" aria-expanded="false">
                        <span class="sr-only">Open main menu</span>
                        <i class="fas fa-ellipsis-v" x-show="!openMobileMenu"></i>
                        <i class="fas fa-times" x-show="openMobileMenu"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>

    {/* Collapsible Mobile Menu Panel */}
    <div class="md:hidden" id="mobile-menu-panel" x-show="openMobileMenu" @click.away="openMobileMenu = false" x-transition>
        <div class="px-2 pt-2 pb-3 space-y-1 sm:px-3">
            <a href="<?=\yii\helpers\Url::home()?>" class="block px-3 py-2 rounded-md text-base font-medium text-white hover:bg-gray-700">Home</a>
            <?php if(true){ // This condition was pre-existing ?>
            <a href="<?=Url::toRoute(['site/contact'])?>" class="block px-3 py-2 rounded-md text-base font-medium text-white hover:bg-gray-700">Contact</a>
            <?php } ?>

            {/* Search Form for Mobile */}
            <div class="px-1 pt-3 pb-2">
                <form action="<?= Url::to(['/user/index']) ?>" method="get" class="relative">
                     <?php
                    $searchModelMobile = new \app\models\User(); // Use a different var name if needed
                    $formMobile = ActiveForm::begin([
                        'action' => Url::to(['/user/index']),
                        'method' => 'get',
                        'options' => ['class' => 'flex w-full']
                    ]);
                    echo $formMobile->field($searchModelMobile, 'username', [
                        'options' => ['tag' => false],
                        'template' => '{input}',
                    ])->widget(\yii\jui\AutoComplete::classname(), [
                        'clientOptions' => [
                            'source' => \app\models\User::find()->select('username')->distinct()->limit(10)->column(),
                        ],
                        'options' => [
                            'placeholder' => 'Search users (mobile)...',
                            'class' => 'bg-gray-700 text-white placeholder-gray-400 px-3 py-1.5 rounded-md focus:outline-none focus:ring-1 focus:ring-white focus:bg-gray-600 text-sm w-full',
                        ]
                    ])->label(false);
                    ActiveForm::end();
                    ?>
                </form>
            </div>
        </div>
    </div>
</nav>
<!-- /.navbar -->
        {/* <div class="w-px h-6 bg-gray-700 mx-2 hidden sm:block"></div>  Optional: explicit spacer */}

        <!-- User/Logout Dropdown -->
        <div class="relative"> {/* Removed ml-3 as parent `space-x-3` handles spacing */}
            <div>
                <button type="button" class="max-w-xs bg-gray-800 rounded-full flex items-center text-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white" id="user-menu-button" aria-expanded="false" aria-haspopup="true" data-toggle="dropdown">
                    <span class="sr-only">Open user menu</span>
                    {/* Using text-gray-200 from nav, hover:text-white for consistency */}
                    <i class="far fa-user p-2 rounded-full text-gray-200 hover:text-white"></i>
                    {/* Example if user avatar available:
                    // $user = Yii::$app->user->identity;
                    // $avatarUrl = $user ? $user->getImageUrl() : Url::to('@web/images/user-icon.png');
                    // <img class="h-8 w-8 rounded-full" src="<?= $avatarUrl ?>" alt="User avatar">
                    */}
                </button>
            </div>

            <div class="origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5 focus:outline-none z-50 hidden" role="menu" aria-orientation="vertical" aria-labelledby="user-menu-button" id="user-menu-panel">
                <?= Html::a('Logout <i class="fas fa-sign-out-alt ml-1"></i>', ['/site/logout'], [
                    'data-method' => 'post',
                    'class' => 'block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-gray-900 w-full text-left',
                    'role' => 'menuitem'
                ]) ?>
            </div>
        </div>
    </div>
</nav>
<!-- /.navbar -->