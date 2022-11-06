<?php

use yii\db\Migration;

/**
 * Class m220421_161515_create_tbl_like
 */
class m220421_161515_create_tbl_like extends Migration
{
    
    public function up()
    {
        if(Yii::$app->db->schema->getTableSchema('tbl_like')){
            $this->dropTable('tbl_like');   
        }
        $this->createTable('tbl_like', [
            'id' => $this->primaryKey(),
            'model' => $this->string(255)->defaultValue(Null),
            'model_id' => $this->integer()->notNull(),
            'created_on' => $this->dateTime(),
            'created_by_id' => $this->integer()->defaultValue(1),
            'updated_on' => $this->dateTime(),
        ]);

        $this->createIndex(
            'idx-like-created_by_id',
            'tbl_like',
            'created_by_id'
        );

        $this->createIndex(
            'idx-like-model',
            'tbl_like',
            'model'
        );
        
        $this->addForeignKey(
            'fk-like-created_by_id',
            'tbl_like',
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
        $this->dropTable('tbl_like');
    }
    
}
