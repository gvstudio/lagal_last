<?php

class Users_Model_DbTable_Jurist extends Rastor_Model_DbTable_Abstract {

    protected $_name = 'jurist';
    protected $_primary = 'id';
    protected $_sequence = true;

    protected function _getRastorTableSelect($requestParams) {
        return $this->select()
                        ->from(array('c' => $this->_name))
                        ->setIntegrityCheck(false)
                        ->joinLeft(array('u' => 'users'), 'u.id = c.user_id')
                        ->where('u.role = ?', 'jurist')
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
    
    public function getUserInfo($id){
        $select = $this->select()
                ->where('user_id = ?', $id);
        
        return $this->getAdapter()->fetchRow($select);
    }
	
	public function getRandLawyers(){
		$select = $this->select()
				      ->order('RAND()')
					  ->limit(7);
		return $this->fetchAll($select);
	}

}