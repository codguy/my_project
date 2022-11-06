<?php

use yii\db\Migration;

/**
 * Class m220421_160759_create_tbl_follow
 */
class m220421_160759_create_tbl_follow extends Migration
{
    
    public function up()
    {
        if(Yii::$app->db->schema->getTableSchema('tbl_follow')){
            $this->dropTable('tbl_follow');   
        }
        $this->createTable('tbl_follow', [
            'id' => $this->primaryKey(),
            'model' => $this->string(255)->defaultValue(Null),
            'model_id' => $this->integer()->notNull(),
            'created_on' => $this->dateTime(),
            'created_by_id' => $this->integer()->defaultValue(1),
            'updated_on' => $this->dateTime(),
        ]);

        $this->createIndex(
            'idx-follow-created_by_id',
            'tbl_follow',
            'created_by_id'
        );
        
        $this->addForeignKey(
            'fk-follow-created_by_id',
            'tbl_follow',
            'created_by_id',
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
        
        $this->dropTable('tbl_follow');
    }
    
    
}
