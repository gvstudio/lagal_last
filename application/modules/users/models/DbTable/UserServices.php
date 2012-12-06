<?php

class Users_Model_DbTable_UserServices extends Rastor_Model_DbTable_Abstract {

    protected $_name = 'user_services';
    protected $_primary = 'id';
    protected $_sequence = true;

    protected function _getRastorTableSelect($requestParams) {
        return $this->select()
                        ->from(array('cs' => $this->_name))
                        ->setIntegrityCheck(false)
                        ->joinLeft(array('c' => 'users'), 'c.id = cs.user_id', array('emial' => 'c.email'))
                        ->group('c.id');
    }
	
	

}