<?php

use yii\db\Migration;

/**
 * Class m221206_165017_add_new_column_type_id_in_tbl_log
 */
class m221206_165017_add_new_column_type_id_in_tbl_log extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('tbl_log', 'type_id', $this->tinyInteger());
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropColumn('tbl_log', 'type_id');
    }

}
