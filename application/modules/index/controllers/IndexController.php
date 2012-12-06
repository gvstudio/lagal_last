<?php

class Index_IndexController extends Zend_Controller_Action {

    public function indexAction() {
        $this->_forward('index', 'index', 'questions');
    }
    
}

