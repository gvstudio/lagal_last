<?php

class Users_CatalogController extends Rastor_Controller_Action {

   public function lawyerlistAction(){
   		//die;
   		
   		$this->_helper->layout->setLayout('catalog');
		$lawyerModel = new Users_Model_DbTable_Users();
		$lawyers = $lawyerModel->getRandLawyers();
		$_SESSION['newQuestion']['lawyers'] = array();
		for($i=0;$i<7;$i++)
		{
			$_SESSION['newQuestion']['lawyers'][]=$lawyers[$i]->id;
		}	
		//Zend_Debug::dump($_SESSION['newQuestion']);die;	
		//Zend_Debug::dump($lawyers);
		 $this->view->lawyers= $lawyers;
		  
	}

}

