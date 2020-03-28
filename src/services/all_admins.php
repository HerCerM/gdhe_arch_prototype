<?php

use GDHE\DAL\AdminDAO;

require_once '../../vendor/autoload.php';

$admin_dao = new AdminDAO;

$admins = $admin_dao->get_all();

echo json_encode($admins);
