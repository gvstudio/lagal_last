<?php

class Questions_Model_DbTable_QuestionJuristAssoc extends Rastor_Model_DbTable_Abstract {

    protected $_name = 'question_jurist_assoc';
    protected $_primary = 'id';
    protected $_sequence = true;

 	public function insertQuestionJurist($data,$question_id){
 		$count = count($data);	
 		if($count>0){
 			$insertData = 'INSERT INTO `question_jurist_assoc` values(null,'.$data[0].','.$question_id.',1,1)';
 			for($i=0;$i<$count;$i++){
 				$insertData=$insertData.",(null,".$data[$i].",".$question_id.",1,1)";
 			}			
			
			$this->getAdapter()->query($insertData);
 		}
 	}

}