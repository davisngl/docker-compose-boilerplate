-- create the databases
CREATE DATABASE IF NOT EXISTS laravel;

-- create the users for each database
CREATE USER 'davis'@'%' IDENTIFIED BY 'Derived49!';
GRANT CREATE, ALTER, INDEX, LOCK TABLES, REFERENCES, UPDATE, DELETE, DROP, SELECT, INSERT ON `laravel`.* TO 'davis'@'%';

FLUSH PRIVILEGES;