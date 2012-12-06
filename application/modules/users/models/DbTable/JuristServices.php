<?php

class Users_Model_DbTable_JuristServices extends Rastor_Model_DbTable_Abstract {

    protected $_name = 'jurist_services';
    protected $_primary = 'id';
    protected $_sequence = true;

   public function insertServices($data,$id)
   {
   		echo $insert = "INSERT INTO ".$this->_name." VALUES('',".$id.",'".$data['service-1']."','".$data['price-1']."')";
       for($i=1;isset($data['service-'.$i]);$i++)
		{
			if(isset($data['price-'.$i])){
				$insert = $insert.",('',".$id.",'".$data['service-'.$i]."','".$data['price-'.$i]."')";
			}
		}
		$this->getAdapter()->query($insert);
   }
   public function getServicesById($id)
	{
		
		$select = $this->select()
						->from($this->_name,array('name','price'))
						->where('jurist_id = ?',$id);
		return $this->getAdapter()->fetchAll($select); 
	}
    
}
