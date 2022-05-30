<?php

use yii\db\Migration;

/**
 * Class m220530_165007_create_tbl_email_template
 */
class m220530_165007_create_tbl_email_template extends Migration
{
    public function up()
    {
        $this->createTable('tbl_email_tempalte', [
            'id' => $this->primaryKey(),
            'type_id' => $this->integer()->notNull(),
            'html' => $this->text()->notNull(),
            'json' => $this->text()->notNull(),
            'created_by' => $this->integer()->notNull(),
            'created_on' => $this->dateTime(),
            'updated_on' => $this->dateTime(),
        ]);
        
    }
    
    public function down()
    {
        $this->dropTable('tbl_email_tempalte');
    }
}
