#! /bin/bash
set -e

verify_envs() {
	if [ -z "$MYSQL_ROOT_PASSWD" -o -z "$MYSQL_USER" -o -z "$MYSQL_USER_PASSWD" -o -z "$MYSQL_DATABASE" ]; then
		cat <<- 'EOF'
		  Can't start the mysql server without all the env variables:
		    - MYSQL_ROOT_PASSWD
		    - MYSQL_USER
		    - MYSQL_USER_PASSWD
		    - MYSQL_DATABASE
		EOF
		exit 1
	fi
}

create_database() {
	service mysql start
	echo "Temporary started the mysql server for initialization"

	mariadb -e "UPDATE mysql.user SET Password = PASSWORD('$MYSQL_ROOT_PASSWD') WHERE User = 'root';"
	echo "Changed root password"

	mariadb -e "DELETE FROM mysql.user WHERE USER = '';"
	echo "Removed the anonymous user"

	mariadb -e "DROP DATABASE IF EXISTS test;"
	echo "Removed the 'test' database"
	
	mariadb -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWD';"
	echo "Created the user '$MYSQL_USER'"

	mariadb -e "CREATE DATABASE $MYSQL_DATABASE;"
	mariadb -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWD';"
	echo "Created the '$MYSQL_DATABASE' database"

	service mysql stop
	echo "Initialization finished, temporaty server stopped"
}

main() {
	if [ ! -e "/var/lib/mysql/done" ]; then
		verify_envs
		create_database
		touch /var/lib/mysql/done
	fi
	echo "Starting the mysqld server"
	exec "$@"
}

main "$@"
