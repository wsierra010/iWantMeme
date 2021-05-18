CREATE DATABASE memedb;

USE memedb;

-- TABLE USER
-- all pasword wil be encrypted using SHA2
CREATE TABLE users (
    id INT(10) NOT NULL AUTO_INCREMENT,
    username VARCHAR(16) NOT NULL,
    password VARCHAR(60) NOT NULL,
    PRIMARY KEY (id)
);

DESCRIBE users;