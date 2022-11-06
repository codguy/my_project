<?php

use yii\db\Migration;

/**
 * Class m221101_025801_create_tbl_about
 */
class m221101_025801_create_tbl_about extends Migration
{
    public function up()
    {
        $this->createTable('tbl_about', [
            'id' => $this->primaryKey(),
            'state_id' => $this->integer()->notNull(),
            'intro' => $this->text()->notNull(),
            'address' => $this->text()->notNull(),
            'education' => $this->text()->notNull(),
            'location' => $this->text()->notNull(),
            'work' => $this->text()->notNull(),
            'hobbies' => $this->text()->notNull(),
            'created_by_id' => $this->integer()->notNull(),
            'created_on' => $this->dateTime(),
            'updated_on' => $this->dateTime(),
        ]);

        $this->createIndex(
            'idx-about-created_by_id',
            'tbl_about',
            'created_by_id'
        );

        // add foreign key for table `user`
        $this->addForeignKey(
            'fk-about-created_by_id',
            'tbl_about',
            'created_by_id',
            'tbl_user',
            'id',
            'CASCADE'
        );

    }
    
    public function down()
    {
        $this->dropForeignKey(
            'fk-about-created_by_id',
            'tbl_about'
        );

        // drops index for column `category_id`
        $this->dropIndex(
            'idx-about-created_by_id',
            'tbl_about'
        );

        $this->dropTable('tbl_about');
    }
}
