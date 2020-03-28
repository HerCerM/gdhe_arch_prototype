<?php

namespace GDHE\DAL;

use Medoo\Medoo;

class DBConnector
{
    public function connect()
    {
        return new Medoo(array(
            'database_type' => 'mysql',
            'database_name' => 'gdhe',
            'server' => 'localhost',
            'username' => 'root',
            'password' => '',
        ));
    }
}
