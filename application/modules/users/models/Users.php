<?php

class Users_Model_Users extends Rastor_Model_TableAbstract {

    protected $_dbTableClassName = 'Users_Model_DbTable_Users';
    protected $_roles = array(
        'member' => 'Гражданин',
        'jurist' => 'Юрист',
        'company' => 'Компания',
        'moderator' => 'Модератор',
        'admin' => 'Администратор',
        'superadmin' => 'Супер Администратор',
    );
    

    protected function _getViewUrl($record) {
        return Rastor_Url::get('content', array('uri' => $record->uri));
    }

    protected function _getEditUrl($record) {
        return Rastor_Url::get('admin', array('module' => 'content', 'controller' => 'cms', 'action' => 'edit', 'id' => $record->id));
    }
    
    protected function _getRecordParam($record, $param) {
        switch ($param) {
            case 'enable':
                return $record->enable ? "+" : "-";
            case 'datetime':
                return date('d.m.Y H:i:s', $record->$param);
            case 'date':
                return date('d.m.Y', $record->$param);
            case 'role':
                return $this->_roles[$record->role];
            default:
                return $record->$param;
        }
    }
	

}
