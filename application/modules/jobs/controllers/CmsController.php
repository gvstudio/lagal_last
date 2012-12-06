<?php

class Jobs_CmsController extends Rastor_Controller_Cms_ActionTable {

    protected $_modelClassName = 'Jobs_Model_Jobs';
    protected $_tableOptions = array(
        'rebuildParams' => false,
        'removeParams' => false,
        'pageRange' => 3
    );
    protected $_tableParams = array('id', 'name', 'user_name', 'type', 'date', 'enable');
    protected $_tableColumns = array('id', 'Название', 'Автор', 'Тип', 'Дата', 'Активный');
    protected $_tableColumnsWidth = array(40, 0);
    protected $_tableButtons = array('edit', 'remove');

    public function editAction() {
        Core_View_Helper_CmsTitle::getTitle('Редактирование работы');
        $id = $this->_getParam('id', 0);

        $JobsSpecializationAssocModel = new Jobs_Model_DbTable_JobsSpecializationAssoc();
        
        if ($data = $this->getModel()->getDbTable()->getRecord($id)) {
            $form = new Jobs_Form_CmsJob();
            $form->setValues($data);
            $form->getElement('submit')->setLabel('Изменить');
            $form->getElement('specializations')->setValue($JobsSpecializationAssocModel->getOwnerRecords($id, 'job_id', 'specialization_id'));

            if (!$this->getRequest()->isPost()) {
                $this->view->form = $form;
            } else {
                if (!$form->isValid($_POST)) {
                    $this->view->form = $form;
                } else {
                    $formData = $form->getValues();

                    $specializations = $formData['specializations'];
                    unset($formData['specializations']);
                    
                    if ($this->getModel()->getDbTable()->update($formData, $id) | $JobsSpecializationAssocModel->updateList($specializations, $id, 'job_id', 'specialization_id')) {
                        $messager = new Rastor_Controller_Cms_Messager();
                        $messager->setAction('successfully_changed');
                        Rastor_Callback::callback();
                    } else {
                        $messager = new Rastor_Controller_Cms_Messager();
                        $messager->setAction('not_changed');
                    }
                    $this->_redirect(Rastor_Url::get('admin', array('module' => 'jobs', 'controller' => 'cms', 'action' => 'showlist')));
                }
            }
        } else {
            $messager = new Rastor_Controller_Cms_Messager();
            $messager->setAction('not_found');
            $this->_redirect(Rastor_Url::get('admin', array('module' => 'jobs', 'controller' => 'cms', 'action' => 'showlist')));
        }
    }

}