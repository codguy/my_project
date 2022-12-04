<?php

use yii\db\Migration;

/**
 * Class m220403_083451_create_tbl_notification
 */
class m220403_083451_create_tbl_notification extends Migration
{
    /* {@inheritdoc}
    */
    public function up()
    {
        if(Yii::$app->db->schema->getTableSchema('tbl_notification')){
            $this->dropTable('tbl_notification');   
        }
        $this->createTable('tbl_notification', [
            'id' => $this->primaryKey(),
            'title' => $this->string(25)->notNull(),
            'type_id' => $this->tinyInteger()->notNull(),
            'state_id' => $this->tinyInteger()->notNull(),
            'to_user_id' => $this->integer()->notNull(),
            'model' => $this->string(25)->defaultValue(Null),
            'model_id' => $this->integer(10)->notNull(),
            'icon' => $this->string(50)->defaultValue(null),
            'created_on' => $this->dateTime(),
            'created_by_id' => $this->integer()->defaultValue(1),
        ]);

        $this->createIndex(
            'idx-notification-created_by_id',
            'tbl_notification',
            'created_by_id'
        );

        $this->addForeignKey(
            'fk-notification-created_by_id',
            'tbl_notification',
            'created_by_id',
            'tbl_user',
            'id',
            'CASCADE'
        );

        $this->createIndex(
            'idx-notification-to_user_id',
            'tbl_notification',
            'to_user_id'
        );

        $this->addForeignKey(
            'fk-notification-to_user_id',
            'tbl_notification',
            'to_user_id',
            'tbl_user',
            'id',
            'CASCADE'
        );
    }
    
    /**
     * {@inheritdoc}
     */
    public function down()
    {
        $this->dropTable('tbl_notification');
    }
}
