<?php

class Questions_Form_CmsQuestion extends Rastor_Form {

    public function __construct() {
        parent::__construct();

        $this->setAction('')
                ->setMethod('post');

        $name = $this->createElement('text', 'name', array('label' => 'Заголовок вопроса:'));
        $name->addDecorator('errors', array('class' => 'error'))
                ->setRequired();

        $content = $this->createElement('textarea', 'content', array('label' => 'Содержание'));
        $content->addDecorator('errors', array('class' => 'error'))
                ->setRequired();

        $questionModel = new Questions_Model_Question();

        $type = $this->createElement('select', 'type', array('label' => 'Тип'));
        $type->addDecorator('errors', array('class' => 'error'))
                ->setMultiOptions($questionModel->getTypes())
                ->setRequired();

        $paid = $this->createElement('checkbox', 'paid', array('label' => 'Оплачиваемый'));
        $paid->addDecorator('errors', array('class' => 'error'));

        $price = $this->createElement('text', 'price', array('label' => 'Цена'));
        $price->addDecorator('errors', array('class' => 'error'))
                ->setRequired();
        
        $tags = $this->createElement('multiCheckbox', 'tags', array('label' => 'Теги'));
        $tags->addDecorator('errors', array('class' => 'error'))
                ->setRequired();
        
        $enable = $this->createElement('checkbox', 'enable', array('label' => 'Активность'));
        $enable->addDecorator('errors', array('class' => 'error'));
        
        $this->addElements(array(
            $name,
            $content,
            $type,
            $paid,
            $price,
            $tags,
            $enable
        ));

        $submit = $this->createElement('submit', 'submit', array('disableLoadDefaultDecorators' => true, 'required' => true, 'label' => 'Отправить'));
        $submit->addDecorator('viewHelper')
                ->addDecorator('errors')
                ->setAttrib('class', 'button submit')
                ->addDecorator('htmlTag', array('tag' => 'p'));

        $this->addElement($submit);
    }

}
