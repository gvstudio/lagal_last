<?php

class Users_CmsUserServicesController extends Rastor_Controller_Cms_ActionTable {

    protected $_modelClassName = 'Users_Model_UserServices';
    protected $_tableOptions = array(
        'rebuildParams' => false,
        'removeParams' => false,
        'pageRange' => 3
    );
    protected $_tableParams = array('id', 'name', 'email');
    protected $_tableColumns = array('id', 'Название', 'Пользователь');
    protected $_tableColumnsWidth = array(40, 0, 200, 150);
    protected $_tableButtons = array('edit', 'remove');

    public function addAction() {
        Core_View_Helper_CmsTitle::getTitle('Новая услуга пользователя');
        $form = new Users_Form_CmsUserService();

        if (!$this->getRequest()->isPost()) {
            $this->view->form = $form;
        } else {
            if (!$form->isValid($_POST)) {
                $this->view->form = $form;
            } else {
                $formData = $form->getValues();

                if ($this->getModel()->getDbTable()->insert($formData)) {
                    $messager = new Rastor_Controller_Cms_Messager();
                    $messager->setAction('successfully_added');
                    $this->_redirect(Rastor_Url::get('admin', array('module' => 'users', 'controller' => 'cmsuserservices', 'action' => 'showlist')));
                }
            }
        }
    }

    public function editAction() {
        Core_View_Helper_CmsTitle::getTitle('Редактирование услуги пользователя');
        $id = $this->_getParam('id', 0);

        if ($data = $this->getModel()->getDbTable()->getRecord($id)) {
            $form = new Users_Form_CmsUserService();
            $form->setValues($data);
            $form->getElement('submit')->setLabel('Изменить');

            if (!$this->getRequest()->isPost()) {
                $this->view->form = $form;
            } else {
                if (!$form->isValid($_POST)) {
                    $this->view->form = $form;
                } else {
                    $formData = $form->getValues();

                    if ($this->getModel()->getDbTable()->update($formData, $id)) {
                        $messager = new Rastor_Controller_Cms_Messager();
                        $messager->setAction('successfully_changed');
                        Rastor_Callback::callback();
                    } else {
                        $messager = new Rastor_Controller_Cms_Messager();
                        $messager->setAction('not_changed');
                    }
                    $this->_redirect(Rastor_Url::get('admin', array('module' => 'users', 'controller' => 'cmsuserservices', 'action' => 'showlist')));
                }
            }
        } else {
            $messager = new Rastor_Controller_Cms_Messager();
            $messager->setAction('not_found');
            $this->_redirect(Rastor_Url::get('admin', array('module' => 'users', 'controller' => 'cmsuserservices', 'action' => 'showlist')));
        }
    }

}