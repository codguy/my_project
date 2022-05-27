<?php

use yii\db\Migration;

/**
 * Class m220527_214327_create_tbl_message
 */
class m220527_214327_create_tbl_message extends Migration
{
    
    public function up()
    {
        $this->createTable('tbl_message', [
            'id' => $this->primaryKey(),
            'message' => $this->text()->notNull(),
            'user_id' => $this->integer()->notNull(),
            'created_by' => $this->integer()->notNull(),
            'created_on' => $this->dateTime(),
            'updated_on' => $this->dateTime(),
        ]);
        
    }
    
    public function down()
    {
        $this->dropTable('tbl_message');
    }
    
}
