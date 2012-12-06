<?php

class Users_Model_JuristProfstatus extends Rastor_Model_TableAbstract {

    protected $_dbTableClassName = 'Users_Model_DbTable_JuristProfstatus';

    protected function _getViewUrl($record) {
        return Rastor_Url::get('content', array('uri' => $record->uri));
    }

    protected function _getEditUrl($record) {
        return Rastor_Url::get('admin', array('module' => 'users', 'controller' => 'juristprofstatus', 'action' => 'edit', 'id' => $record->id));
    }
    
}
