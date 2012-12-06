<?php

class Jobs_IndexController extends Rastor_Controller_Action {

    public function indexAction() {
        $jobsModel = new Jobs_Model_Jobs();
        $specializationModel = new Users_Model_Specialization();

        $page = $this->_getParam('page');
        $paginator = $jobsModel->getPaginator($page, $this->_itemsPerPage, $this->_pageRange, $this->_getLocale()->getLanguage());

        
        $tags = array();
        foreach ($paginator as $record) {
            $tags[$record->id] = $specializationModel->getJobSpecializationsLinksList($record->id);
        }
        
        $this->view->paginator = $paginator;
        $this->view->tags = $tags;

        //$this->view->headTitle($this->_getTranslator()->_('Статьи'));
    }

    public function jobsspecializationAction() {
        $jobsModel = new Jobs_Model_Jobs();
        $specializationModel = new Users_Model_Specialization();

        $specialization = $this->_getParam('specialization');

        $specializationRecord = $specializationModel->getDbTable()->getRecord($specialization);
        
        if ($specializationRecord) {
            $page = $this->_getParam('page');
            $paginator = $jobsModel->getPaginator($page, $this->_itemsPerPage, $this->_pageRange, $this->_getLocale()->getLanguage(), array('specialization' => $specialization));

            $tags = array();
            foreach ($paginator as $record) {
                $tags[$record->id] = $specializationModel->getJobSpecializationsLinksList($record->id);
            }
            
            $this->view->specialization = $specializationRecord;
            $this->view->paginator = $paginator;
            $this->view->tags = $tags;
        } else {
            throw new Exception('Specialization not found');
        }

        //$this->view->headTitle($this->_getTranslator()->_('Статьи'));
    }

    public function viewAction() {
        $jobsModel = new Jobs_Model_Jobs();
        $specializationModel = new Users_Model_Specialization();

        $id = $this->_getParam('id');
        $record = $jobsModel->getDbTable()->getEnableRecord($id);
        if ($record) {
            $this->view->record = $jobsModel->getDbTable()->getEnableRecord($id);
            $this->view->tags = $specializationModel->getJobSpecializationsLinksList($id);
            $jobsModel->getDbTable()->incViews();
        } else {
            throw new Exception('Job not found');
        }
    }
    
    public function addAction() {
        $citiesModel = new Cities_Model_DbTable_City();
        //Zend_Debug::dump($_SESSION);die;
        $this->view->cities = $citiesModel->getCityList();
	$jobs_db = new Jobs_Model_DbTable_Jobs();
	$form = new Questions_Form_Question();
	$form->getElement('name')->setLabel('Заголовок');
	$this->view->form = $form;
	if($this->getRequest()->isPost()){
	    $user = new Zend_Session_Namespace('Zend_Auth');
	  //Zend_Debug::dump($_POST);die;
	  $insert_arra = array(
		  'name' => $_POST['name'],
		  'content' => $_POST['job-summary'],
		  'city_id' => $_POST['a'],
		  'price'=>$_POST['job-amount'],
		  'requirements' => $_POST['job-tech'],
		  'experience'=>$_POST['experience'],
		  'user_id'=>$user->storage->id,
		  'date' => time()
		  );
	  $jobs_db->insert($insert_arra);
	  $this->_redirect('/');
	}
	
    }

}

