<?php

class Messages_Model_DbTable_Messages extends Rastor_Model_DbTable_Abstract {

    protected $_name = 'messages';
	public function getUserMessagesById($id)
	{
		$select=$this->select()
					->setIntegrityCheck(false)
					->from(array('m' => $this->_name))
					->joinLeft(array('u'=>'users'),'m.from_id=u.id')
					->where('m.to_id = ?',$id);
		return $this->getAdapter()->fetchAll($select); 
	}

}