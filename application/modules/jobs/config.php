<?php

return array(
    'routes' => array(
        'jobs' => new Zend_Controller_Router_Route(
                'jobs',
                array(
                    'module' => 'jobs',
                    'controller' => 'index',
                    'action' => 'index'
                )
        ),
        'jobs_view' => new Zend_Controller_Router_Route(
                'job/:id',
                array(
                    'module' => 'jobs',
                    'controller' => 'index',
                    'action' => 'view'
                )
        ),
        'jobs_specialization' => new Zend_Controller_Router_Route(
                'jobsbyspecialization/:specialization/:page',
                array(
                    'module' => 'jobs',
                    'controller' => 'index',
                    'action' => 'jobsspecialization',
                    'page' => 1
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
        array(
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
        )
    ),
   // 'model' => 'Content_Model_Content'
);
