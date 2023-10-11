<?php

/** The name of the database for WordPress */
define('DB_NAME', '$MYSQL_DATABASE');

/** MySQL database username */
define('DB_USER', '$MYSQL_USER');

/** MySQL database password */
define('DB_PASSWORD', '$MYSQL_USER_PASSWD');

/** MySQL hostname */
define('DB_HOST', 'mariadb');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');


define('AUTH_KEY',         'YtN<h.#].8}GC:XW/R90`D`H` xc#.C2@7|-2Jg/?fJJb+Nw*W2aj-WC/6ogsc.K');
define('SECURE_AUTH_KEY',  'tuw~[iF8-m2+>{Y&1*~nkKDBFyeW])Oc0Ytj+&.[p@|c/?{s6AX]=Z]R_Rta|g q');
define('LOGGED_IN_KEY',    't$W;I6H6d(^Vn+w4ZP>n;![0d%LW_ca,9y[rLwN;)9]#H|h85Z:EALJjafoOlC3h');
define('NONCE_KEY',        '-5P*WTKBpKNDqH<m`0%y]$-iL;dnk$LB7dVfffE:tSZ(]pF5{($VJ[nABMHrI6{+');
define('AUTH_SALT',        'E~qQ$O},9=WG<V#+aQDUP:+J0rl]Nv)<PD(y`MZ+~4oQB/sF#K*[56;O]$%Ep-M?');
define('SECURE_AUTH_SALT', '[,y*J+{&NeN>bTW-e%2.&b?Z~--_Z@604y7=5`#1U8zKbfxC2k1>3B=/4y>cz]|4');
define('LOGGED_IN_SALT',   '?6${!RC3`e#~++++|4!+*%i%b)D&lKUtWi@spFvumx-MKiG-(Ex+5V>9*]*0NPz9');
define('NONCE_SALT',       '+h%:*O)h4;s>q5z{sO]:dDe];yO09g9G~VfwFl^ta/-?6$ rc&h7zw8=,y5|a]zC');

$table_prefix  = 'wp_';

define('WP_DEBUG', false);

if (!defined('ABSPATH')) {
    define('ABSPATH', __DIR__ . '/');
}

require_once ABSPATH . 'wp-settings.php';
