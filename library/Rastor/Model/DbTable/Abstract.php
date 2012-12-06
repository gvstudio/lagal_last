<?php

/**
 * Rastor CMS
 *
 * For the full copyright and license information, please view the LICENSE.txt
 * file that was distributed with this source code.
 * 
 * @copyright 2011-2012 Budjak Orest (rastor.name)
 * @version 0.1
 */

/**
 * Abstract table class
 *
 * @version 1.0 - 20.06.2012
 */
abstract class Rastor_Model_DbTable_Abstract extends Zend_Db_Table_Abstract {

    protected $_primary = 'id';

    /**
     * Get all records.
     * 
     * @return mixed
     */
    public function getRecords() {
        $select = $this->select();
        return $this->getAdapter()->fetchAll($select);
    }

    /**
     * Get all enable records, need row with name 'enable'.
     * 
     * @return mixed 
     */
    public function getEnableRecords() {
        $select = $this->select()
                ->where('enable = 1');
        return $this->getAdapter()->fetchAll($select);
    }

    /**
     * Get record by id. Return false if record does not found.
     * 
     * @param int $id
     * @return 
     */
    public function getRecord($id) {
        $select = $this->select()
                ->where('id = ?', $id);
        return $this->getAdapter()->fetchRow($select);
    }

    /**
     * Get enable record by Id. Return false if record does not found.
     * 
     * @param type $id
     * @return type 
     */
    public function getEnableRecord($id) {
        $select = $this->select()
                ->where('id = ?', $id)
                ->where('enable = 1');
        return $this->getAdapter()->fetchRow($select);
    }

    /**
     * Deleting record by Id. Return count of deleted elements.
     * 
     * @param int $id
     * @return int
     */
    public function delete($id) {
        $where = $this->getAdapter()->quoteInto('id = ?', $id);
        return parent::delete($where);
    }

    /**
     * Updating record by Id. Return count of updated elements.
     *
     * @param array $data
     * @param int $id
     * @return type 
     */
    public function update($data, $id) {
        $where = $this->getAdapter()->quoteInto('id = ?', $id);
        return parent::update($data, $where);
    }

    /**
     * Return an instance of a Zend_Db_Table_Select object.
     *
     * @return Zend_Db_Table_Select
     */
    protected function _getRastorTableSelect($requestParams) {
        return $this->select();
    }

    /**
     * Return an instance of a Zend_Paginator_Adapter_DbSelect data special for RastorTable js
     *
     * @return Zend_Paginator_Adapter_DbSelect
     */
    function getRastorTablePaginatorAdapter($order = '', $orderDirection = null, $requestParams = array()) {
        $select = $this->_getRastorTableSelect($requestParams);

        if (strlen($order)) {
            if ($orderDirection == 0) {
                $select->order($order);
            } else {
                $select->order($order . ' desc');
            }
        }

        return new Zend_Paginator_Adapter_DbSelect($select);
    }

    /**
     * Check is the record protected.
     * 
     * @param int $id
     * @return boolean 
     */
    function isProtected($id) {
        $select = $this->select()
                ->from($this->_name, array('protected'))
                ->where('id = ?', $id);

        $result = $this->getAdapter()->fetchRow($select);

        return (isset($result->protected) && ($result->protected));
    }

    /**
     * Get select query for pagination.
     * 
     * @param array $options
     * @return Zend_Db_Table_Select
     */
    protected function _getPaginatorSelect($options) {
        $select = $this->select()
                ->where('enable = 1');

        if (isset($options['order'])) {
            $select->order($options['order']);
        }

        return $select;
    }

    /**
     * Get adapter for paginatior
     * 
     * @param type $options
     * @return Zend_Paginator_Adapter_DbSelect 
     */
    function getPaginatorAdapter($options) {
        $select = $this->_getPaginatorSelect($options);

        return new Zend_Paginator_Adapter_DbSelect($select);
    }

    /**
     *
     * @param type $array
     * @param type $ownerId
     * @param type $ownerColName
     * @param type $valueColName
     * @return boolean 
     */
    public function insertList($array, $ownerId = 0, $ownerColName = 'owner_id', $valueColName = 'value') {
        $result = false;

        foreach ($array as $value) {
            $result = $result | $this->insert(array(
                        $ownerColName => $ownerId,
                        $valueColName => $value
                    ));
        }

        return $result;
    }

