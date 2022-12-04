<?php

use yii\db\Migration;

/**
 * Class m220419_154955_create_tbl_course
 */
class m220419_154955_create_tbl_course extends Migration
{
    /*
     * {@inheritdoc}
     */
    public function up()
    {
        if(Yii::$app->db->schema->getTableSchema('tbl_course')){
            $this->dropTable('tbl_course');   
        }
        $this->createTable('tbl_course', [
            'id' => $this->primaryKey(),
            'name' => $this->string(50)->notNull(),
            'desciption' => $this->text()->defaultValue(Null),
            'dificulty' => $this->tinyInteger(),
            'trainer_id' => $this->integer(),
            'created_on' => $this->dateTime(),
            'created_by_id' => $this->integer()->defaultValue(1),
            'updated_on' => $this->dateTime(),
        ]);

        $this->createIndex(
            'idx-course-created_by_id',
            'tbl_course',
            'created_by_id'
        );

        $this->addForeignKey(
            'fk-course-created_by_id',
            'tbl_course',
            'created_by_id',
            'tbl_user',
            'id',
            'CASCADE'
        );

        $this->createIndex(
            'idx-trainer-trainer_id',
            'tbl_course',
            'trainer_id'
        );

        $this->addForeignKey(
            'fk-trainer-trainer_id',
            'tbl_course',
            'trainer_id',
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
        // drops foreign key for table `user`
        $this->dropForeignKey(
            'fk-post-created_by_id',
            'tbl_dept'
        );

        $this->dropTable('tbl_course');
    }
}
