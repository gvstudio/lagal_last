<?php

class Questions_Model_DbTable_QuestionAnswers extends Rastor_Model_DbTable_Abstract {

    protected $_name = 'question_answers';
    protected $_primary = 'id';
    //protected $_sequence = true;
    
   /* public function getNormalAnswer($id)
	{
		$select = $this->select()
					   ->setIntegrityCheck(false)
					   ->from(array('qa'=>$this->_name))
					   ->join(array('q'=>question),'q.id =  qa.question_id',null)
					   ->where('qa.question_id = ?',$id);
					   $answer = $this->getAdapter()->fetchAll($select); 
		$result = array();
		$count = count($answer);
		for($i=0;$i<$count;$i++)
		{
			if( $answer[$i]->comments_id==0)
				$result[] =  $answer[$i];
			else{
				$resCount = count($result);
				for($j=0;$j<$resCount;$j++)
				{
					//Zend_Debug::dump($result[$j]->id);
					if($result[$j]->id==$answer[$i]->comments_id)
					{
						//Zend_Debug::dump($result[$j]->id);
						$result[$j]->sub[]=$answer[$i];
					}
				}
			}
		}
		
		//Zend_Debug::dump($answer);
		return $result;
	}*/
	 public function getNormalAnswer($id)
	{
		$select = $this->select()
					   ->setIntegrityCheck(false)
					   ->from(array('qa'=>$this->_name),array('uname'=>'u.name','photo'=>'u.photo','uid'=>'u.id','level','comment','right_key','date'))
					   ->join(array('q'=>'question'),'q.id =  qa.question_id',null)
					   ->join(array('u'=>'users'),'u.id=qa.user_id',null)
					   ->where('qa.question_id = ?',$id)
					   ->order('qa.left_key');
		return $answer = $this->getAdapter()->fetchAll($select); 
					  //Zend_Debug::dump($select); die;
	}
	
	public function addNewAnswer($data){
		//die;
		//Zend_Debug::dump($data); die;
		$query = "UPDATE `question_answers` SET right_key = right_key + 2, left_key = IF(left_key >".$data['right_key'].", left_key + 2, left_key) WHERE right_key >=".$data['right_key'];
		$this->getAdapter()->query($query);
		$left = $data['right_key']+1;
		$data['level'] = $data['level']+1;
		$query = "INSERT INTO `question_answers` VALUES('','".$data['answerQuestion']."','".$data['uid']."','".$data['qid']."','".strtotime(date('His'))."','".$data['level']."','".$left."','".$data['right_key']."')";
		$this->getAdapter()->query($query);
		$this->getAdapter()->query("update question set answers = answers + 1 WHERE id=".$data['qid']);
		//Zend_Debug::dump($query);die;
		//$this->getAdapter()->query('');
	}
	
	public function getSpecializationById($id){
		$select = $this->select()
					   ->setIntegrityCheck(false)					   
					   ->from(array('u'=>$this->_name), array('spec'=>'sp.name'))
					   ->join(array('j'=>'jurist'),'u.id =  j.user_id',null)
					   ->join(array('js'=>'jurist_specialization'),'j.id =  js.jurist_id',null)
					   ->join(array('sp'=>'specialization'),'js.specialization_id =  sp.id',null)
					   ->where('u.id = ?',$id);
		return $this->getAdapter()->fetchAll($select); 
	}

}