#! /bin/sh

# Install MariaDB database(mariadb-install-db is a symlink to mysql_install_db).
# mariadb-install-db -u root
mysql_install_db --user=root --datadir=/var/lib/mysql

# Invoking "mysqld" will start the MySQL server. Terminating "mysqld" will shutdown the MySQL server.
mysqld & sleep 5

# Create Wordpress database.
mysql -u root -e "CREATE DATABASE wordpress;"

# Create new user "root" with password "toor" and give permissions.
mysql -u root -e "CREATE USER 'root'@'%' IDENTIFIED BY 'toor'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; USE wordpress; FLUSH PRIVILEGES;"

# Start Telegraf and sleep infinity for avoid container to stop.
# telegraf & sleep infinite
tail -f /dev/null
