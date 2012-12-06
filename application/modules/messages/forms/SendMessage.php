<?php

class Messages_Form_SendMessage extends Rastor_Form {

    public function __construct() {
        parent::__construct();

        $this->setAction('')
                ->setMethod('post');

        $text = $this->createElement('textarea', 'text', array('label' => ''));
        $text->addDecorator('errors', array('class' => 'error msg'))
                ->setRequired(TRUE);
				
		$file = $this->createElement('file', 'file', array('label' => 'Прикрепить файл'));
        $file->addDecorator('errors', array('class' => 'error msg'))
                ->setRequired(FALSE);

        
        
        $submit = $this->createElement('submit', 'submit', array('disableLoadDefaultDecorators' => true, 'required' => true, 'label' => 'Создать'));
        $submit->addDecorator('viewHelper')
                ->addDecorator('errors')
                ->addDecorator('htmlTag', array('tag' => 'p'))
				->setAttrib('class','buttonPay');
				

        $this->addElements(array(
            $text,
            $file,            
            $submit
        ));
    }

}
