UPDATE mysql.user SET Password=PASSWORD('2030@ehts') WHERE User='root';
FLUSH PRIVILEGES;