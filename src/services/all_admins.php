<?php

use GDHE\DAL\AdminDAO;

require_once '../../vendor/autoload.php';

$admin_dao = new AdminDAO;

$admins = $admin_dao->get_all();
foreach ($admins as $admin)
    echo '<br>' . (string) $admin;
