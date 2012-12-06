<?php

class Messages_IndexController extends Rastor_Controller_Action {

    public function indexAction() {
       /* $jobsModel = new Jobs_Model_Jobs();
        $specializationModel = new Users_Model_Specialization();

        $page = $this->_getParam('page');
        $paginator = $jobsModel->getPaginator($page, $this->_itemsPerPage, $this->_pageRange, $this->_getLocale()->getLanguage());

        
        $tags = array();
        foreach ($paginator as $record) {
            $tags[$record->id] = $specializationModel->getJobSpecializationsLinksList($record->id);
        }
        
        $this->view->paginator = $paginator;
        $this->view->tags = $tags;*/
       
		$auth = $this->_getAuth()->getIdentity();
        $messageModel = new Messages_Model_DbTable_Messages();
		$messages = $messageModel->getUserMessagesById($auth->id);
		$this->view->messages=$messages;
		 //Zend_Debug::dump($auth->id);die;
		//Zend_Debug::dump($messages);

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
        
        $this->view->cities = $citiesModel->getCityList();
    }
	public function sendmessageAction(){
		$id = $this->_getParam('id');
		//Zend_Debug::dump($id);die;
		$userModel = new Users_Model_DbTable_Users();
		$user = $userModel->getUserById($id);
		$this->view->user = $user;
		$form = new Messages_Form_SendMessage();
		//$this->view->form = $form;
		if (!$this->getRequest()->isPost()) {
            $this->view->form = $form;
        } else {
            if (!$form->isValid($_POST)) {
                $this->view->form = $form;
            } else {
            	if($this->_getAuth()->hasIdentity()){
            		//Zend_Debug::dump();die;
            		$fromUser = $this->_getAuth()->getIdentity();
					//
            		$userModel = new Messages_Model_DbTable_Messages();
					
					
            		$data = $form->getValues();
					$data['from_id']=$fromUser->id;
					$data['to_id']=$id;
					$data['title']= "be";
					$data['date']=date('his');
					
					unset($data['file']);
					if($userModel->insert($data))
					{
						echo "Ваше сообщение доставленно";
					}
					else{
						echo "Ваше сообщение не доставленно, попробуйте позже";
					}
				
					
            	}
				else{
					 throw new Exception('Пройдите авторизацию');
				}
            	
			}
		}
	}

}

