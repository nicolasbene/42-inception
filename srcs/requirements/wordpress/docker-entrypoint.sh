#! /bin/bash

sed -ie "s/\$WORDPRESS_USER/$WORDPRESS_USER/g" /var/www/html/wordpress/wp-config.php
sed -ie "s/\$WORDPRESS_PASSWD/$WORDPRESS_PASSWD/g" /var/www/html/wordpress/wp-config.php
sed -ie "s/\$WORDPRESS_DATABASE/$WORDPRESS_DATABASE/g" /var/www/html/wordpress/wp-config.php

wp core install --path='/var/www/html/wordpress' --url='localhost' \
  --title="Nicolas's Blog" --admin_user='nicolas' --admin_password='nicolas' \
  --admin_email='nibenoit@student.42.fr' --allow-root

exec $@
