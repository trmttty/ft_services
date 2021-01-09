#! /bin/sh

mysql_install_db --user=root --datadir=/var/lib/mysql
mysqld & sleep 5
mysql -u root -e "CREATE DATABASE wordpress;"
mysql -u root wordpress < wordpress.sql
mysql -u root -e "CREATE USER 'root'@'%' IDENTIFIED BY 'password'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; USE wordpress; FLUSH PRIVILEGES;"
telegraf & tail -f /dev/null
