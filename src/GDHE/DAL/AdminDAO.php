<?php

namespace GDHE\DAL;

use GDHE\Model\Admin;

class AdminDAO extends DAO
{
    public function get_all()
    {
        $fetched_admins = $this->db_connection->select('admin', '*');

        $obj_admins = array();
        foreach ($fetched_admins as $admin) {
            $obj_admin = new Admin(
                $admin['name'],
                $admin['first_last_name'],
                $admin['second_last_name'],
                $admin['password']
            );
            $obj_admin->set_admin_id($admin['admin_id']);
            $obj_admins[] = $obj_admin;
        }

        return $obj_admins;
    }
}
