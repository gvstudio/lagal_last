<?php

class Users_Form_CmsJuristProfstatus extends Rastor_Form {

    public function __construct() {
        parent::__construct();

        $this->setAction('')
                ->setMethod('post');

        $name = $this->createElement('text', 'name', array('label' => 'Название'));
        $name->addDecorator('errors', array('class' => 'error msg'))
                ->setAttrib('class', 'big');

        $submit = $this->createElement('submit', 'submit', array('disableLoadDefaultDecorators' => true, 'required' => true, 'label' => 'Создать'));
        $submit->addDecorator('viewHelper')
                ->addDecorator('errors')
                ->addDecorator('htmlTag', array('tag' => 'p'));

        $this->addElements(array(
            $name,
            $submit
        ));
    }

}
