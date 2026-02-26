#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "데이터베이스 초기화 중..."

    mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null

    mysqld --user=mysql --skip-networking &
    pid="$!"

    sleep 2

    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '여기에_루트비밀번호';"
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS 여기에_DB이름;"
    mysql -u root -e "CREATE USER IF NOT EXISTS '여기에_유저이름'@'%' IDENTIFIED BY '여기에_유저비밀번호';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON 여기에_DB이름.* TO '여기에_유저이름'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"

    kill -s TERM "$pid"
    wait "$pid"

    echo "데이터베이스 초기화 완료!"
fi

exec mysqld_safe
