#!/bin/sh

if [ ! -d "/home/${MYSQL_USER}" ]; then
    adduser -D ${MYSQL_USER}
    echo "${MYSQL_USER}:${MYSQL_PASSWORD}" | chpasswd
    mkdir -p /var/www
    chown -R ${MYSQL_USER}:${MYSQL_USER} /var/www
fi

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf