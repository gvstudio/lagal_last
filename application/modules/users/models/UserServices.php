<?php

class Users_Model_UserServices extends Rastor_Model_TableAbstract {

    protected $_dbTableClassName = 'Users_Model_DbTable_UserServices';

    protected function _getEditUrl($record) {
        return Rastor_Url::get('admin', array('module' => 'users', 'controller' => 'userservices', 'action' => 'edit', 'id' => $record->id));
    }
    
}
