<?php

class Users_RegistrationController extends Rastor_Controller_Action {

    public function indexAction() {
        $this->_helper->layout->setLayout('registration');
		$id = $this->_getParam('id');
		//Zend_Debug::dump($id);die;
        $type = $this->_getParam('type');
		/*if(isset($_POST['name']))
		{
			echo $_POST['name'];
			Zend_Debug::dump($_POST);die;
		}
		else*/if ($type == 'company') {
            $form = new Users_Form_CompanyRegistration();

            if (!$this->getRequest()->isPost()) {
                $this->view->form = $form;
            } else {
                if (!$form->isValid($_POST)) {
                    $this->view->form = $form;
                } else {
                    $formData = $form->getValues();
                    $usersModel = new Users_Model_DbTable_Users();

                    $formData['role'] = 'company';
                    $delegateName = $formData['delegate_name'];
                    $delegatePhone = $formData['delegate_phone'];
                    
                    unset($formData['usertype']);
                    unset($formData['remember']);
                    unset($formData['delegate_name']);
                    unset($formData['delegate_phone']);
                    $formData['password'] = md5($formData['password']);

                    if ($id = $usersModel->insert($formData)) {
                        $memberModel = new Users_Model_DbTable_Company();
                        $memberModel->insert(array(
                            'user_id' => $id,
                            'delegate_name' => $delegateName,
                            'delegate_phone' => $delegatePhone
                        ));
                        
                        $this->_getAuth()->setIdentity($usersModel->getRecord($id));
                        $_SESSION['registrationSuccess'] = true;
                        $this->_redirect(Rastor_Url::get('default'));
                    }
                }
            }
        } else if ($type == 'jurist') {
            $form = new Users_Form_Registration();
            $form->getElement('usertype')->setValue(2);

            if (!$this->getRequest()->isPost()) {
                $this->view->form = $form;
            } else {
                if (!$form->isValid($_POST)) {
                    $this->view->form = $form;
                } else {
                    $formData = $form->getValues();
                    $usersModel = new Users_Model_DbTable_Users();

                    $formData['role'] = 'jurist';
                    unset($formData['usertype']);
                    unset($formData['remember']);
                    $formData['password'] = md5($formData['password']);

                    if ($id = $usersModel->insert($formData)) {
                        $memberModel = new Users_Model_DbTable_Jurist();
                        $memberModel->insert(array('user_id' => $id));
                        
                        $this->_getAuth()->setIdentity($usersModel->getRecord($id));
                        $_SESSION['registrationSuccess'] = true;
                        $this->_redirect(Rastor_Url::get('default'));
                    }
                }
            }
        } else {
            $form = new Users_Form_Registration();

            if (!$this->getRequest()->isPost()) {
                $this->view->form = $form;
            } else {
                if (!$form->isValid($_POST)) {
                    $this->view->form = $form;
                } else {
                    $formData = $form->getValues();
                    $usersModel = new Users_Model_DbTable_Users();

                    $formData['role'] = 'member';
                    unset($formData['usertype']);
                    unset($formData['remember']);
                    $formData['password'] = md5($formData['password']);

                    if ($id = $usersModel->insert($formData)) {
                        $memberModel = new Users_Model_DbTable_Member();
                        $memberModel->insert(array('user_id' => $id));
                        
                        $this->_getAuth()->setIdentity($usersModel->getRecord($id));
                        $_SESSION['registrationSuccess'] = true;
                        $this->_redirect(Rastor_Url::get('default'));
                    }
                }
            }
        }

        $this->view->form = $form;
    }

    public function getAction() {
        $contentModel = new Content_Model_Content();

        $id = $this->_getParam('id');
        $content = $contentModel->getDbTable()->getEnableRecord($id);

        if ($content) {
            $content = $contentModel->buildParams($content, $this->_getLocale()->getLanguage());
            /*
              if ($buildHead) {
              $contentModel->buildHead($content, $this->view);
              } */
            $this->view->content = $content;
        } else {
            $this->view->content = null;
        }
    }

