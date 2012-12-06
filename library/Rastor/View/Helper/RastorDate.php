<?php

class Rastor_View_Helper_RastorDate extends Zend_View_Helper_Abstract {

    public function RastorDate($value) {
        $difference = time() - $value;

        if ($difference > 60 * 60 * 24 * 30) {
            $difference = (int) ($difference / (60 * 60 * 24 * 30));
            return $difference . ' ' . $this->view->translate(array('месяц', 'месяца', 'месяцов', $difference, 'ru'));
        } else if ($difference > 60 * 60 * 24) {
            $difference = (int) ($difference / (60 * 60 * 24));
            return $difference . ' ' . $this->view->translate(array('день', 'дня', 'дней', $difference, 'ru'));
        } else if ($difference > 60 * 60) {
            $difference = (int) ($difference / (60 * 60));
            return $difference . ' ' . $this->view->translate(array('час', 'часа', 'часов', $difference, 'ru'));
        } else {
            $difference = (int) ($difference / 60);
            return $difference . ' ' . $this->view->translate(array('минуту', 'минуты', 'минут', $difference, 'ru'));
        }
    }

}