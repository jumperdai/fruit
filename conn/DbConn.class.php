<?php

class DbConn
{

    private $conn = NULL;

    private function __construct()
    {
        $dsn = "mysql:host=localhost;dbname=fruitday";
        $username = "root";
        $passwd = "root";
        $this->conn = new PDO($dsn, $username, $passwd);
        $this->conn->query("set names utf8");
    }

    private function __clone()
    {}

    public static function getInstance()
    {
        static $obj = NULL;
        if ($obj == NULL) {
            $obj = new DbConn();
        }
        return $obj;
    }

    public function queryAll($sql)
    {
        $st = $this->conn->query($sql);
        $rs = $st->fetchAll();
        return $rs;
    }

    public function queryOne($sql)
    {
        $st = $this->conn->query($sql);
        $rs = $st->fetchAll();
        if (isset($rs[0])) {
            return $rs[0];
        } else {
            return NULL;
        }
    }

    public function exec($sql)
    {
        $result = $this->conn->exec($sql);
        return $result;
    }
}