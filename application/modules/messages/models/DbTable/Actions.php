<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Actions
 *
 * @author Design
 */
class Messages_Model_DbTable_Actions extends Rastor_Model_DbTable_Abstract {

    protected $_name = 'actions';

    public function getUserMessagesById($id) {
	$select = $this->select()
		->setIntegrityCheck(false)
		->from(array('m' => $this->_name))
		->where('m.to_id = ?', $id);
	return $this->getAdapter()->fetchAll($select);
    }
    	public function addSystemMessages(array $data){
	    foreach ($data as $rows){
		$inser_array = array(
		    'flag_reed'=>'0',
		    'to_id' => $rows->user_id,
		    'text'=>'Новый ответ в теме <a href="http://legalmag.com/question/'.$rows->question_id .'">Перейти по ссылке</a>',
		    'title' => 'Новый ответ',
		    'date' =>time()
		);
		$this->insert($inser_array);
	    }
	    
	}

}