    public function mainpageAction() {
        $contentModel = new Content_Model_Content();

        $id = $this->_getParam('id');
        $content = $contentModel->getDbTable()->getEnableRecord($id);

        if ($content) {
            $content = $contentModel->buildParams($content, $this->_getLocale()->getLanguage());
            $contentModel->buildHead($content, $this->view);
            $this->view->content = $content;
        } else {
            $this->view->content = null;
        }
    }

    public function successAction() {
        if (isset($_SESSION['registrationSuccess'])){
            unset($_SESSION['registrationSuccess']);
            $this->view->show = true;
        } else {
            $this->view->show = false;
        }
    }
    
    public function errorAction() {
        
    }
	
	public function regformAction(){
		$userModel = new Users_Model_DbTable_Users();
		$this->_helper->layout->setLayout('socregistration');
		$data = file_get_contents('http://loginza.ru/api/authinfo?token='.$_POST['token']);
		$data = Zend_Json::decode($data);
		//Zend_Debug::dump($data['uid']);die;
		$mydata=$userModel->getAuthResultBySocial($data['uid']);
		if($mydata){
			//Zend_Debug::dump($mydata);die;
            
            if ($mydata->role == 'jurist') {
                $juristModel = new Users_Model_DbTable_Jurist();
                $mydata->jurist = $juristModel->getUserInfo($mydata->id);
            }
			
			$messagemodule = new Users_Model_DbTable_Users();
			$mess = $messagemodule->getCountMessage($mydata->id);
			
			$mydata->count = $mess->count;			
            $this->_getAuth()->setIdentity($mydata);
			 $this->_redirect(Rastor_Url::get('default'));
			//$this->_getAuth()->setIdentity("ura");
			//echo "ura"; die;
		}
		else{
			$form = new  Users_Form_SocNetwork();
			$datas = array();
		 	$data['snetwork']=$data['uid'];
		 	$data['name']=$data['name']['last_name'].' '.$data['name']['first_name'];
			$form->setValues($data);
			$this->view->form = $form;
		}
		
		
		 
		 
		 //Zend_Debug::dump($data);die;
		 
		 
		 //$form->snetwork->setValue($_POST['hash']);
		 
	}
		
    public function contactsAction() {
        $productModel = new Catalog_Model_Product();
        $cart = new Catalog_Model_Cart();
        $orderModel = new Catalog_Model_Order();

        $this->view->items = $productModel->buildParams($cart->getItems(), $this->_getLocale()->getLanguage(), true);
        $this->view->price = $cart->getPrice();
        $this->view->count = $cart->getCount();

        $this->view->headTitle($this->_getTranslator()->_('Обратная связь'));

        $form = new Content_Form_Contacts();

        if (!$this->getRequest()->isPost()) {
            $this->view->form = $form;
        } else {
            if (!$form->isValid($_POST)) {
                $this->view->form = $form;
            } else {
                $formData = $form->getValues();

                $usersDbTable = new Core_Model_DbTable_Users();
                $list = $usersDbTable->getAdminMailList();

                $info = 'Контактное лицо: ' . $formData['name'] . '<br/>
						Контактный телефон: ' . $formData['phone'] . '<br/>
						E-mail: ' . $formData['email'] . '<br/>
                                                Тема: ' . $formData['topic'] . '<br/>
                                                Сообщение: ' . $formData['message'];

                foreach ($list as $item) {
                    $mail = new Zend_Mail('utf-8');
                    $mail->setBodyHtml($info);
                    $mail->setFrom($formData['email'], $formData['name']);
                    $mail->addTo($item->email, $item->login);
                    $mail->setSubject('Заказ на сайте');
                    $mail->send();
                }

                $this->view->form = 'Ваше сообщение успешно отправлено!';
            }
        }
    }

}

