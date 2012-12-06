<?php

class Users_ProfileController extends Rastor_Controller_Action {

    public function editAction() {
        if (!$this->_getAuth()->hasIdentity()) {
            throw new Exception('Only for registered users!');
        }
        
        $this->view->auth = $this->_getAuth();
        
        $this->_helper->layout->setLayout('profile');

        $changePasswordForm = new Users_Form_ChangePassword();
        $personalInfoForm = new Users_Form_PersonalInfo();


        if ($this->getRequest()->isPost() && isset($_POST['password'])) {
            if ($changePasswordForm->isValid($_POST)) {
                $formData = $changePasswordForm->getValues();
                $formData['password'] = md5($formData['new_password']);
                unset($formData['confirm_password']);
                unset($formData['new_password']);

                $usersDb = new Core_Model_DbTable_Users();
                $userData = $this->_getAuth()->getIdentity();

                if ($usersDb->update($formData, $userData->id)) {
                    $this->view->passwordChange = 'Пароль успешно изменен!';
                } else {
                    $this->view->passwordChange = 'Пароль не изменен!';
                }
            }
        }

        if ($this->getRequest()->isPost() && isset($_POST['name'])) {
            if ($personalInfoForm->isValid($_POST)) {
                $formData = $personalInfoForm->getValues();

                unset($formData['photo']);

                $usersDb = new Core_Model_DbTable_Users();
                $userData = $this->_getAuth()->getIdentity();

                if ($_FILES['photo']['size']) {
                    $config = Zend_Registry::get('config');

                    $ext = strtolower(pathinfo($_FILES['photo']['name'], PATHINFO_EXTENSION));
                    $baseName = substr(md5(uniqid(rand(), 1)), 0, 16) . '.' . $ext;

                    while (file_exists($config->rastor->pictures->uploadPath . $baseName)) {
                        $baseName = substr(md5(uniqid(rand(), 1)), 0, 16) . '.' . $ext;
                    }

                    $savePath = $config->rastor->pictures->uploadPath . $baseName;

                    if (move_uploaded_file($_FILES['photo']['tmp_name'], $savePath)) {
                        $imageProcessor = new Core_Model_ImageProcessor($savePath);
                        $imageProcessor->resizeToMax(150, 150);
                        $imageProcessor->save();

                        $formData['photo'] = $config->rastor->pictures->path . $baseName;
                        if (strlen($userData->photo)) {
                            unlink($config->rastor->pictures->uploadPath . pathinfo($userData->photo, PATHINFO_BASENAME));
                        }
                    }
                }

                if ($usersDb->update($formData, $userData->id)) {
                    $data = $usersDb->getRecord($userData->id);

                    if ($userData->role == 'jurist') {
                        $juristModel = new Users_Model_DbTable_Jurist();
                        $data->jurist = $juristModel->getUserInfo($data->id);
                    }

                    $this->_getAuth()->setIdentity($data);

                    $this->view->passwordChange = 'Линая информация успешно изменена!';
                } else {
                    $this->view->passwordChange = 'Линая информация не изменена!';
                }
            }
        }

        $this->view->changePasswordForm = $changePasswordForm;
        $this->view->personalInfoForm = $personalInfoForm;
    }

    public function educationAction() {
        if ($this->_getAuth()->getIdentity()->role != 'jurist') {
            throw new Exception('Only for jurists!');
        }

        $this->_helper->layout->setLayout('profile');

        $form = new Users_Form_Education();

        if ($this->getRequest()->isPost()) {
            if ($form->isValid($_POST)) {
                $formData = $form->getValues();

                $specializations = $formData['specialization'];

                unset($formData['jurist_company']);
                unset($formData['specialization']);

                $juristDb = new Users_Model_DbTable_Jurist();
                $juristSpecializationDb = new Users_Model_DbTable_JuristSpecialization();
                $userData = $this->_getAuth()->getIdentity();

                $formData['id'] = $userData->jurist->id;

                if ($juristDb->update($formData, $userData->jurist->id) | $juristSpecializationDb->updateList($specializations, $userData->jurist->id, 'jurist_id', 'specialization_id')) {

                    $userData->jurist = (object) $formData;
                    $this->_getAuth()->setIdentity($userData);

                    $this->view->passwordChange = 'Линая информация успешно изменена!';
                } else {
                    $this->view->passwordChange = 'Линая информация не изменена!';
                }
            }
        }

        $this->view->form = $form;
    }

	public function viewprofileAction(){
		$userModel = new Users_Model_DbTable_Users();
		$id = $this->_getParam('id');
		$user = $userModel->getUserById($id);
		$this->view->role = $user->role;
		switch ($user->role) {
			case 'member': echo 'member';
				
				break;
			
			case 'company': echo 'company';
				
				break;
				
			case 'jurist': $services = new Users_Model_DbTable_JuristServices();
							$user=$userModel->getFullInfLawyer($id);
							$service = $services->getServicesById($id);
						  
				break;
			
			default:
				
				break;
		}		
		$this->view->user=$user;	
		$this->view->services = $service;	
		
	}
	
    public function contactsAction() {
        $this->_helper->layout->setLayout('profile');

        $form = new Users_Form_Contacts();

        if ($this->getRequest()->isPost()) {
            if ($form->isValid($_POST)) {
                $formData = $form->getValues();
				//Zend_Debug::dump($formData);
                $specializations = $formData['specialization'];
				//Zend_Debug::dump($specializations);die;
                unset($formData['jurist_company']);
                unset($formData['specialization']);

                $juristDb = new Users_Model_DbTable_Users();
                $juristSpecializationDb = new Users_Model_DbTable_JuristSpecialization();
				//$auth = Rastor_Auth::getInstance();
       			//$userData = $auth->getIdentity();
                $userData = $this->_getAuth()->getIdentity();

                $formData['id'] = $userData->id;
				//Zend_Debug::dump($userData->id);die;
				//end_Debug::dump($formData);die;
                if ($juristDb->update($formData, $userData->id) ) {
					
                    $userData->jurist = (object) $formData;
                    $this->_getAuth()->setIdentity($userData);

                    $this->view->passwordChange = 'Линая информация успешно изменена!';
                } else {
                	
                    $this->view->passwordChange = 'Линая информация не изменена!';
                }
            }
        }

        $this->view->auth = $this->_getAuth();
        $this->view->form = $form;
    }
    
    public function leftmenuAction() {
        $this->view->auth = $this->_getAuth();
    }

}

