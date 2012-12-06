<?php

return array(
    'routes' => array(
        'messages' => new Zend_Controller_Router_Route(
                'messages',
                array(
                    'module' => 'messages',
                    'controller' => 'index',
                    'action' => 'index'
                )
        ),   
		'send_message' => new Zend_Controller_Router_Route(
                'message/:id',
                array(
                	'id'=>'1',
                    'module' => 'messages',
                    'controller' => 'index',
                    'action' => 'sendmessage'    
                )
        ),
		'show_actions' => new Zend_Controller_Router_Route(
                'actions',
                array(
                    'module' => 'messages',
                    'controller' => 'index',
                    'action' => 'showactions'    
                )
        ),
	'mark_as_reed' => new Zend_Controller_Router_Route(
                'markasreed',
                array(
                    'module' => 'messages',
                    'controller' => 'index',
                    'action' => 'markasreed'    
                )
        )
    ),
    'acl' => array(
        'resources' => array(
        //new Zend_Acl_Resource('content_index'),
        //new Zend_Acl_Resource('content_cms')
        ),
        'allow' => array(
        //array('moderator', 'content_cms', null),
        //array(null, 'content_index', null)
        ),
        'deny' => array()
    ),
    'cmsMenu' => array(
        /*array(
            'label' => 'Работа',
            'uri' => '#',
            'order' => 7,
            'pages' => array(
                array(
                    'label' => 'Список работы',
                    'module' => 'jobs',
                    'controller' => 'cms',
                    'action' => 'showlist',
                )
            )
        )*/
    ),
    'model' => 'Messages_Model_Messages'
);
