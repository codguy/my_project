<?php

use yii\db\Migration;

/**
 * Class m220421_160242_create_tbl_discussion
 */
class m220421_160242_create_tbl_discussion extends Migration
{

    public function up()
    {
        if(Yii::$app->db->schema->getTableSchema('tbl_discussion')){
            $this->dropTable('tbl_discusion');   
        }
        $this->createTable('tbl_discussion', [
            'id' => $this->primaryKey(),
            'message' => $this->text()->notNull(),
            'user_id' => $this->integer()->defaultValue(1),
            'replied_to' => $this->integer()->defaultValue(1),
            'model' => $this->string(255)->notNull(),
            'model_id' => $this->integer()->notNull(),
            'created_on' => $this->dateTime(),
            'created_by_id' => $this->integer()->defaultValue(1),
            'updated_on' => $this->dateTime(),
        ]);

        $this->createIndex(
            'idx-discussion-created_by_id',
            'tbl_discussion',
            'created_by_id'
        );

        $this->createIndex(
            'idx-discussion-model',
            'tbl_discussion',
            'model'
        );

        $this->createIndex(
            'idx-discussion-replied_to',
            'tbl_discussion',
            'replied_to'
        );
        
        $this->addForeignKey(
            'fk-discussion-created_by_id',
            'tbl_discussion',
            'created_by_id',
            'tbl_user',
            'id',
            'CASCADE'
        );
        
        $this->addForeignKey(
            'fk-discussion-replied_to',
            'tbl_discussion',
            'replied_to',
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

        $this->dropTable('tbl_discussion');
    }
}
