<?php

namespace GDHE\Model;

class Admin
{
    public $admin_id;
    public $name;
    public $first_last_name;
    public $second_last_name;
    public $password;

    public function __construct($name, $first_last_name, $second_last_name, $password)
    {
        $this->name = $name;
        $this->first_last_name = $first_last_name;
        $this->second_last_name = $second_last_name;
        $this->password = $password;
    }

    public function set_admin_id($admin_id)
    {
        $this->admin_id = $admin_id;
    }

    public function __toString()
    {
        return json_encode($this);
    }
}
