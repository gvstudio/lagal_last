<?php

class Questions_Model_DbTable_Question extends Rastor_Model_DbTable_Abstract {

    protected $_name = 'question';
    protected $_primary = 'id';
    protected $_sequence = true;

    protected function _getRastorTableSelect($requestParams) {
        return $this->select()
                        ->from(array('q' => $this->_name))
                        ->setIntegrityCheck(false)
                        ->joinLeft(array('m' => 'member'), 'q.member_id = m.id')
                        ->joinLeft(array('u' => 'users'), 'm.user_id = u.id', array('user_name' => 'u.name'))
                        ->group('q.id');
    }

    /**
     * Get select query for pagination.
     * 
     * @param array $options
     * @return Zend_Db_Table_Select
     */
    protected function _getPaginatorSelect($options) {
        if (isset($options['tag'])) {
            $select = $this->select()
                    ->setIntegrityCheck(false)
                    ->from(array('qta' => 'question_tags_assoc'), null)
                    ->joinLeft(array('q' => $this->_name), 'q.id = qta.question_id')
                    ->joinLeft(array('u' => 'users'), 'q.user_id = u.id', array('user_name' => 'u.name', 'user_id' => 'u.id'))
                    ->joinLeft(array('с' => 'city'), 'с.id = u.city_id', array('user_city' => 'name'))
                    ->where('enable = 1')
                    ->where('qta.tag_id = ?', $options['tag'])
                    ->order('q.date')
                    ->group('q.id');
        } else {
            $select = $this->select()
                    ->setIntegrityCheck(false)
                    ->from(array('q' => $this->_name))
                    ->joinLeft(array('u' => 'users'), 'q.user_id = u.id', array('user_name' => 'u.name', 'user_id' => 'u.id'))
                    ->joinLeft(array('с' => 'city'), 'с.id = u.city_id', array('user_city' => 'name'))
                    ->where('enable = 1')
                    ->order('q.date');
        }

        return $select;
    }

    public function getEnableRecord($id) {
        $select = $this->select()
                ->setIntegrityCheck(false)
               /* ->from(array('q' => $this->_name))
                ->joinLeft(array('m' => 'member'), 'q.member_id = m.id')
                ->joinLeft(array('u' => 'users'), 'm.user_id = u.id', array('user_name' => 'u.name', 'user_id' => 'u.id'))
                ->joinLeft(array('с' => 'city'), 'с.id = u.city_id', array('user_city' => 'name'))
                ->where('q.id = ?', $id)
                ->where('enable = 1');*/
                ->from(array('q' => $this->_name),array('title'=>'q.name','name'=>'u.name','content'=>'q.content','id'=>'u.id','date'=>'q.date','city'=>'c.name','views'=>'q.views','answers'=>'q.answers'))
				->join(array('u'=>'users'),'u.id=q.user_id',null)
				->join(array('c'=>'city'),'u.city_id=c.id',null)
				->where('q.id=?',$id);

        return $this->getAdapter()->fetchRow($select);
    }

    public function incViews($id) {
        $this->getAdapter()->query("update $this->_name set views = views + 1 WHERE id=$id");
    }
	
	public function insertQuestion($data,$personal=0)
	{
		//echo strtotime(date('His'));
		//die;
		$question = array('paid'=>$data['paid'],'price'=>$data['price'],'user_id'=>$data['user_id'],'name'=>$data['name'],'content'=>$data['content'],'enable'=>'1','date'=>strtotime(date('His')));
		
		$this->insert($question);
		
		$select = $this->select()
					->from($this, array(new Zend_Db_Expr('max(id) as maxId')))
					->where('user_id = ?',$data['user_id']);
		$id =  $this->fetchRow($select);
				
		$count=count($data['tags']);
		if($count>0)
		{
			$insertData = 'INSERT INTO `question_tags_assoc` values(null,'.$id->maxId.','.$data['tags'][0].')';
			
			for($i=1;$i<$count;$i++)
			{				
				$insertData=$insertData.",(null,".$id->maxId.",".$data['tags'][$i].")";
			}			
			$this->getAdapter()->query($insertData);
			
		}
		if($personal>0){
			$questionJuristModel = new Questions_Model_DbTable_QuestionJuristAssoc();
			$lawyer=$data['lawyers'];
			$questionJuristModel->insertQuestionJurist($lawyer,$id->maxId);
		}
		else{
			$insertData = 'INSERT INTO `question_answers` values(\'\',\'\',2,'.$id->maxId.',\''.date('his').'\',1,2,1)';
			$this->getAdapter()->query($insertData);
		}
		
	}
	
	public function selectByNameContent($name,$content){
		$select = $this->select()
				->from($this->_name,array('id'))
				->where('name = ?',$name)
				->where('content = ?',$content);
		return $this->getAdapter()->fetchRow($select);
	}
	
	public function getQuestion(){
		/*$select = $this->select()
						->where('paid NOT IN ?',1)
						->where('answers NOT IN ?',0)
						->order(array('id DESC'));*/
		$select = "SELECT q.id id, q.name name, q.content content,q.date date, q.answers answers, q.views views, u.name user_name, u.id user_id, c.name user_city  FROM ".$this->_name." q INNER JOIN  users u ON q.user_id=u.id INNER JOIN city c ON u.city_id = c.id WHERE NOT(`paid` =1 AND  `answers` =0) ORDER BY id DESC";
		return $this->getAdapter()->query($select);
	}
	public function getQuestionPaidWithoutAnswer(){
		$select = $this->select()
						->setIntegrityCheck(false)
						->from(array('q'=>$this->_name),array('id'=>'q.id','name'=>'q.name', 'content'=>'q.content','date'=> 'q.date' , 'answers'=>'q.answers', 'views'=>'q.views','user_name'=>'u.name','user_id'=>'u.id' ,'user_city'=>'c.name' ),null)
						->join(array('u'=> 'users'), 'q.user_id=u.id',null)
						->join(array('c'=> 'city'), 'u.city_id = c.id',null)
						->where('paid = ?',1)
						->where('answers = ?',0)
						->order(array('id DESC'));
		return $this->getAdapter()->fetchAll($select);
	}

}
