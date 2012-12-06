<?php

class Users_Form_Education extends Rastor_Form {

    public function __construct() {
        parent::__construct();

        $this->setAction('')
                ->setMethod('post');

        $auth = Rastor_Auth::getInstance();
        $userData = $auth->getIdentity();
        
        //Zend_Debug::dump($userData);
        
        $profstatusModel = new Users_Model_DbTable_JuristProfstatus();
        $nameList = $profstatusModel->getColArray('name');
        
        $status = $this->createElement('select', 'profstatus_id', array('label' => 'Статус в профессиональном сообществе:'));
        $status->addDecorator('errors', array('class' => 'error msg'))
                ->setValue($userData->jurist->profstatus_id)
                ->setMultiOptions(array(0 => '') + $nameList);

        $job = $this->createElement('text', 'job', array('label' => 'Текущее место работы:'));
        $job->addDecorator('errors', array('class' => 'error'))
                ->setValue($userData->jurist->job)
                ->setRequired(false);

        $options = array('0' => 'менее 1 года');
        for ($i = 1; $i <= 40; $i++) {
            $options[$i] = $i . ' ' . $this->getTranslator()->translate(array('год', 'года', 'лет', $i, 'ru'));
        }
        $options[41] = 'более 40 лет';

        $experience = $this->createElement('select', 'experience', array('label' => 'Опыт работы по юридической специальности:'));
        $experience->addDecorator('errors', array('class' => 'error msg'))
                ->setValue($userData->jurist->experience)
                ->setMultiOptions($options);

        $specializationModel = new Users_Model_DbTable_Specialization();
        $options = $specializationModel->getColArray('name');
        $juristSpecializationDb = new Users_Model_DbTable_JuristSpecialization();
        
        $specialization = $this->createElement('multiselect', 'specialization', array('label' => 'Специализация (5):'));
        $specialization->addDecorator('errors', array('class' => 'error msg'))
                ->setValue($juristSpecializationDb->getColArray('specialization_id', 'jurist_id', $userData->jurist->id))
                ->setMultiOptions($options);

        $cityModel = new Cities_Model_DbTable_City();

        $cityId = $this->createElement('select', 'education_city_id', array('label' => 'Город:'));
        $cityId->addDecorator('errors', array('class' => 'error'))
                ->setMultiOptions($cityModel->getCityList())
                ->setValue($userData->jurist->education_city_id)
                ->setRequired();

        $education = $this->createElement('text', 'education_name', array('label' => 'ВУЗ:'));
        $education->addDecorator('errors', array('class' => 'error'))
                //->setValue($userData->name)
                ->setValue($userData->jurist->education_name)
                ->setRequired(false);

        $options = array('0' => '');
        for ($i = 1960; $i <= date('Y') + 5; $i++) {
            $options[$i] = $i;
        }

        $year = $this->createElement('select', 'education_year', array('disableLoadDefaultDecorators' => true));
        $year->addDecorator('viewHelper')
                ->setMultiOptions($options)
                ->setValue($userData->jurist->education_year)
                //->setValue($userData->byear)
                ->setRequired(false);

        $notcomplited = $this->createElement('checkbox', 'education_notcomplited', array('disableLoadDefaultDecorators' => true));
        $notcomplited->addDecorator('viewHelper')
                ->setValue($userData->jurist->education_notcomplited)
                ->setRequired(false);

        $achieve = $this->createElement('textarea', 'education_achieve', array('label' => 'Достижения:'));
        $achieve->addDecorator('errors', array('class' => 'error'))
                ->setDescription('до 1000 знаков')
                ->setValue($userData->jurist->education_achieve)
                ->setRequired(false);
        
        $number = $this->createElement('text', 'jurist_number', array('label' => 'Номер в реестре адвокатов субъекта РФ:'));
        $number->addDecorator('errors', array('class' => 'error'))
                ->setValue($userData->jurist->jurist_number)
                ->setRequired(false);

        $company = $this->createElement('text', 'jurist_company', array('label' => 'Аккаунт работодателя в LegalMag:'));
        $company->addDecorator('errors', array('class' => 'error'))
                //->setValue($userData->name)
                ->setRequired(false);

        $this->addElements(array($status, $job, $experience, $specialization, $cityId, $education, $year, $notcomplited, $achieve, $number, $company));
    }

}