    /**
     *
     * @param type $array
     * @param type $ownerId
     * @param type $ownerColName
     * @param type $valueColName
     * @return boolean 
     */
    public function updateList($array, $ownerId = 0, $ownerColName = 'owner_id', $valueColName = 'value') {
        $result = false;

        $ownerRecords = $this->getOwnerRecords($ownerId, $ownerColName, $valueColName);

        foreach ($array as $value) {
            if (!in_array($value, $ownerRecords)) {
                $result = $this->insert(array(
                    $ownerColName => $ownerId,
                    $valueColName => $value
                        ));
            }
        }

        foreach ($ownerRecords as $value) {
            if (!in_array($value, $array)) {
                $whereOwner = $this->getAdapter()->quoteInto($ownerColName . ' = ?', $ownerId);
                $where = $this->getAdapter()->quoteInto($valueColName . ' = ?', $value);

                parent::delete($where . ' and ' . $whereOwner);
                $result = true;
            }
        }

        return $result;
    }

    /**
     * Insert array of records.
     * 
     * @param array $array
     * @param int $ownerId
     * @param string $ownerColName
     * @return type 
     */
    public function insertRecords($array, $ownerId = null, $ownerColName = null) {
        $result = false;
        foreach ($array as $value) {
            if ($ownerId == null) {
                $result = $result || $this->insert($value);
            } else if ($ownerColName == null) {
                $result = $result || $this->insert($value + array('owner_id' => $ownerId));
            } else {
                $result = $result || $this->insert($value + array($ownerColName => $ownerId));
            }
        }

        return $result;
    }

    /**
     * Update array of records. 
     * 
     * @param array $array
     * @param int $ownerId
     * @param string $ownerColName
     * @return type 
     */
    public function updateRecords($array, $ownerId = null, $ownerColName = null) {
        $result = false;
        $ids = array();

        foreach ($array as $value) {
            if (isset($value['id']) && ($this->getRecord($value['id']))) {
                $result = $result || $this->update($value, $value['id']);
                $ids[] = $value['id'];
            } else {
                if ($ownerId == null) {
                    $lastId = $this->insert($value);
                } else if ($ownerColName == null) {
                    $lastId = $this->insert($value + array('owner_id' => $ownerId));
                } else {
                    $lastId = $this->insert($value + array($ownerColName => $ownerId));
                }

                if (is_numeric($lastId)) {
                    $ids[] = $lastId;
                }
                $result = $result || $lastId;
            }
        }


        if (count($ids)) {
            if ($ownerColName == null) {
                $whereOwner = $this->getAdapter()->quoteInto('owner_id = ?', $ownerId);
            } else {
                $whereOwner = $this->getAdapter()->quoteInto($ownerColName . ' = ?', $ownerId);
            }

            $where = $this->getAdapter()->quoteInto('id not in (?)', $ids);
            return $result || parent::delete($where . ' AND ' . $whereOwner);
        } else {
            if ($ownerColName == null) {
                $whereOwner = $this->getAdapter()->quoteInto('owner_id = ?', $ownerId);
            } else {
                $whereOwner = $this->getAdapter()->quoteInto($ownerColName . ' = ?', $ownerId);
            }

            return $result || parent::delete($whereOwner);
        }
    }

    public function getOwnerRecords($id, $ownerColName = null, $valueColName = null) {
        $select = $this->select();

        if ($ownerColName == null) {
            $select->where('owner_id = ?', $id);
        } else {
            $select->where($ownerColName . ' = ?', $id);
        }

        //@todo ordercolname logic
        if ($orderColName != null) {
            $select->order($orderColName);
        }

        if ($valueColName == null) {
            return $this->getAdapter()->fetchAll($select);
        } else {
            $result = $this->getAdapter()->fetchAll($select);

            foreach ($result as $key => $value) {
                $result[$key] = $value->{$valueColName};
            }

            return $result;
        }
    }

    public function getColArray($collName, $ownerColName = null, $ownerValue = null) {
        if (isset($ownerColName) && isset($ownerValue)) {
            $select = $this->select()
                    ->where($ownerColName . ' = ?', $ownerValue);

            $records = $this->fetchAll($select);
        } else {
            $records = $this->getRecords();
        }

        $result = array();
        foreach ($records as $record) {
            $result[$record->id] = $record->{$collName};
        }

        return $result;
    }

    public function getParmLang($param, $lang) {
        return $param . '_' . $lang;
    }

}