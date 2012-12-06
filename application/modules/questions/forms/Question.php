<?php

class Questions_Form_Question extends Rastor_Form {

    public function __construct() {
        parent::__construct();

        $this->setAction('')
                ->setMethod('post');

        $name = $this->createElement('text', 'name', array('label' => 'Заголовок вопроса:'));
        $name->addDecorator('errors', array('class' => 'error'))
                ->setDescription('Поле обязательно для заполнения')
                ->setRequired();

        $content = $this->createElement('textarea', 'content', array('label' => 'Содержание'));
        $content->addDecorator('errors', array('class' => 'error'))
                ->setDescription('Поле обязательно для заполнения')
                ->setRequired();

        $paid = $this->createElement('radio', 'paid', array('label' => 'Вид вопроса:', 'disableLoadDefaultDecorators' => true));
        $paid->addDecorator('viewHelper')
                ->setSeparator('')
                ->setMultiOptions(array(
                    0 => 'Бесплатный',
                    1 => 'Платный'
                ))
                ->setValue(0)
                ->addDecorator('htmlTag', array('tag' => 'dd', 'class' => 'field'))
                ->addDecorator('label', array('tag' => 'dt'))
                ->addDecorator('errors', array('class' => 'error'));

        $price = $this->createElement('text', 'price', array('disableLoadDefaultDecorators' => true, 'readonly' => true));
        $price->addDecorator('viewHelper')
                ->setAttrib('class', 'amount1')
                ->setValue(90)
                ->setRequired();

        $this->addElements(array(
            $name,
            $content,
            $paid,
            $price
        ));

        if (!$this->_getAuth()->hasIdentity()) {
            $cityModel = new Cities_Model_DbTable_City();

            $cityId = $this->createElement('select', 'city_id', array('label' => 'Регион:'));
            $cityId->addDecorator('errors', array('class' => 'error'))
                    ->setMultiOptions($cityModel->getCityList())
                    ->setRequired();

            $email = $this->createElement('text', 'user_email', array('label' => 'E-mail:'));
            $email->addDecorator('errors', array('class' => 'error'))
                    ->addValidator(new Zend_Validate_EmailAddress())
                    ->setRequired();
            
            $name = $this->createElement('text', 'user_name', array('label' => 'ФИО:'));
            $name->addDecorator('errors', array('class' => 'error'))
                    ->setRequired();

            $this->addElements(array(
                $cityId,
                $name,
                $email
            ));
        }
    }

}
