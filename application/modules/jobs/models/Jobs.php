<?php

class Jobs_Model_Jobs extends Rastor_Model_TableAbstract {

    protected $_dbTableClassName = 'Jobs_Model_DbTable_Jobs';
    protected $_types = array(
        0 => 'Проект',
        1 => 'Работа по трудовому договору'
    );

    protected function _getViewUrl($record) {
        return ''; //Rastor_Url::get('content', array('uri' => $record->uri));
    }

    protected function _getEditUrl($record) {
        return Rastor_Url::get('admin', array('module' => 'jobs', 'controller' => 'cms', 'action' => 'edit', 'id' => $record->id));
    }
    
    public function getTypes(){
        return $this->_types;
    }

    protected function _getRecordParam($record, $param) {
        switch ($param) {
            case 'enable':
                return $record->enable ? "+" : "-";
            case 'paid':
                return $record->paid ? "+" : "-";
            case 'date':
                return date('d.m.Y H:i:s', $record->$param);
            case 'type':
                return $this->_types[$record->type];
            default:
                return $record->$param;
        }
    }

}
