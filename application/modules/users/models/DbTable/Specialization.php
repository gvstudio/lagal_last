<?php

class Users_Model_DbTable_Specialization extends Rastor_Model_DbTable_Abstract {

    protected $_name = 'specialization';
    protected $_primary = 'id';
    protected $_sequence = true;

    public function getJobSpecialization($id){
        $select = $this->select()
                ->from(array('jsa' => 'jobs_specialization_assoc'), array('id' => 's.id', 'name' => 's.name'))
                ->setIntegrityCheck(false)
                ->joinLeft(array('s' => 'specialization'), 's.id = jsa.specialization_id', null)
                ->where('jsa.job_id = ?', $id)
                ->order('s.name');
                
        return $this->getAdapter()->fetchAll($select);
    }
    
}