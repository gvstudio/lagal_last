<?php

class Users_Form_ChangePassword extends Rastor_Form {

    public function __construct() {
        parent::__construct();

        $this->setAction('')
                ->setMethod('post');

        $auth = Rastor_Auth::getInstance();
        $userData = $auth->getIdentity();
        
        $password = $this->createElement('password', 'password', array('label' => 'Старый пароль:'));
        $password->addDecorator('errors', array('class' => 'error'))
                ->addValidator(new Rastor_Validate_OldPassword(new Core_Model_DbTable_Users(), $userData->login))
                ->setRequired();

        $newPassword = $this->createElement('password', 'new_password', array('label' => 'Новый пароль:'));
        $newPassword->addDecorator('errors', array('class' => 'error'))
                ->setRequired();

        $confirmPassword = $this->createElement('password', 'confirm_password', array('label' => 'Новый пароль еще раз:'));
        $confirmPassword->addDecorator('errors', array('class' => 'error'))
                ->addValidator(new Rastor_Validate_EqualPasswords('new_password'))
                ->setRequired(false);
        
        $submit = $this->createElement('submit', 'submit', array('disableLoadDefaultDecorators' => true, 'required' => true, 'label' => 'Изменить пароль'));
        $submit->addDecorator('viewHelper')
                ->addDecorator('errors')
                ->setAttrib('class', 'buttonChangePassword');
        
        $this->addElements(array($password, $newPassword, $confirmPassword, $submit));
    }

}
