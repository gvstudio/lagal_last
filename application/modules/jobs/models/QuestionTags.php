<?php

class Questions_Model_QuestionTags extends Rastor_Model_TableAbstract {

    protected $_dbTableClassName = 'Questions_Model_DbTable_QuestionTags';
    protected $_types = array(
        0 => 'Частный вопрос',
        1 => 'Вопрос о бизнесе'
    );

    protected function _getViewUrl($record) {
        return ''; //Rastor_Url::get('content', array('uri' => $record->uri));
    }

    protected function _getEditUrl($record) {
        return Rastor_Url::get('admin', array('module' => 'question', 'controller' => 'cms', 'action' => 'edit', 'id' => $record->id));
    }

    protected function _getRecordParam($record, $param) {
        switch ($param) {
            case 'type':
                return $this->_types[$record->type];
            default:
                return $record->$param;
        }
    }

}
