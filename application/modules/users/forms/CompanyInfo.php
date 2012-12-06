<?php

class Users_Form_CompanyInfo extends Rastor_Form {

    public function __construct() {
	parent::__construct();
	
	$this->setAction('')
		->setMethod('post');
	
	$auth = Rastor_Auth::getInstance();
	$userData = $auth->getIdentity();
	$data = new Users_Model_DbTable_Company();
	$result=$data->getCompanyInfo($userData->id);
	//Zend_Debug::dump($result->name);die;
	$company_name = $this->createElement('text', 'company_name', array('label' => 'Наименование'));
        $company_name->addDecorator('errors', array('class' => 'error'))
                ->setValue($result->name)
                ->setRequired();
	
	$info = $this->createElement('textarea', 'info', array('label' => 'Информация о компании'));
        $info->addDecorator('errors', array('class' => 'error'))
                ->setValue($result->info)
		->setAttrib('style', 'width : 278px; height: 100px;')
                ->setRequired();
	$name = $this->createElement('text', 'name', array('label' => 'ФИО'));
        $name->addDecorator('errors', array('class' => 'error'))
                ->setValue($result->delegate_name)
                ->setRequired();
	$sex = $this->createElement('select', 'sex', array('label' => 'Пол:'));
        $sex->addDecorator('errors', array('class' => 'error msg'))
                ->setValue($result->delegate_sex)
                ->setMultiOptions(array(
                    0 => '',
                    1 => 'мужской',
                    2 => 'женский'
                ));
	$phone = $this->createElement('text', 'phone', array('label' => 'Телефон:', 'required' => false));
        $phone->addDecorator('errors', array('class' => 'error'))
                ->setValue($result->delegate_phone);
	$email = $this->createElement('text', 'email', array('label' => 'Электронная почта:'));
        $email->addDecorator('errors', array('class' => 'error'))
                ->addValidator(new Zend_Validate_EmailAddress())
                ->setValue($result->delegate_email);
	
	
	$this->addElements(array($company_name, $info, $name , $sex, $phone, $email));
    }

}

?>
