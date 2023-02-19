<?php
use yii\db\Migration;

/**
 * Class m230101_042110_create_tbl_action_log
 */
class m230101_042110_create_tbl_action_log extends Migration
{

    public function up()
    {
        if (Yii::$app->db->schema->getTableSchema('tbl_action_log')) {
            $this->dropTable('tbl_action_log');
        }
        $this->createTable('tbl_action_log', [
            'id' => $this->primaryKey(),
            'status' => $this->string(10)
                ->defaultValue(Null),
            'controller' => $this->string(20)
            ->notNull(),
            'action' => $this->string(20)
            ->notNull(),
            'params' => $this->string(50)
            ->notNull(),
            'type' => $this->string(10)
            ->notNull(),
            'created_on' => $this->dateTime(),
            'created_by_id' => $this->integer()
                ->defaultValue(1)
        ]);

        $this->createIndex('idx-action_log-created_by_id', 'tbl_action_log', 'created_by_id');

        $this->createIndex('idx-action_log-controller', 'tbl_action_log', 'controller');

        $this->addForeignKey('fk-action_log-created_by_id', 'tbl_action_log', 'created_by_id', 'tbl_user', 'id', 'CASCADE');
    }

    /**
     *
     * {@inheritdoc}
     */
    public function down()
    {
        $this->dropForeignKey(
            'fk-action_log-created_by_id',
            'tbl_action_log'
            );
        
        $this->dropIndex(
            'idx-action_log-created_by_id',
            'tbl_action_log'
            );
        
        $this->dropIndex(
            'idx-action_log-controller',
            'tbl_action_log'
            );
        
        $this->dropTable('tbl_action_log');
        
    }
}
