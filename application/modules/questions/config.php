<?php

return array(
    'routes' => array(
	'sign' => new Zend_Controller_Router_Route(
		'sign',
		array(
		    'module' => 'questions',
		    'controller' => 'index',
		    'action' => 'sign',
		)
	),
	'question_view' => new Zend_Controller_Router_Route(
		'question/:id',
		array(
		    'module' => 'questions',
		    'controller' => 'index',
		    'action' => 'view'
		)
	),
	'question_tag' => new Zend_Controller_Router_Route(
		'questionstag/:tag/:page',
		array(
		    'module' => 'questions',
		    'controller' => 'index',
		    'action' => 'questiontag',
		    'page' => 1
		)
	),
	'question_add' => new Zend_Controller_Router_Route(
		'questions/add',
		array(
		    'module' => 'questions',
		    'controller' => 'index',
		    'action' => 'add'
		)
	),
	'question_edit' => new Zend_Controller_Router_Route(
		'question/edit',
		array(
		    'module' => 'questions',
		    'controller' => 'index',
		    'action' => 'edit'
		)
	),
	'question_publish' => new Zend_Controller_Router_Route(
		'question/publish',
		array(
		    'module' => 'questions',
		    'controller' => 'index',
		    'action' => 'publish'
		)
	),
	'question_personal_add' => new Zend_Controller_Router_Route(
		'question/addpersonal',
		array(
		    'module' => 'questions',
		    'controller' => 'index',
		    'action' => 'addpersonal'
		)
	),
	'question_previewpersonal' => new Zend_Controller_Router_Route(
		'question/previewpersonal',
		array(
		    'module' => 'questions',
		    'controller' => 'index',
		    'action' => 'previewpersonal'
		)
	),
	'question_lawyerlist' => new Zend_Controller_Router_Route(
		'question/lawyerlist',
		array(
		    'module' => 'questions',
		    'controller' => 'index',
		    'action' => 'lawyerlist'
		)
	),
	'question_personalsave' => new Zend_Controller_Router_Route(
		'question/personalsave',
		array(
		    'module' => 'questions',
		    'controller' => 'index',
		    'action' => 'personalsave'
		)
	),
	'question_personaledit' => new Zend_Controller_Router_Route(
		'question/editpersonal',
		array(
		    'module' => 'questions',
		    'controller' => 'index',
		    'action' => 'editpersonal'
		)
	),
	'question_greeting_message' => new Zend_Controller_Router_Route(
		'question/greeting',
		array(
		    'module' => 'questions',
		    'controller' => 'index',
		    'action' => 'greeting'
		)
	),
	'question_addcomment' => new Zend_Controller_Router_Route(
		'addcomment/:id',
		array(
		    'module' => 'questions',
		    'controller' => 'index',
		    'action' => 'addcomment'
		)
	),
	'question_preview' => new Zend_Controller_Router_Route(
		'question/preview',
		array(
		    'module' => 'questions',
		    'controller' => 'index',
		    'action' => 'preview'
		)
	)
    ),
    'acl' => array(
	'resources' => array(
	    new Zend_Acl_Resource('content_index1'),
	    new Zend_Acl_Resource('content_cms')
	),
	'allow' => array(
	    array('moderator', 'content_cms', null)
	//array(null, 'content_index', null)
	),
	'deny' => array(
	)
    ),
    'cmsMenu' => array(
	array(
	    'label' => 'Вопросы',
	    'uri' => '#',
	    'order' => 7,
	    'pages' => array(
		array(
		    'label' => 'Список вопросов',
		    'module' => 'questions',
		    'controller' => 'cms',
		    'action' => 'showlist',
		),
		array(
		    'label' => 'Список тегов вопросов',
		    'module' => 'questions',
		    'controller' => 'cmsquestiontags',
		    'action' => 'showlist',
		),
		array(
		    'label' => 'Добавить услугу для компании',
		    'module' => 'users',
		    'controller' => 'cmsuserservices',
		    'action' => 'add',
		)
	    )
	)
    ),
    'model' => 'Content_Model_Content'
);