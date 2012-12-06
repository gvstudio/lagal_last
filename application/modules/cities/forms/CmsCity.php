<?php

class Cities_Form_CmsCity extends Rastor_Form {

    public function __construct() {
        parent::__construct();

        $this->setAction('')
                ->setMethod('post');

        $name = $this->createElement('text', 'name', array('label' => 'Название'));
        $name->addDecorator('errors', array('class' => 'error'))
                ->setRequired();

        $district = $this->createElement('text', 'district', array('label' => 'Округ'));
        $district->addDecorator('errors', array('class' => 'error'))
                ->setRequired(false);
        
        $this->addElements(array(
            $name,
            $district
        ));

        $submit = $this->createElement('submit', 'submit', array('disableLoadDefaultDecorators' => true, 'required' => true, 'label' => 'Отправить'));
        $submit->addDecorator('viewHelper')
                ->addDecorator('errors')
                ->setAttrib('class', 'button submit')
                ->addDecorator('htmlTag', array('tag' => 'p'));

        $this->addElement($submit);
    }

}
