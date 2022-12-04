<?php

use yii\db\Migration;

/**
 * Class m220421_161110_create_tbl_social_link
 */
class m220421_161110_create_tbl_social_link extends Migration
{
    
    public function up()
    {
        if(Yii::$app->db->schema->getTableSchema('tbl_social_link')){
            $this->dropTable('tbl_social_link');   
        }
        $this->createTable('tbl_social_link', [
            'id' => $this->primaryKey(),
            'platform' => $this->string(255)->notNull(),
            'link' => $this->text()->notNull(),
            'created_on' => $this->dateTime(),
            'created_by_id' => $this->integer()->defaultValue(1),
            'updated_on' => $this->dateTime(),
        ]);

        $this->createIndex(
            'idx-social_link-created_by_id',
            'tbl_social_link',
            'created_by_id'
        );
        
        $this->addForeignKey(
            'fk-social_link-created_by_id',
            'tbl_social_link',
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
        $this->dropTable('tbl_social_link');
    }
    
    
}
