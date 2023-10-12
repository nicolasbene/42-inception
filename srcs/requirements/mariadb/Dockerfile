# Version: 1.0
FROM debian:buster

# Modifiez la source des paquets pour utiliser un miroir Debian différent
RUN echo "deb http://deb.debian.org/debian/ buster main" > /etc/apt/sources.list
RUN echo "deb-src http://deb.debian.org/debian/ buster main" >> /etc/apt/sources.list
RUN echo "deb http://deb.debian.org/debian/ buster-updates main" >> /etc/apt/sources.list
RUN echo "deb-src http://deb.debian.org/debian/ buster-updates main" >> /etc/apt/sources.list
RUN echo "deb http://security.debian.org/ buster/updates main" >> /etc/apt/sources.list
RUN echo "deb-src http://security.debian.org/ buster/updates main" >> /etc/apt/sources.list

RUN apt update && apt upgrade -y
RUN apt install mariadb-server mariadb-client -y

ARG MYSQL_ROOT_PASSWD
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWD

RUN service mysql start; \
    mariadb -e "UPDATE mysql.user SET Password = PASSWORD('$MYSQL_ROOT_PASSWD') WHERE User = 'root';"; \
    mariadb -e "DELETE FROM mysql.user WHERE USER = '';"; \
    mariadb -e "DROP DATABASE IF EXISTS test;"; \
    mariadb -e "CREATE DATABASE $MYSQL_DATABASE;"; \
    mariadb -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWD';"; \
    mariadb -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWD'"; \
    mariadb -e "FLUSH PRIVILEGES;"

COPY ./docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

RUN sed -ie 's/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mysqld"]
