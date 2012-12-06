<?php

class Cities_Model_DbTable_City extends Rastor_Model_DbTable_Abstract {

    protected $_name = 'city';
    protected $_primary = 'id';
    protected $_sequence = true;
    
    public function getCityList() {
        $select = $this->select()->order('district')->order('name');
        $records = $this->getAdapter()->fetchAll($select);

        $result = array();
        foreach ($records as $record) {
            $result[$record->district][$record->id] = $record->name;
        }

        return $result;
    }
    
}