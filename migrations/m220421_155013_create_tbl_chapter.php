<?php

use yii\db\Migration;

/**
 * Class m220421_155013_create_tbl_chapter
 */
class m220421_155013_create_tbl_chapter extends Migration
{
    public function up()
    {
        if(Yii::$app->db->schema->getTableSchema('tbl_chapter')){
            $this->dropTable('tbl_chapter');   
        }
        $this->createTable('tbl_chapter', [
            'id' => $this->primaryKey(),
            'title' => $this->string(50)->notNull(),
            'desciption' => $this->text()->defaultValue(Null),
            'dificulty' => $this->tinyInteger(),
            'course_id' => $this->integer(),
            'created_on' => $this->dateTime(),
            'created_by_id' => $this->integer()->defaultValue(1),
            'updated_on' => $this->dateTime(),
        ]);

        $this->createIndex(
            'idx-chapter-created_by_id',
            'tbl_chapter',
            'created_by_id'
        );
        
        $this->addForeignKey(
            'fk-chapter-created_by_id',
            'tbl_chapter',
            'created_by_id',
            'tbl_user',
            'id',
            'CASCADE'
        );

        $this->createIndex(
            'idx-chapter-course_id',
            'tbl_chapter',
            'course_id'
        );
        
        $this->addForeignKey(
            'fk-chapter-course_id',
            'tbl_chapter',
            'course_id',
            'tbl_course',
            'id',
            'CASCADE'
        );
        
    }
    
    /**
     * {@inheritdoc}
     */
    public function down()
    {
        
        $this->dropTable('tbl_chapter');
    }
}
