<?php

use yii\db\Migration;

/**
 * Class m220421_154646_create_tbl_feed
 */
class m220421_154646_create_tbl_feed extends Migration
{
    public function up()
    {
        if(Yii::$app->db->schema->getTableSchema('tbl_feed')){
            $this->dropTable('tbl_feed');   
        }
        $this->createTable('tbl_feed', [
            'id' => $this->primaryKey(),
            'title' => $this->string(50)->notNull(),
            'desciption' => $this->text()->defaultValue(Null),
            'created_on' => $this->dateTime(),
            'created_by_id' => $this->integer()->defaultValue(1),
            'updated_on' => $this->dateTime(),
        ]);

        $this->createIndex(
            'idx-feed-created_by_id',
            'tbl_feed',
            'created_by_id'
        );

        $this->createIndex(
            'idx-feed-title',
            'tbl_feed',
            'title'
        );
        
        $this->addForeignKey(
            'fk-feed-created_by_id',
            'tbl_feed',
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

        $this->dropTable('tbl_feed');
    }
}
