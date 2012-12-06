<?php

class Users_ServicesController extends Rastor_Controller_Action {

    public function servicesAction() {
         if ($this->_getAuth()->getIdentity()->role != 'jurist') {
            throw new Exception('Only for lawyers!');
         }
		$model = new Users_Model_DbTable_JuristServices();
		 $this->_helper->layout->setLayout('profile');
		 if(isset($_POST['service-1'])&&isset($_POST['price-1'])){		
		 	$model->insertServices($_POST,$this->_getAuth()->getIdentity()->id);		 	
		 } 
		 $services=$model->getRecords($this->_getAuth()->getIdentity()->id);
		 $this->view->services=$services;
		 unset($_POST);
    }

  
	
	
	

}

