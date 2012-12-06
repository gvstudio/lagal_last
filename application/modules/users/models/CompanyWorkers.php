<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CompanyWorkers
 *
 * @author Design
 */
class Users_Model_CompanyWorkers extends Rastor_Model_TableAbstract {
   
     protected $_dbTableClassName = 'Users_Model_DbTable_CompanyWorkers';

    protected function _getViewUrl($record) {
        return Rastor_Url::get('content', array('uri' => $record->uri));
    }

    protected function _getEditUrl($record) {
        return Rastor_Url::get('admin', array('module' => 'content', 'controller' => 'cms', 'action' => 'edit', 'id' => $record->id));
    }
}

?>
