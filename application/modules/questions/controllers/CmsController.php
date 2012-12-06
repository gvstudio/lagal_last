<?php

class Questions_CmsController extends Rastor_Controller_Cms_ActionTable {

    protected $_modelClassName = 'Questions_Model_Question';
    protected $_tableOptions = array(
        'rebuildParams' => false,
        'removeParams' => false,
        'pageRange' => 3
    );
    protected $_tableParams = array('id', 'name', 'user_name', 'type', 'paid', 'date', 'enable');
    protected $_tableColumns = array('id', 'Название', 'Автор', 'Тип', 'Платный', 'Дата', 'Активный');
    protected $_tableColumnsWidth = array(40, 0);
    protected $_tableButtons = array('edit', 'remove');

    public function editAction() {
        Core_View_Helper_CmsTitle::getTitle('Редактирование вопроса');
        $id = $this->_getParam('id', 0);

        $questionsTagsModel = new Questions_Model_DbTable_QuestionTags();
        $questionsTagsAssocModel = new Questions_Model_DbTable_QuestionTagsAssoc();
        
        if ($data = $this->getModel()->getDbTable()->getRecord($id)) {
            $form = new Questions_Form_CmsQuestion();
            $form->setValues($data);
            $form->getElement('tags')
                    ->setMultiOptions($questionsTagsModel->getColArray('name', $data->type))
                    ->setValue($questionsTagsAssocModel->getOwnerRecords($id, 'question_id', 'tag_id'));
            
            $form->getElement('submit')->setLabel('Изменить');

            if (!$this->getRequest()->isPost()) {
                $this->view->form = $form;
            } else {
                if (!$form->isValid($_POST)) {
                    $this->view->form = $form;
                } else {
                    $formData = $form->getValues();

                    $tags = $formData['tags'];
                    unset($formData['tags']);
                    
                    if ($this->getModel()->getDbTable()->update($formData, $id) | $questionsTagsAssocModel->updateList($tags, $id, 'question_id', 'tag_id')) {
                        $messager = new Rastor_Controller_Cms_Messager();
                        $messager->setAction('successfully_changed');
                        Rastor_Callback::callback();
                    } else {
                        $messager = new Rastor_Controller_Cms_Messager();
                        $messager->setAction('not_changed');
                    }
                    $this->_redirect(Rastor_Url::get('admin', array('module' => 'questions', 'controller' => 'cms', 'action' => 'showlist')));
                }
            }
        } else {
            $messager = new Rastor_Controller_Cms_Messager();
            $messager->setAction('not_found');
            $this->_redirect(Rastor_Url::get('admin', array('module' => 'questions', 'controller' => 'cms', 'action' => 'showlist')));
        }
    }

}