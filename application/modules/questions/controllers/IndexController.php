<?php

class Questions_IndexController extends Rastor_Controller_Action {

    public function indexAction() { 		
        $questionsModel = new Questions_Model_Question();
		$questionDbModel = new Questions_Model_DbTable_Question();
        $questionTagsModel = new Questions_Model_QuestionTags();
		//Zend_Debug::dump($this->_getAuth()->getIdentity());
		//Zend_Debug::dump($_SESSION);
        $page = $this->_getParam('page');
		//Zend_Debug::dump($this->_getLocale()->getLanguage());
        //$paginator = $questionsModel->getPaginator($page, $this->_itemsPerPage, $this->_pageRange, $this->_getLocale()->getLanguage());
		//
		$paginator= $questionDbModel->getQuestion();
		$paidWA = $questionDbModel->getQuestionPaidWithoutAnswer();
		$questions=array();
        $tags = array();
        foreach ($paginator as $record) {
        	
            if($record->type!=0){            	
            	continue;       	
			}
			else{
				$questions[]=$record;
				$tags[$record->id] = $questionTagsModel->getQuestionTagsLinksList($record->id);
			}
			
        }		
        $this->view->paginator = $questions;
		 $this->view->paidWA = $paidWA;
		//Zend_Debug::dump($questions);
        $this->view->tags = $tags;
		
        //$this->view->headTitle($this->_getTranslator()->_('Статьи'));
    }

    public function questiontagAction() {
        $questionsModel = new Questions_Model_Question();
        $questionTagsModel = new Questions_Model_QuestionTags();

        $tag = $this->_getParam('tag');

        $tagRecord = $questionTagsModel->getDbTable()->getRecord($tag);

        if ($tagRecord) {
            $page = $this->_getParam('page');
            $paginator = $questionsModel->getPaginator($page, $this->_itemsPerPage, $this->_pageRange, $this->_getLocale()->getLanguage(), array('tag' => $tag));

            $tags = array();
            foreach ($paginator as $record) {
                $tags[$record->id] = $questionTagsModel->getQuestionTagsLinksList($record->id);
            }

            $this->view->tag = $tagRecord;
            $this->view->paginator = $paginator;
            $this->view->tags = $tags;
        } else {
            throw new Exception('Tag not found');
        }

        //$this->view->headTitle($this->_getTranslator()->_('Статьи'));
    }

    private function getPostList($array, $pname) {
        $list = array();
        foreach ($array as $key => $value) {
            if (substr($key, 0, strlen($pname)) == $pname) {
                $list[] = substr($key, strlen($pname));
            }
        }

        return $list;
    }
	
	private function setPostList($array, $pname){
		$list = array();
		$count = count($array);
		for($i=0;$i<$count;$i++){
			$list[] = $pname.$array[$i];
		}
		return $list;		
	}

    public function addAction() {
    	//die;
        $questionTagsModel = new Questions_Model_DbTable_QuestionTags();

        $form = new Questions_Form_Question();

        $this->view->tags1 = $questionTagsModel->getTags(0);
        $this->view->tags2 = $questionTagsModel->getTags(1);
		
        if (!$this->getRequest()->isPost()) {
            $this->view->form = $form;
        } else {
            if (!$form->isValid($_POST)) {
                $this->view->form = $form;
            } else {
                $formData = $form->getValues();
                $usersModel = new Users_Model_DbTable_Users();

                if ($this->_getAuth()->hasIdentity()) {
                    $formData['user_id'] = $this->_getAuth()->getIdentity()->id;
                }
               
                $formData['tags'] = $this->getPostList($_POST, 'tag_');
                $_SESSION['newQuestion'] = $formData;
				$_SESSION['newQuestion']['type']=0;
                
                $questionModel = new Questions_Model_DbTable_Question();
                //die;
                $this->_redirect(Rastor_Url::get('question_preview'));
            }
        }
    }
    
    public function previewAction(){
       // Zend_Debug::dump($_SESSION['newQuestion']);
        $this->view->record = $_SESSION['newQuestion'];
	$this->view->auth=$this->_getAuth();
        
    }

   public function previewpersonalAction(){
       //  echo "asdasd";//	asdasdasdas
         //die;
       // Zend_Debug::dump($_SESSION['newQuestion']);
        $this->view->record = $_SESSION['newQuestion'];
        
    }
   
