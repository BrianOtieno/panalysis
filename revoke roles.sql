select * from mysql.user;

REVOKE SELECT ON openmrs.users FROM 'pomanya'@'localhost';
REVOKE SELECT ON openmrs.user_role FROM 'pomanya'@'localhost';
REVOKE SELECT ON openmrs.users FROM 'pomanya'@'%';
REVOKE SELECT ON openmrs.user_role FROM 'pomanya'@'%';