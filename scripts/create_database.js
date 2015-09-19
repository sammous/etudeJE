

var mysql = require('mysql');
var dbconfig = require('../config/database');

var connection = mysql.createConnection(dbconfig.connection);

connection.query('CREATE DATABASE IF NOT EXISTS ' + dbconfig.database);

connection.query('\
CREATE TABLE  IF NOT EXISTS`' + dbconfig.database + '`.`' + dbconfig.users_table + '` ( \
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT, \
    `username` VARCHAR(20) NOT NULL, \
    `password` CHAR(60) NOT NULL, \
    `attribut` CHAR(60) DEFAULT "utilisateur", \
    `agence` CHAR(60), \
        PRIMARY KEY (`id`), \
    UNIQUE INDEX `id_UNIQUE` (`id` ASC), \
    UNIQUE INDEX `username_UNIQUE` (`username` ASC) \
)');

connection.query('USE mydb;');
connection.query('INSERT INTO users VALUES(1,"admin","admin","admnistrateur","")');

console.log('Success: Database Created!')

connection.end();
