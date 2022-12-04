<?php

use yii\db\Migration;

/**
 * Class m220527_214327_create_tbl_message
 */
class m220527_214327_create_tbl_message extends Migration
{

    public function up()
    {
        if(Yii::$app->db->schema->getTableSchema('tbl_message')){
            $this->dropTable('tbl_message');   
        }
        $this->createTable('tbl_message', [
            'id' => $this->primaryKey(),
            'message' => $this->text()->notNull(),
            'user_id' => $this->integer()->notNull(),
            'created_on' => $this->dateTime(),
            'created_by_id' => $this->integer()->notNull(),
            'updated_on' => $this->dateTime(),
        ]);

        $this->createIndex(
            'idx-message-created_by_id',
            'tbl_message',
            'created_by_id'
        );

        $this->addForeignKey(
            'fk-message-created_by_id',
            'tbl_message',
            'created_by_id',
            'tbl_user',
            'id',
            'CASCADE'
        );

        $this->createIndex(
            'idx-message-user_id',
            'tbl_message',
            'user_id'
        );

        $this->addForeignKey(
            'fk-message-user_id',
            'tbl_message',
            'user_id',
            'tbl_user',
            'id',
            'CASCADE'
        );
    }

    public function down()
    {
        $this->dropTable('tbl_message');
    }
}
