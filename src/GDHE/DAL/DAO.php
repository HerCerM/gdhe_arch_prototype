<?php

namespace GDHE\DAL;

abstract class DAO
{
    protected $db_connection;

    public function __construct()
    {
        $db_connection = new DBConnector;
        $this->db_connection = $db_connection->connect();
    }

    abstract public function get_all();
}
