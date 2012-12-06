<?php

class Users_ObjectsController extends Rastor_Controller_Action {

    public function addAction() {
        $this->_helper->layout->setLayout('objects');
        
        $object = $this->_getParam('object');
        //Zend_Debug::dump($object);die;
	
        if ($object == 'job') {
            $this->view->selectedTab = 2;
        } else if ($object == 'personalquestion') {
            $this->view->selectedTab = 1;
        } else {
            $this->view->selectedTab = 0;
        }
    }

}

