<?php

class Users_ProfileController extends Rastor_Controller_Action {

    public function editAction() {
	if (!$this->_getAuth()->hasIdentity()) {
	    throw new Exception('Only for registered users!');
	}

	$this->view->auth = $this->_getAuth();

	$this->_helper->layout->setLayout('profile');
	$user = new Zend_Session_Namespace('Zend_Auth');

	$changePasswordForm = new Users_Form_ChangePassword();
	$personalInfoForm = new Users_Form_PersonalInfo();
	$companyInfoForm = new Users_Form_CompanyInfo();
	//обработчик говнопоста компании. 
	if ($this->getRequest()->isPost() && $user->storage->role == 'company') {
	    $form_company = $_POST;
	    $company_db = new Users_Model_DbTable_Company();

	    $update_array_company = array(
		'name' => $form_company['company_name'],
		'info' => $form_company['info'],
		'delegate_name' => $form_company['name'],
		'delegate_sex' => $form_company['sex'],
		'delegate_phone' => $form_company['phone'],
		'delegate_email' => $form_company['email'],
		    //'logotip'=>$logotip
	    );
	    //бля пиздец кто такой умный только при логине пихает в сессию инфу про компанию
	    //прийдется так..
	    $id_company = $company_db->getCompanyInfo($user->storage->id)->id;
	    $company_db->update($update_array_company, $id_company);
	    //перезапись сессии
	    if ($user->storage->role == 'company') {
		$companyModel = new Users_Model_DbTable_Company();
		$user->storage->company = $companyModel->getCompanyInfo($user->storage->id);
	    }
	}

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
			//Zend_Debug::dump($formData['photo']);die;
		    }
		}
		//гг
		$company_db = new Users_Model_DbTable_Company();
		$id_company = $company_db->getCompanyInfo($user->storage->id)->id;
		if ($usersDb->update($formData, $userData->id)) {
		    $data = $usersDb->getRecord($userData->id);
		    $company_db->update(array('logotip' => $formData['photo']), $id_company);
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
	$this->view->companyInfoForm = $companyInfoForm;
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

    public function viewprofileAction() {
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
		$user = $userModel->getFullInfLawyer($id);
		$service = $services->getServicesById($id);

		break;

	    default:

		break;
	}
	$this->view->user = $user;
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
		if ($juristDb->update($formData, $userData->id)) {

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

    public function workersAction() {
	$this->_helper->layout->setLayout('profile');
	$user_session = new Zend_Session_Namespace('Zend_Auth');
	$workersmodel = new Users_Model_DbTable_Companyworkers();
	$workers = $workersmodel->getWorkers($user_session->storage->company->id);
	$this->view->lawyers = $workers;
	//Zend_Debug::dump($workers);die;
	
	if ($this->getRequest()->isPost()) {
	    $data = $this->getRequest()->getPost();
	    //отправка на почту. получаем данные с поста 
	    if (!empty($data['name']) && !empty($data['second_name']) && !empty($data['email'])) {
		$mail = new Zend_Mail();
		foreach ($data['email'] as $key => $to) { //каждому емейлу
		    //урл письма нада будет править но вся суть будет в том что мы положим туда гет запрос и бум потом ловить в 
		    //контроллере регистрации юриста
		    if ($to != '') {
			$mail->setBodyHtml('<h1>Приглашение в компанию</h1><br/>' .
				$data['name'][$key] . $data['second_name'][$key] . ', здравствуйте!<br/>
		Вас прикласили в компанию<br/>
		Пройдите по ссылке: <a href="registration/jurist?id=' . $user_session->storage->company->id . '">ссылка</a>  
		Пожалуйста, ожидайте!');
		    //$mail->setFrom($email, $name);
			$mail->addTo($to, $to);
			$mail->setSubject('Инвайт');
			//$mail->send();
		    }
		}
	    }
	    //инвайт с письма не тестил проверял на ссылке с локала http://legalmag.com/registration/jurist?id=3
	    //где id равен идишнику компании. Инвайт прошел, данные записались 
	    
	    //теперь инвайт сылки юзера 
	    //так и не понял зачем там мыло указывать если есть сcылка... но шо ж паделать
	    if (!empty($data['email_exist']) && !empty($data['id'])) {
		$usersModel = new Users_Model_DbTable_Users();
		foreach ($data['email_exist'] as $key => $value) {
		    if ($value != '') {
			$user = $usersModel->getUserByEmail($value);
			preg_match_all('/(?<=user\/)(\d){1,}/', $data['id'][$key], $matches);
			if ($user->id == $matches[0][0]) {
			    $jurist_info = new Users_Model_DbTable_Jurist();
			    $info = $jurist_info->getUserInfo($user->id);
			    $workersmodel->insert(array('jurist_id' => $info->id, 'company_id' => $user_session->storage->company->id));
			}
		    }
		}
	    }
	}
    }
    public function commercialAction(){
	$this->_helper->layout->setLayout('profile');
    }
    
    public function commercialviewsAction(){
	$this->_helper->layout->setLayout('profile');
    }

}

