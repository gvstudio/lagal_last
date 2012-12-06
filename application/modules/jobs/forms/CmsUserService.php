<?php

class Users_Form_CmsUserService extends Rastor_Form {

    public function __construct() {
        parent::__construct();

        $this->setAction('')
                ->setMethod('post');

        $name = $this->createElement('text', 'name', array('label' => 'Название'));
        $name->addDecorator('errors', array('class' => 'error msg'))
                ->setAttrib('class', 'big');

        $price = $this->createElement('text', 'price', array('label' => 'Цена'));
        $price->addDecorator('errors', array('class' => 'error msg'))
                ->setAttrib('class', 'big');

        $model = new Users_Model_DbTable_Users();
        
        $companyId = $this->createElement('select', 'user_id', array('label' => 'Компания'));
        $companyId->addDecorator('errors', array('class' => 'error msg'))
                ->setMultiOptions($model->getSelectList());

        $submit = $this->createElement('submit', 'submit', array('disableLoadDefaultDecorators' => true, 'required' => true, 'label' => 'Создать'));
        $submit->addDecorator('viewHelper')
                ->addDecorator('errors')
                ->addDecorator('htmlTag', array('tag' => 'p'));

        $this->addElements(array(
            $name,
            $companyId,
            $price,
            $submit
        ));
    }

}
