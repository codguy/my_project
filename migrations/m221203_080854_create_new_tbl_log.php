<?php

use yii\db\Migration;

/**
 * Class m221203_080854_create_new_tbl_log
 */
class m221203_080854_create_new_tbl_log extends Migration
{
    public function up()
    {
        if(Yii::$app->db->schema->getTableSchema('tbl_log')){
            $this->dropTable('tbl_log');   
        }
        $this->createTable('tbl_log', [
            'id' => $this->primaryKey(),
            'ip' => $this->text()->notNull(),
            'controller' => $this->text(),
            'action' => $this->text(),
            'message' => $this->text()->notNull(),
            'created_by_id' => $this->integer(),
            'created_on' => $this->dateTime(),
        ]);

        $this->createIndex(
            'idx-log-created_by_id',
            'tbl_log',
            'created_by_id'
        );

        $this->createIndex(
            'idx-log-message',
            'tbl_log',
            'message'
        );

        $this->addForeignKey(
            'fk-log-created_by_id',
            'tbl_log',
            'created_by_id',
            'tbl_user',
            'id',
            'CASCADE'
        );

    }
    
    public function down()
    {
        $this->dropForeignKey(
            'fk-about-created_by_id',
            'tbl_log'
        );

        $this->dropIndex(
            'idx-log-created_by_id',
            'tbl_log'
        );

        $this->dropIndex(
            'idx-log-message',
            'tbl_log'
        );

        $this->dropTable('tbl_log');
    }
}
