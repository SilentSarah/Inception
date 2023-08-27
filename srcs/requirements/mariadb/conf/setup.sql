-- Remove anonymous users
DELETE FROM mysql.user WHERE User='';

-- Allowing remote connections 
CREATE USER '${WP_USER}'@'%' IDENTIFIED BY '${WP_PASS}';
GRANT ALL PRIVILEGES ON *.* TO '${WP_USER}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- Remove the test database
DROP DATABASE IF EXISTS test;

-- Reload privilege tables
FLUSH PRIVILEGES;
