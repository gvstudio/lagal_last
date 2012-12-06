<?php

/**
 * Description of TopicRelations
 *
 * @author Voronoy
 */
class Questions_Model_DbTable_TopicRelations extends Rastor_Model_DbTable_Abstract {

    protected $_name = 'topic_relations';

    //protected $_primary = 'id';

    public function checkRelations($id_user, $id_topic) {
	$select = $this->select()
		->from($this->_name)
		->where('user_id = ?', $id_user)
		->where('question_id = ?', $id_topic);
	$result = $this->select()->getAdapter()->query($select);
	if($result->user_id == $id_user && $result->question_id == $id_topic ){
	    return false;
	}else{
	    return true;
	}
    }

}

?>