   public function editpersonalAction(){
   	//die;
   		$form = new Questions_Form_PersonalQuestion();
		$form->setValues($_SESSION['newQuestion']);
		$questionTagsModel = new Questions_Model_DbTable_QuestionTags();
		 
		$this->view->tags1 = $questionTagsModel->getTags(0);
        $this->view->tags2 = $questionTagsModel->getTags(1);
		
		 if (!$this->getRequest()->isPost()) {
            $this->view->form = $form;
			 //$this->_redirect(Rastor_Url::get('users_add'));
        } else {
            if (!$form->isValid($_POST)) {
                //$this->view->form = $form;
				$this->_redirect(Rastor_Url::get('content_add'));
            } else {
                $formData = $form->getValues();
                $usersModel = new Users_Model_DbTable_Users();

                if ($this->_getAuth()->hasIdentity()) {
                    $formData['user_id'] = $this->_getAuth()->getIdentity()->id;
                }
               
                $formData['tags'] = $this->getPostList($_POST, 'tag_');
                $_SESSION['newQuestion'] = $formData;
                
                $questionModel = new Questions_Model_DbTable_Question();
                $_SESSION['newQuestion']['type']=1;
                $this->_redirect(Rastor_Url::get('question_previewpersonal'));
            }
        }
   }
   
    public function addpersonalAction() {
        $questionTagsModel = new Questions_Model_DbTable_QuestionTags();
		
      	$form = new Questions_Form_PersonalQuestion();

        $this->view->tags1 = $questionTagsModel->getTags(0);
        $this->view->tags2 = $questionTagsModel->getTags(1);
		
        if (!$this->getRequest()->isPost()) {
            $this->view->form = $form;
			 //$this->_redirect(Rastor_Url::get('users_add'));
        } else {
            if (!$form->isValid($_POST)) {
                //$this->view->form = $form;
				$this->_redirect(Rastor_Url::get('content_add'));
            } else {
                $formData = $form->getValues();
                $usersModel = new Users_Model_DbTable_Users();

                if ($this->_getAuth()->hasIdentity()) {
                    $formData['user_id'] = $this->_getAuth()->getIdentity()->id;
                }
               
                $formData['tags'] = $this->getPostList($_POST, 'tag_');
                $_SESSION['newQuestion'] = $formData;
                $_SESSION['newQuestion']['type']=1;
                $questionModel = new Questions_Model_DbTable_Question();
                //die;
                $this->_redirect(Rastor_Url::get('question_previewpersonal'));
            }
        }
    }
	
	public function editAction(){
		 //Zend_Debug::dump($_SESSION['newQuestion']);
		 $form = new Questions_Form_Question();
		 $form->setValues($_SESSION['newQuestion']);
		 $questionTagsModel = new Questions_Model_DbTable_QuestionTags();
		 
		 $this->view->tags1 = $questionTagsModel->getTags(0);
         $this->view->tags2 = $questionTagsModel->getTags(1);
		 
		 //$this->view->tags3 = $this->setPostList($_SESSION['tags'], $pname);
     // $this->view->form = $form;
	  	if (!$this->getRequest()->isPost()) {
            $this->view->form = $form;
        } else {
            if (!$form->isValid($_POST)) {
                $this->view->form = $form;
            } else {
                $formData = $form->getValues();
                $usersModel = new Users_Model_DbTable_Users();

                if ($this->_getAuth()->hasIdentity()) {
                    $formData['user_id'] = $this->_getAuth()->getIdentity()->id;
                }
                
                $formData['tags'] = $this->getPostList($_POST, 'tag_');
                $_SESSION['newQuestion'] = $formData;
                
                $questionModel = new Questions_Model_DbTable_Question();
                
                $this->_redirect(Rastor_Url::get('question_preview'));
            }
        }
	}
	
	public function publishAction(){
		//Zend_Debug::dump($_SESSION['newQuestion']);die;
		if(isset($_SESSION['newQuestion'])){
		 	$questionTagsModel = new Questions_Model_DbTable_Question();
		 	$questionTagsModel->insertQuestion($_SESSION['newQuestion']);
			$id=$questionTagsModel->selectByNameContent($_SESSION['newQuestion']['name'],$_SESSION['newQuestion']['content']);
			//Zend_Debug::dump($id);die;
			$this->view->idQ=$id;
			//Zend_Debug::dump($id);die;
			unset($_SESSION['newQuestion']);
		}
		else $this->_redirect(Rastor_Url::get('default'));
		
		 
		  
	}
	
