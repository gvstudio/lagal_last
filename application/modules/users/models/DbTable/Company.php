<?php

class Users_Model_DbTable_Company extends Rastor_Model_DbTable_Abstract {

    protected $_name = 'company';
    protected $_primary = 'id';
    protected $_sequence = true;

    protected function _getRastorTableSelect($requestParams) {
        return $this->select()
                        ->from(array('c' => $this->_name))
                        ->setIntegrityCheck(false)
                        ->joinLeft(array('u' => 'users'), 'u.id = c.user_id')
                        ->where('u.role = ?', 'company')
                        ->group('c.id');
    }

    public function getSelectList() {
        $records = $this->getRecords();
        
        $result = array();
        foreach ($records as $value) {
            $result[$value->id] = $value->name;
        }
        
        return $result;
    }

}