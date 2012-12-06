<?php

class Users_Form_Contacts extends Rastor_Form {

    public function __construct() {
        parent::__construct();

        $this->setAction('')
                ->setMethod('post');
				
		$auth = Rastor_Auth::getInstance();
        $userData = $auth->getIdentity();
		
		$usersModel = new Users_Model_DbTable_Users();
      	$data = $usersModel->getLawyerById($userData->id);


        $phone = $this->createElement('text', 'phone', array('label' => 'Телефон:', 'required' => false));
        $phone->addDecorator('errors', array('class' => 'error'))
                ->setValue($data->phone);
        
        $phoneTime = $this->createElement('text', 'phone_time', array('label' => 'Удобное время для звонков:', 'required' => false));
        $phoneTime->addDecorator('errors', array('class' => 'error'))
                ->setValue($data->phone_time);
        
        $email = $this->createElement('text', 'email', array('label' => 'Электронная почта:'));
        $email->addDecorator('errors', array('class' => 'error'))
                ->addValidator(new Zend_Validate_EmailAddress())
                ->setValue($data->email);
        
        $url = $this->createElement('text', 'url', array('label' => 'Адрес сайта:', 'required' => false));
        $url->addDecorator('errors', array('class' => 'error'))
                ->setValue($data->url);
        
        $cityModel = new Cities_Model_DbTable_City();
        
        $cityId = $this->createElement('select', 'city_id', array('label' => 'Город:', 'required' => false));
        $cityId->addDecorator('errors', array('class' => 'error'))
                ->setMultiOptions(array(0 => 'Нет') + $cityModel->getCityList())
				->setValue($data->city_id);
        
        $adress = $this->createElement('text', 'adress', array('label' => 'Адрес офиса:', 'required' => false));
        $adress->addDecorator('errors', array('class' => 'error'))
                ->setValue($data->adress);

        $this->addElements(array($phone, $phoneTime, $email, $url, $cityId, $adress));
    }

}