#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "데이터베이스 초기화 중..."

    mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null

    mysqld --user=mysql --skip-networking &
    pid="$!"

    sleep 2

    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
    mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"

    kill -s TERM "$pid"
    wait "$pid"

    echo "데이터베이스 초기화 완료!"
fi

exec mysqld_safe
