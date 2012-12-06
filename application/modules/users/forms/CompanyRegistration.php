<?php

class Users_Form_CompanyRegistration extends Rastor_Form {

    public function __construct() {
        parent::__construct();

        $this->setAction('')
                ->setMethod('post');

        $usertype = $this->createElement('radio', 'usertype', array('label' => 'Вы регистрируетесь как:'));
        $usertype->addDecorator('errors', array('class' => 'error'))
                ->setMultiOptions(array(
                    1 => 'Гражданин',
                    2 => 'Юрист, адвокат',
                    3 => 'Юридическая компания'
                ))
                ->setValue(3)
                ->setRequired();

        $name = $this->createElement('text', 'name', array('label' => 'Наименование:'));
        $name->addDecorator('errors', array('class' => 'error'))
                ->setRequired();

        $email = $this->createElement('text', 'email', array('label' => 'E-mail:'));
        $email->addDecorator('errors', array('class' => 'error'))
                ->setRequired();

        $cityModel = new Cities_Model_DbTable_City();
        
        $cityId = $this->createElement('select', 'city_id', array('label' => 'Регион:'));
        $cityId->addDecorator('errors', array('class' => 'error'))
                ->setMultiOptions($cityModel->getCityList())
                ->setRequired();
        
        $password = $this->createElement('password', 'password', array('label' => 'Пароль:'));
        $password->addDecorator('errors', array('class' => 'error'))
                ->setAttrib('class', 'passwordfield')
                ->setRequired();
        
        $delegate_name = $this->createElement('text', 'delegate_name', array('label' => 'ФИО представителя'));
        $delegate_name->addDecorator('errors', array('class' => 'error'))
                ->setRequired();
        
        $delegate_phone = $this->createElement('text', 'delegate_phone', array('label' => 'Телефон представителя'));
        $delegate_phone->addDecorator('errors', array('class' => 'error'))
                ->setRequired();

        $submit = $this->createElement('submit', 'submit', array('disableLoadDefaultDecorators' => true, 'required' => true, 'label' => 'Зарегистрироваться и войти'));
        $submit->addDecorator('viewHelper')
                ->addDecorator('errors')
                ->setAttrib('class', 'buttonRegisterAndEnter');
        
        $remember = $this->createElement('checkbox', 'remember', array('label' => 'Запомнить меня'));
        $remember->addDecorator('errors', array('class' => 'error'))
                ->addDecorator('label', array())
                ->addDecorator('htmlTag', array('id' => 'regForm-remember'))
                ->setRequired();
        
        $this->addElements(array($usertype, $name, $email, $password, $delegate_name, $delegate_phone, $cityId));
        
        $this->addDisplayGroup(array('usertype'), 'usertypes')
                ->addDisplayGroup(array('name', 'email', 'city_id', 'password'), 'info')
                ->addDisplayGroup(array('delegate_name', 'delegate_phone'), 'delegate')
                ->setDisplayGroupDecorators(array('FormElements', 'fieldset'));
        
        $this->addElements(array($submit, $remember));
    }

}