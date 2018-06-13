#!/bin/bash
chown -R mysql:mysql /var/lib/mysql
service mysql restart
mysql -u root -e 'ALTER USER '\'root\''@'\'localhost\'' IDENTIFIED BY '\'1234\'';' -e 'create database wordpress;' -e 'CREATE USER wordpressuser@localhost IDENTIFIED BY '\'1234\'';' -e 'GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@localhost;' -e 'FLUSH PRIVILEGES;' 
service nginx restart
service php7.0-fpm start

exec "$@";

