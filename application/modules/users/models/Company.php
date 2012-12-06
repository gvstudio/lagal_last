<?php

class Users_Model_Company extends Rastor_Model_TableAbstract {

    protected $_dbTableClassName = 'Users_Model_DbTable_Company';

    protected function _getViewUrl($record) {
        return Rastor_Url::get('content', array('uri' => $record->uri));
    }

    protected function _getEditUrl($record) {
        return Rastor_Url::get('admin', array('module' => 'content', 'controller' => 'cms', 'action' => 'edit', 'id' => $record->id));
    }
    
}
