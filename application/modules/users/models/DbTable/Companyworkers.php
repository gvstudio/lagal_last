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
class Users_Model_DbTable_Companyworkers extends Rastor_Model_DbTable_Abstract {
    
    protected $_name = 'company_workers';
    protected $_primary = 'id';
    protected $_sequence = true;
    
    	public function getWorkers($data){
		$select = $this->select()
					   ->setIntegrityCheck(false)
					   ->distinct()
					   ->from(array('u'=>'users'))
					   ->join(array('j'=>'jurist'),'u.id =  j.user_id',null)
					   ->join(array('cw'=>'company_workers'),'j.id =  cw.jurist_id',null)
					   ->where('cw.company_id = ?', $data);
					  
		return $this->getAdapter()->fetchAll($select); 	
	}
    
        
}

?>
