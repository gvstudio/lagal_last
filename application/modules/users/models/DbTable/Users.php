<?php

class Users_Model_DbTable_Users extends Rastor_Model_DbTable_Abstract {

    protected $_name = 'users';
    protected $_primary = 'id';
    protected $_sequence = true;

    public function getSelectList() {
        $records = $this->getRecords();
        
        $result = array();
        foreach ($records as $value) {
            $result[$value->id] = $value->login;
        }
        
        return $result;
    }
    
	public function getRandLawyers(){
	$select = $this->select()
				   ->where('role = ?','jurist')
			       ->order('RAND()')
				   ->limit(7);
				   //Zend_Debug::dump($select);die;
		return $this->getAdapter()->fetchAll($select);
	}
	
	public function getAllLawyers(){
	$select = $this->select()
				   ->where('role = ?','jurist');
				   //Zend_Debug::dump($select);die;
		return $this->getAdapter()->fetchAll($select);
	}
	
	public function getLawyerById($id){
	$select = $this->select()
				 //  ->where('role = ?','jurist')
				   ->where('id = ?',$id);
				   //Zend_Debug::dump($this->getAdapter()->fetchRow($select));die;
		return $this->getAdapter()->fetchRow($select);
	}
	
	public function getUserById($id){
		$select = $this->select()
					   ->where('id =?',$id);
		return $this->getAdapter()->fetchRow($select);
	}
	
	public function getCountMessage($id){
			$this->_name = 'messages';
			$select = $this->select()
				   ->from($this->_name,array('count'=>'COUNT(*)'))
				   ->where('to_id = ?',$id);						  
		return $this->getAdapter()->fetchRow($select);
	}
		
	public function getSomeLawyers($limit=3){
		$select = $this->select()
					   ->setIntegrityCheck(false)
					   ->distinct()
					   ->from(array('u'=>$this->_name), array('id' => 'u.id', 'name' => 'u.name', 'spec'=>'sp.name', 'photo'=>'u.photo'))
					   ->join(array('j'=>'jurist'),'u.id =  j.user_id',null)
					   ->join(array('js'=>'jurist_specialization'),'j.id =  js.jurist_id',null)
					   ->join(array('sp'=>'specialization'),'js.specialization_id =  sp.id',null)
					   ->limit($limit);
					  
		return $this->getAdapter()->fetchAll($select); 						
	}
	public function getFullInfLawyer($id){
		$select = $this->select()
					   ->setIntegrityCheck(false)
					   ->from(array('u'=>$this->_name), array('id' => 'u.id', 'name' => 'u.name', 'photo'=>'u.photo','prof_status'=>'prof.name','adress'=>'u.adress','site'=>'u.url','phone'=>'u.phone','phone_time'=>'u.phone_time','expir'=>'j.experience','job'=>'j.job','achieve'=>'j.education_achieve','number'=>'j.jurist_number','univer'=>'j.education_name'))
					   ->join(array('j'=>'jurist'),'u.id =  j.user_id',null)
					   ->join(array('prof'=>'jurist_profstatus'),'prof.id=j.profstatus_id',null)
					   
					   ->where('u.id = ?',$id);
					   //->limit($limit);
		$result =  $this->getAdapter()->fetchAll($select);
		$spec = $this->getSpecializationById($id); 
		
		$result[0]->spec=$spec;
		
		return $result[0];						
	}

	public function getSpecializationById($id){
		$select = $this->select()
					   ->setIntegrityCheck(false)					   
					   ->from(array('u'=>$this->_name), array('spec'=>'sp.name'))
					   ->join(array('j'=>'jurist'),'u.id =  j.user_id',null)
					   ->join(array('js'=>'jurist_specialization'),'j.id =  js.jurist_id',null)
					   ->join(array('sp'=>'specialization'),'js.specialization_id =  sp.id',null)
					   ->where('u.id = ?',$id);
		return $this->getAdapter()->fetchAll($select); 
	}
	
	public function getAuthResultBySocial($uid)
	{
		$select = $this->select()
						->where('snetwork = ?',$uid);
		return $this->getAdapter()->fetchRow($select);
	}
	public function getUserByEmail($mail){
	    $select= $this->select()
		    ->from($this->_name)
		    ->where('email = ?',$mail);
	    
	    return $this->getAdapter()->fetchRow($select);
	}
}