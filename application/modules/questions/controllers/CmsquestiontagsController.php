<?php

class Questions_CmsQuestionTagsController extends Rastor_Controller_Cms_ActionTable {

    protected $_modelClassName = 'Questions_Model_QuestionTags';
    protected $_tableOptions = array(
        'rebuildParams' => false,
        'removeParams' => false,
        'pageRange' => 3
    );
    protected $_tableParams = array('id', 'name', 'type');
    protected $_tableColumns = array('id', 'Название', 'Тип');
    protected $_tableColumnsWidth = array(40, 0);
    protected $_tableButtons = array('edit', 'remove');

    public function editAction() {
        Core_View_Helper_CmsTitle::getTitle('Редактирование вопроса');
        $id = $this->_getParam('id', 0);

        if ($data = $this->getModel()->getDbTable()->getRecord($id)) {
            $form = new Content_Form_CmsContent();
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
                    $this->_redirect(Rastor_Url::get('admin', array('module' => 'content', 'controller' => 'cms', 'action' => 'showlist')));
                }
            }
        } else {
            $messager = new Rastor_Controller_Cms_Messager();
            $messager->setAction('not_found');
            $this->_redirect(Rastor_Url::get('admin', array('module' => 'content', 'controller' => 'cms', 'action' => 'showlist')));
        }
    }

}