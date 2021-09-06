SELECT * from openmrs.user_role
WHERE role = "System Administrator" OR role ="System Developer";

use openmrs;
LOCK TABLE user_role READ;

UNLOCK TABLES;

select * from openmrs.users
where user_id = 96;

select * from openmrs.location;
