<?php

class Questions_Form_AnswerQuestion extends Rastor_Form {

    public function __construct() {
        parent::__construct();

        $this->setAction('')
                ->setMethod('post');

        $name = $this->createElement('textarea',  'name', array('label' => 'ответить на вопрос:'));
        $name->addDecorator('errors', array('class' => 'error'))
      //          ->setDescription('Поле обязательно для заполнения')
                ->setRequired();

        $level = $this->createElement('hidden', 'level');
		$right_key = $this->createElement('hidden', 'right_key');
		
		$submit = $this->createElement('submit', 'submit', array('disableLoadDefaultDecorators' => true, 'required' => true, 'label' => 'Опубликовать'));
        $submit->addDecorator('viewHelper')
                ->addDecorator('errors')
				->setAttrib('class', 'buttonPublish')
                ->addDecorator('htmlTag', array('tag' => 'p'));

     

        $this->addElements(array(
            $level,
            $right_key,           
            $name,
            $submit
        ));
  
    }

}
