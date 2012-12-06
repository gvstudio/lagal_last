<?php

class Jobs_Form_CmsJob extends Rastor_Form {

    public function __construct() {
        parent::__construct();

        $this->setAction('')
                ->setMethod('post');

        $name = $this->createElement('text', 'name', array('label' => 'Название'));
        $name->addDecorator('errors', array('class' => 'error msg'))
                ->setAttrib('class', 'big');

        $jobsModel = new Jobs_Model_Jobs();
        
        $type = $this->createElement('select', 'type', array('label' => 'Тип'));
        $type->addDecorator('errors', array('class' => 'error'))
                ->setMultiOptions($jobsModel->getTypes())
                ->setRequired();
        
        $content = $this->createElement('textarea', 'content', array('label' => 'Описание'));
        $content->addDecorator('errors', array('class' => 'error'))
                ->setRequired(false);
        
        $requirements = $this->createElement('textarea', 'requirements', array('label' => 'Требование к кандидату'));
        $requirements->addDecorator('errors', array('class' => 'error'))
                ->setRequired(false);
        
        $specializationModel = new Users_Model_DbTable_Specialization();
        
        $specializations = $this->createElement('multiCheckbox', 'specializations', array('label' => 'Специализация юриста'));
        $specializations->addDecorator('errors', array('class' => 'error'))
                ->setMultiOptions($specializationModel->getColArray('name'))
                ->setRequired(false);
        
        $experience = $this->createElement('text', 'experience', array('label' => 'Требуемый опыт работы'));
        $experience->addDecorator('errors', array('class' => 'error msg'));
        
        $specializationModel = new Users_Model_DbTable_Users();
        
        $user = $this->createElement('select', 'user_id', array('label' => 'Автор'));
        $user->addDecorator('errors', array('class' => 'error'))
                ->setMultiOptions($specializationModel->getColArray('name'))
                ->setRequired(false);
        
        $submit = $this->createElement('submit', 'submit', array('disableLoadDefaultDecorators' => true, 'required' => true, 'label' => 'Создать'));
        $submit->addDecorator('viewHelper')
                ->addDecorator('errors')
                ->addDecorator('htmlTag', array('tag' => 'p'));

        $this->addElements(array(
            $name,
            $type,
            $content,
            $requirements,
            $specializations,
            $experience,
            $user,
            $submit
        ));
    }

}
