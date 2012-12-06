<?php

class Content_IndexController extends Rastor_Controller_Action {

    public function indexAction() {
    	//die;
        $contentModel = new Content_Model_Content();

        $uri = $this->_getParam('uri');

        $content = $contentModel->getDbTable()->getRecordByUri($uri);
//die;
        if ($content) {
		//Zend_Debug::dump($this->_getLocale()->getLanguage());//die;
            $content = $contentModel->buildParams($content, $this->_getLocale()->getLanguage());
            $contentModel->buildHead($content, $this->view);

            $this->view->content = $content;
        } else {
            throw new Exception('Content not found');
        }
    }
	
	public function howworkAction() {
    	$this->_helper->layout->setLayout('howwork');
        $contentModel = new Content_Model_Content();

        $uri = 'kak_eto_rabotaet';		
        $content = $contentModel->getDbTable()->getRecordByUri($uri);

        if ($content) {
		//Zend_Debug::dump($this->_getLocale()->getLanguage());//die;
            $content = $contentModel->buildParams($content, $this->_getLocale()->getLanguage());
            $contentModel->buildHead($content, $this->view);

            $this->view->content = $content;
        } else {
            throw new Exception('Content not found');
        }
    }

    public function getAction() {
    	die;
        $contentModel = new Content_Model_Content();

        $id = $this->_getParam('id');
        $content = $contentModel->getDbTable()->getEnableRecord($id);

        if ($content) {
		
            $content = $contentModel->buildParams($content, $this->_getLocale()->getLanguage());
            /*
            if ($buildHead) {
                $contentModel->buildHead($content, $this->view);
            }*/
            $this->view->content = $content;
        } else {
            $this->view->content = null;
        }
    }

    public function mainpageAction() {
    	die;
        $contentModel = new Content_Model_Content();
//Zend_Debug::dump($this->_getLocale());die;
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
    
   
    public function contactsAction() {
    	die;
       // $productModel = new Catalog_Model_Product();
       // $cart = new Catalog_Model_Cart();
       // $orderModel = new Catalog_Model_Order();

       // $this->view->items = $productModel->buildParams($cart->getItems(), $this->_getLocale()->getLanguage(), true);
        //$this->view->price = $cart->getPrice();
        //$this->view->count = $cart->getCount();

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
                    $mail->setSubject('Сообщение с сайта');
                    $mail->send();
                }

                $this->view->form = 'Ваше сообщение успешно отправлено!';
            }
        }
    }
	public function benefitsAction() {
		die;
        $contentModel = new Content_Model_Content();

        $uri = $this->_getParam('uri');

        $content = $contentModel->getDbTable()->getRecordByUri($uri);

        if ($content) {
            $content = $contentModel->buildParams($content, $this->_getLocale()->getLanguage());
            $contentModel->buildHead($content, $this->view);

            $this->view->content = $content;
        } else {
	    $this->view->content = '';
            //throw new Exception('Content not found');
        }
    }
	
	public function getcrumbsAction() {
    	//die;
        $contentModel = new Content_Model_Content();

        $uri = $this->_getParam('uri');
		$uri = $_SERVER['REQUEST_URI'];
		$uri =  explode("/",$uri);
		
		//$uri = $uri;
		//Zend_Debug::dump($uri[1]);die;
		$crumbs = $contentModel->getDbTable()->getCrumbsUri($uri[1]);
		$this->view->crumbs=$crumbs;
	}

  
	

}

