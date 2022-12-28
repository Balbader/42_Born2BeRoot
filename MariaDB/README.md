# MariaDB

## Important points

- Data is the most important part of any type of application.
- The necessary data for the application is required to store permanently.
- The database server is used to store the application data permanently.
- MariaDB is one of the popular database servers that is called the branch of a MySQL server.

## Installation

1. Install MariaDB:<br>`sudo apt install mariadb-server -y`
2. Improve the security of your MariaDB installation:<br>`sudo mysql_secure_installation`
3. Start MariaDB:<br>`sudo mariadb`

## Creating a user

1. Create a User:<br>`CREATE USER 'user-name'@'localhost' IDENTIFIED BY 'password';`
2. Check User was successfully created:<br>`SELECT User FROM mysql.user;`

## Creating a database

1. Create a DataBase:<br>`CREATE DATABASE <db-name>;`
2. Check DB was created successfully:<br>`SHOW DATABASES;`

## Granting full privileges on DB to User

1. Granting full privileges:<br>`GRANT ALL ON db_name.* TO 'user_name'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;`
2. Refresh the privileges once new ones have been awarded:<br>`FLUSH PRIVILEGES;`
3. Verify the new user has the right permissions:<br>`SHOW GRANTS FOR 'user_name'@'localhost';`

## Remove MariaDB User Account

1. Remove User:<br>`DROP USER 'user_name'@'localhost';`

## Delete MariaDB

1. Stop the system from running:<br>`sudo systemctl stop mysql`
2. Remove all instances of `mysql` from system:<br>`sudo apt-get remove --purge mysql-server mysql-client mysql-common`
3. Check that MariaDB was removed:<br>`dpkg -l | grep mariadb-server`

