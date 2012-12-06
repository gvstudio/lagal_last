<?php

class Questions_Model_DbTable_Question extends Rastor_Model_DbTable_Abstract {

    protected $_name = 'question';
    protected $_primary = 'id';
    protected $_sequence = true;

    protected function _getRastorTableSelect($requestParams) {
        return $this->select()
                        ->from(array('q' => $this->_name))
                        ->setIntegrityCheck(false)
                        ->joinLeft(array('m' => 'member'), 'q.member_id = m.id', array('user_name' => 'm.name'))
                        ->group('q.id');
    }

}