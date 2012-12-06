<?php

class Content_Form_Contacts extends Rastor_Form {

    public function __construct() {
        parent::__construct();

        $this->setAction('')
                ->setMethod('post');

        $name = $this->createElement('text', 'name', array('label' => '*ФИО'));
        $name->addDecorator('errors', array('class' => 'error', 'data-element' => 'name', 'data-message' => 'Представьтесь, пожалуйста.'))
                ->setRequired(TRUE);

        $email = $this->createElement('text', 'email', array('label' => '*E-mail'));
        $email->addDecorator('errors', array('class' => 'error', 'data-element' => 'email', 'data-message' => 'Введите свой e-mail для обратной связи.'))
                ->setRequired(TRUE);

        $phone = $this->createElement('text', 'phone', array('label' => 'Контактный телефон'));
        $phone->addDecorator('errors', array('class' => 'error', 'data-element' => 'phone', 'data-message' => 'Укажите номер своего телефона для лбратной связи.'))
                ->setRequired(FALSE);
        
        $topic = $this->createElement('text', 'topic', array('label' => 'Тема'));
        $topic->addDecorator('errors', array('class' => 'error', 'data-element' => 'topic', 'data-message' => 'Обозначьте тему сообщения.'))
                ->setRequired(false);

        $message = $this->createElement('textarea', 'message', array('label' => '*Сообщение'));
        $message->addDecorator('errors', array('class' => 'error', 'data-element' => 'message', 'data-message' => 'Вы забыли ввести сообщение!'))
                ->setRequired(TRUE);
        
        $this->addElements(array($name, $phone, $email, $message));

        $submit = $this->createElement('submit', 'submit', array('disableLoadDefaultDecorators' => true, 'required' => true, 'label' => 'Отправить'));
        $submit->addDecorator('viewHelper')
                ->addDecorator('errors')
                ->setAttrib('class', 'buttonAsk')
                ->addDecorator('htmlTag', array('tag' => 'dd'));

        $this->addElement($submit);
    }

}
