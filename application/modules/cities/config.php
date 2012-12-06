<?php

return array(
    'routes' => array(
        
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
        array(
            'label' => 'Города',
            'uri' => '#',
            'order' => 10,
            'pages' => array(
                array(
                    'label' => 'Список городов',
                    'module' => 'cities',
                    'controller' => 'cms',
                    'action' => 'showlist',
                ),
                array(
                    'label' => 'Добавить город',
                    'module' => 'cities',
                    'controller' => 'cms',
                    'action' => 'add',
                )
            )
        )
    ),
    'model' => 'Content_Model_Content'
);
