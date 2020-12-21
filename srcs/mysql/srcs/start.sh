#! /bin/sh

# Install MariaDB database(mariadb-install-db is a symlink to mysql_install_db).
mariadb-install-db -u root

# Invoking "mysqld" will start the MySQL server. Terminating "mysqld" will shutdown the MySQL server.
mysqld -u root & sleep 5

# Create Wordpress database.
mysql -u root --execute="CREATE DATABASE wordpress;"

# Create new user "root" with password "toor" and give permissions.
mysql -u root --execute="CREATE USER 'root'@'%' IDENTIFIED BY 'toor'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; USE wordpress; FLUSH PRIVILEGES;"

# Start Telegraf and sleep infinity for avoid container to stop.
# telegraf & sleep infinite
sleep infinite