	public function topayAction(){
		// Zend_Debug::dump($_POST);die;
		$id=$this->_getParam('id');//die;
		$questionTagsModel = new Questions_Model_DbTable_Question();
		$data = array('paid'=>'1','price'=>$_POST['money']);
		$questionTagsModel->update($data,$id);
		/*if(isset($_SESSION['newQuestion'])){
		 	$questionTagsModel = new Questions_Model_DbTable_Question();
		 	$questionTagsModel->insertQuestion($_SESSION['newQuestion']);
			$id=$questionTagsModel->selectByNameContent($_SESSION['newQuestion']['name'],$_SESSION['newQuestion']['content']);
			//Zend_Debug::dump($id);die;
			$this->view->id=$id;
			unset($_SESSION['newQuestion']);
		}*/
		/*$this->_redirect(Rastor_Url::get('default'));	*/	
		 
		  
	}
	
	public function publishpersonalAction(){
		 //Zend_Debug::dump($_SESSION['newQuestion']);
		 $questionTagsModel = new Questions_Model_DbTable_Question();
		 $questionTagsModel->insertQuestion($_SESSION['newQuestion']);
		  $this->_redirect(Rastor_Url::get('content_index'));
		  
	}
	
	public function lawyerlistAction(){
		$lawyerModel = new Users_Model_DbTable_Users();
		$lawyers = $lawyerModel->getRandLawyers();
		$_SESSION['newQuestion']['lawyers'] = array();
		for($i=0;$i<7;$i++)
		{
			$_SESSION['newQuestion']['lawyers'][]=$lawyers[$i]->id;
		}	
		//Zend_Debug::dump($_SESSION['newQuestion']);die;	
		 $this->view->lawyers= $lawyers;
		  
	}
	
	public function personalsaveAction(){
		$questionTagsModel = new Questions_Model_DbTable_Question();
		 $questionTagsModel->insertQuestion($_SESSION['newQuestion'],1);
		 $this->_redirect(Rastor_Url::get('question_greeting_message'));
	}

    public function viewAction() {
    	//die;  
		$questioncomments = new Questions_Model_DbTable_QuestionAnswers(); 	
        $questionsModel = new Questions_Model_Question();
        $questionTagsModel = new Questions_Model_QuestionTags();
		//$form = new Questions_Form_AnswerQuestion();
		
		
        $id = $this->_getParam('id');
		
		$question = $questionsModel->getDbTable()->getEnableRecord($id);
		$questionsModel->getDbTable()->incViews($id);
		$answer = $questioncomments->getNormalAnswer($id);
		$answer['0']->id=$id;
		//Zend_Debug::dump($answer); die;
		$keys = $answer['0'];		
		unset($answer['0']);
		
		$this->view->keys=$keys;
		$this->view->answers = $answer;
		$this->view->question = $question;
		//Zend_Debug::dump($answer); die;
		
		//$this->view->form = $form; 
		//Zend_Debug::dump($answer);//die;
       /* $record = $questionsModel->getDbTable()->getEnableRecord($id);
        if ($record) {
            $this->view->record = $questionsModel->getDbTable()->getEnableRecord($id);
            $this->view->tags = $questionTagsModel->getQuestionTagsLinksList($id);
            $questionsModel->getDbTable()->incViews();
        } else {
           // throw new Exception('Question not found');
        }*/
    }
	
	public function greetingAction(){
		
	}
	
	public function addcommentAction(){
		
		//Zend_Debug::dump(Rastor_Url::get('question_view'));die;
		$questioncomments = new Questions_Model_DbTable_QuestionAnswers();
		$id = $this->_getParam('id');
		$_POST['qid']=$id;
		$_POST['uid']=  $this->_getAuth()->getIdentity()->id;
		$questioncomments->addNewAnswer($_POST);
		
		//Zend_Debug::dump($_POST);die;
		$this->_redirect('question'.'/'.$id);
	}
	

}

