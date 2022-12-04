<?php

use yii\db\Migration;

/**
 * Class m220421_155808_create_tbl_image
 */
class m220421_155808_create_tbl_image extends Migration
{
    public function up()
    {
        if(Yii::$app->db->schema->getTableSchema('tbl_image')){
            $this->dropTable('tbl_image');   
        }
        $this->createTable('tbl_image', [
            'id' => $this->primaryKey(),
            'name' => $this->string()->notNull(),
            'folder' => $this->string()->notNull(),
            'model' => $this->string(255)->defaultValue(Null),
            'model_id' => $this->integer()->notNull(),
            'created_on' => $this->dateTime(),
            'created_by_id' => $this->integer()->defaultValue(1),
            'updated_on' => $this->dateTime(),
        ]);

        $this->createIndex(
            'idx-image-created_by_id',
            'tbl_image',
            'created_by_id'
        );
        
        $this->addForeignKey(
            'fk-image-created_by_id',
            'tbl_image',
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

        $this->dropTable('tbl_image');
    }
}
