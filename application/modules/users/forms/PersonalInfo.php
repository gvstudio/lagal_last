<?php

class Users_Form_PersonalInfo extends Rastor_Form {

    public function __construct() {
        parent::__construct();

        $this->setAction('')
                ->setMethod('post');

        $auth = Rastor_Auth::getInstance();
        $userData = $auth->getIdentity();

        $name = $this->createElement('text', 'name', array('label' => 'ФИО:'));
        $name->addDecorator('errors', array('class' => 'error'))
                ->setValue($userData->name)
                ->setRequired();

        $sex = $this->createElement('select', 'sex', array('label' => 'Пол:'));
        $sex->addDecorator('errors', array('class' => 'error msg'))
                ->setValue($userData->sex)
                ->setMultiOptions(array(
                    0 => '',
                    1 => 'мужской',
                    2 => 'женский'
                ));

        $options = array('0' => 'День');
        for ($i = 1; $i <= 31; $i++) {
            $options[$i] = $i;
        }

        $bday = $this->createElement('select', 'bday', array('disableLoadDefaultDecorators' => true));
        $bday->addDecorator('viewHelper')
                ->setMultiOptions($options)
                ->setValue($userData->bday)
                ->setRequired(false);

        $options = array('0' => 'Месяц');
        $options = $options + Zend_Locale::getTranslationList('month', $this->getTranslator()->getLocale());


        $bmonth = $this->createElement('select', 'bmonth', array('disableLoadDefaultDecorators' => true));
        $bmonth->addDecorator('viewHelper')
                ->setMultiOptions($options)
                ->setValue($userData->bmonth)
                ->setRequired(false);

        $options = array('0' => 'Год');
        for ($i = date('Y') - 70; $i <= date('Y') - 16; $i++) {
            $options[$i] = $i;
        }

        $byear = $this->createElement('select', 'byear', array('disableLoadDefaultDecorators' => true));
        $byear->addDecorator('viewHelper')
                ->setMultiOptions($options)
                ->setValue($userData->byear)
                ->setRequired(false);

        $submit = $this->createElement('submit', 'submit', array('disableLoadDefaultDecorators' => true, 'required' => true, 'label' => 'Изменить пароль'));
        $submit->addDecorator('viewHelper')
                ->addDecorator('errors')
                ->setAttrib('class', 'buttonChangePassword');

        $this->addElements(array($name, $sex, $bday, $bmonth, $byear));
    }

}