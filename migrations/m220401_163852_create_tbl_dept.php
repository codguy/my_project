<?php

use yii\db\Migration;

/**
 * Class m220401_163852_create_tbl_dept
 */
class m220401_163852_create_tbl_dept extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function up()
    {
        if(Yii::$app->db->schema->getTableSchema('tbl_dept')){
            $this->dropTable('tbl_dept');   
        }
        $this->createTable('tbl_dept', [
            'id' => $this->primaryKey(),
            'name' => $this->string(50)->notNull(),
            'field' => $this->string(25)->defaultValue(Null),
            'school_name' => $this->string(25),
            'hod_id' => $this->integer(),
            'created_on' => $this->dateTime(),
            'created_by_id' => $this->integer()->defaultValue(1),
            'updated_on' => $this->dateTime(),
        ]);

        $this->createIndex(
            'idx-dept-created_by_id',
            'tbl_dept',
            'created_by_id'
        );

        $this->addForeignKey(
            'fk-dept-created_by_id',
            'tbl_dept',
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
        $this->dropForeignKey(
            'fk-post-created_by_id',
            'tbl_dept'
        );

        $this->dropIndex(
            'idx-dept-created_by_id',
            'tbl_dept',
        );

        $this->dropTable('tbl_dept');
    }
}
