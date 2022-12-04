<?php

use yii\db\Migration;

/**
 * Class m220421_161721_create_tbl_skill
 */
class m220421_161721_create_tbl_skill extends Migration
{
    
    public function up()
    {
        if(Yii::$app->db->schema->getTableSchema('tbl_skill')){
            $this->dropTable('tbl_skill');   
        }
        $this->createTable('tbl_skill', [
            'id' => $this->primaryKey(),
            'model' => $this->string(255)->defaultValue(Null),
            'model_id' => $this->integer()->notNull(),
            'skill' => $this->string(25)->notNull(),
            'level' => $this->tinyInteger()->defaultValue(1),
            'created_on' => $this->dateTime(),
            'created_by_id' => $this->integer()->defaultValue(1),
            'updated_on' => $this->dateTime(),
        ]);

        $this->createIndex(
            'idx-skill-model',
            'tbl_skill',
            'model'
        );

        $this->createIndex(
            'idx-skill-created_by_id',
            'tbl_skill',
            'created_by_id'
        );
        
        $this->addForeignKey(
            'fk-skill-created_by_id',
            'tbl_skill',
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
        $this->dropTable('tbl_skill');
    }
    
}
