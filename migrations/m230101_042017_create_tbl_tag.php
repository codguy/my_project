<?php

use yii\db\Migration;

/**
 * Class m230101_042017_create_tbl_tag
 */
class m230101_042017_create_tbl_tag extends Migration
{
    public function up()
    {
        if(Yii::$app->db->schema->getTableSchema('tbl_tag')){
            $this->dropTable('tbl_tag');
        }
        $this->createTable('tbl_tag', [
            'id' => $this->primaryKey(),
            'tags' => $this->string(20)->notNull(),
            'model' => $this->string(15),
            'model_id' => $this->integer(),
            'created_by_id' => $this->integer(),
            'created_on' => $this->dateTime(),
        ]);
        
        $this->createIndex(
            'idx-tag-created_by_id',
            'tbl_tag',
            'created_by_id'
            );
        
        $this->createIndex(
            'idx-tag-tags',
            'tbl_tag',
            'tags'
            );
        
        $this->addForeignKey(
            'fk-tag-created_by_id',
            'tbl_tag',
            'created_by_id',
            'tbl_user',
            'id',
            'CASCADE'
            );
        
    }
    
    public function down()
    {
        $this->dropForeignKey(
            'fk-tag-created_by_id',
            'tbl_tag'
            );
        
        $this->dropIndex(
            'idx-log-created_by_id',
            'tbl_tag'
            );
        
        $this->dropIndex(
            'idx-tag-tags',
            'tbl_tag'
            );
        
        $this->dropTable('tbl_tag');
    }
}
