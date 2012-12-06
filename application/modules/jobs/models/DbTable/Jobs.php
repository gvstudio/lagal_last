<?php

class Jobs_Model_DbTable_Jobs extends Rastor_Model_DbTable_Abstract {

    protected $_name = 'jobs';
    protected $_primary = 'id';
    protected $_sequence = true;

    protected function _getRastorTableSelect($requestParams) {
        return $this->select()
                        ->from(array('j' => $this->_name))
                        ->setIntegrityCheck(false)
                        ->joinLeft(array('u' => 'users'), 'j.user_id = u.id', array('user_name' => 'u.name'))
                        ->group('j.id');
    }

    /**
     * Get select query for pagination.
     * 
     * @param array $options
     * @return Zend_Db_Table_Select
     */
    protected function _getPaginatorSelect($options) {
        if (isset($options['specialization'])) {
            $select = $this->select()
                    ->setIntegrityCheck(false)
                    ->from(array('j' => $this->_name))
                    ->joinLeft(array('u' => 'users'), 'j.user_id = u.id', array('user_name' => 'u.name', 'user_id' => 'u.id'))
                    ->joinLeft(array('с' => 'city'), 'с.id = j.city_id', array('user_city' => 'name'))
                    ->joinLeft(array('jsa' => 'jobs_specialization_assoc'), 'jsa.job_id = j.id', null)
                    ->where('jsa.specialization_id = ?', $options['specialization'])
                    ->where('enable = 1')
                    ->order('j.date');
        } else {
            $select = $this->select()
                    ->setIntegrityCheck(false)
                    ->from(array('j' => $this->_name))
                    ->joinLeft(array('u' => 'users'), 'j.user_id = u.id', array('user_name' => 'u.name', 'user_id' => 'u.id'))
                    ->joinLeft(array('с' => 'city'), 'с.id = j.city_id', array('user_city' => 'name'))
                    ->where('enable = 1')
                    ->order('j.date');
        }

        return $select;
    }

    public function getEnableRecord($id) {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->from(array('j' => $this->_name))
                ->joinLeft(array('u' => 'users'), 'j.user_id = u.id', array('user_name' => 'u.name', 'user_id' => 'u.id'))
                ->joinLeft(array('с' => 'city'), 'с.id = j.city_id', array('user_city' => 'name'))
                ->where('j.id = ?', $id)
                ->where('enable = 1');

        return $this->getAdapter()->fetchRow($select);
    }

    public function incViews() {
        $this->getAdapter()->query("update $this->_name set views = views + 1");
    }

}