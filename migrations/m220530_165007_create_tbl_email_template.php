<?php

use yii\db\Migration;

/**
 * Class m220530_165007_create_tbl_email_template
 */
class m220530_165007_create_tbl_email_template extends Migration
{
    public function up()
    {
        if(Yii::$app->db->schema->getTableSchema('tbl_email_tempalte')){
            $this->dropTable('tbl_email_tempalte');   
        }
        $this->createTable('tbl_email_tempalte', [
            'id' => $this->primaryKey(),
            'title' => $this->integer()->notNull(),
            'html' => $this->text()->notNull(),
            'json' => $this->text()->notNull(),
            'created_by_id' => $this->integer()->notNull(),
            'created_on' => $this->dateTime(),
            'updated_on' => $this->dateTime(),
        ]);

        $this->createIndex(
            'idx-tempalte-created_by_id',
            'tbl_email_tempalte',
            'created_by_id'
        );

        $this->addForeignKey(
            'fk-tempalte-created_by_id',
            'tbl_email_tempalte',
            'created_by_id',
            'tbl_user',
            'id',
            'CASCADE'
        );
    }
    
    public function down()
    {
        $this->dropTable('tbl_email_tempalte');
    }
}
