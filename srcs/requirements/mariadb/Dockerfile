FROM alpine:3.22

ARG MYSQL_DATABASE \
    MYSQL_USER \
    MYSQL_PASSWORD \
    MYSQL_ROOT_PASSWORD

RUN apk update && apk add --no-cache mariadb mariadb-client

RUN mkdir -p /var/run/mysqld; \
    chmod 777 /var/run/mysqld; \
    { echo '[mysqld]'; \
      echo 'skip-host-cache'; \
      echo 'skip-name-resolve'; \
      echo 'bind-address=0.0.0.0'; \
    } | tee  /etc/my.cnf.d/docker.cnf; \
    sed -i "s|skip-networking|skip-networking=0|g" \
      /etc/my.cnf.d/mariadb-server.cnf

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY tools/create_db.sh .
RUN sh create_db.sh && rm create_db.sh

USER mysql
CMD ["/usr/bin/mysqld", "--skip-log-error"]