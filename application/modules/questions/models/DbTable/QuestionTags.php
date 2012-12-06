<?php

class Questions_Model_DbTable_QuestionTags extends Rastor_Model_DbTable_Abstract {

    protected $_name = 'question_tags';
    protected $_primary = 'id';
    protected $_sequence = true;

    public function getColArray($collName, $type = null) {        
        if ($type != null) {
            $select = $this->select()
                    ->where('type = ?', $type);
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
    
    public function getQuestionTags($id){
        $select = $this->select()
                ->from(array('qta' => 'question_tags_assoc'), array('id' => 'qt.id', 'name' => 'qt.name'))
                ->setIntegrityCheck(false)
                ->joinLeft(array('qt' => 'question_tags'), 'qt.id = qta.tag_id', null)
                ->where('qta.question_id = ?', $id);
                
        return $this->getAdapter()->fetchAll($select);
    }
    
    public function getTags($type = 0){
        $select = $this->select()
                ->where('type = ?', $type)
                ->order('name');
        
        return $this->getAdapter()->fetchAll($select);
    }
    
}