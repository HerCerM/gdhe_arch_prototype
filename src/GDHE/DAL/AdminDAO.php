<?php

namespace GDHE\DAL;

use GDHE\Model\Admin;

class AdminDAO extends DAO
{
    public function get_all()
    {
        $fetched_admins = $this->db_connection->select('admin', '*');

        $obj_admins = array();
        foreach ($fetched_admins as $admin)
            $obj_admins[] = new Admin(
                $admin['name'],
                $admin['first_last_name'],
                $admin['second_last_name'],
                $admin['password']
            );

        return $obj_admins;
    }
}
