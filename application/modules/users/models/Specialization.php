<?php

class Users_Model_Specialization extends Rastor_Model_TableAbstract {

    protected $_dbTableClassName = 'Users_Model_DbTable_Specialization';

    protected function _getViewUrl($record) {
        return Rastor_Url::get('content', array('uri' => $record->uri));
    }

    protected function _getEditUrl($record) {
        return Rastor_Url::get('admin', array('module' => 'users', 'controller' => 'cmsspecialization', 'action' => 'edit', 'id' => $record->id));
    }
    
    public function getJobSpecializationsLinksList($id){
        $records = $this->getDbTable()->getJobSpecialization($id);

        $tags = array();
        foreach($records as $record) {
            $tags[] = '<a href="'.Rastor_Url::get('jobs_specialization', array('specialization' => $record->id)).'">'.$record->name.'</a>';
        }
        
        return $tags;
    }
    
}
