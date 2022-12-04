<?php

use yii\widgets\ListView;

echo ListView::widget([
    'dataProvider' => $dataProvider,
    'layout' => '{items}',
    'itemView' => '_feed'
  ]);
  ?>