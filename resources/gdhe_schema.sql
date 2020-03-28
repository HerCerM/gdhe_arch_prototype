CREATE DATABASE IF NOT EXISTS gdhe;
USE gdhe;

CREATE TABLE admin(
    admin_id INTEGER(4) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(90) NOT NULL,
    first_last_name VARCHAR(30) NOT NULL,
    second_last_name VARCHAR(30) NOT NULL,
    password VARCHAR(50) NOT NULL
);
