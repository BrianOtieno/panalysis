SELECT 
i.identifier as "Identifier",r.client_id AS "Client ID",
UPPER(CONCAT_WS(" ", r.given_name, r.middle_name, r.family_name)) as "Client Name",
-- r.given_name AS "First Name", r.middle_name AS "Middle Name", 
r.phone_number as "Client's Phone Number",
p.visit_date as "Visit Date", max(p.appointment_date) AS "Appointment Date",
DATEDIFF(CURDATE(), max(p.appointment_date + INTERVAL 7 DAY)) as Days,
CONCAT_WS(" ", DATEDIFF(CURDATE(), max(p.appointment_date + INTERVAL 7 DAY)), 
   "day(s) left to miss appointment after 7 day grace window") Intepratation,
e.creator as "Provider ID", x.username as "Initiated By [Username]",
CONCAT_WS(" ", n.given_name, n.middle_name, n.family_name) AS "Initiated By [Provider Name]"
FROM 
kenyaemr_etl.etl_client_registration r
JOIN 
kenyaemr_etl.etl_prep_followup p
ON
p.patient_id = r.client_id
JOIN openmrs.patient_identifier i 
ON i.patient_id = p.patient_id
JOIN openmrs.encounter e
ON e.patient_id = p.patient_id
JOIN (SELECT user_id, username, person_id
        FROM openmrs.users) x ON e.creator = x.user_id
JOIN openmrs.person_name n
ON n.person_id = x.person_id
WHERE 
(p.appointment_date + INTERVAL 7 DAY) <= NOW()
-- AND 
-- i.identifier_type = 4
-- AND -- you can adjust date by changing number of days here < or equal to 7
-- DATEDIFF(CURDATE(), (p.appointment_date + INTERVAL 7 DAY)) <= 7 
AND 
e.form_id = 58
GROUP BY 
p.patient_id
ORDER BY Days ASC;

