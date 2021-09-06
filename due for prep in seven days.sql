SELECT i.identifier as "Identifier",
r.client_id AS "Client ID", r.given_name AS "First Name", 
r.middle_name AS "Middle Name", p.visit_date as "Visit Date", 
max(p.appointment_date) AS "Appointment Date",
DATEDIFF(CURDATE(), max(p.appointment_date + INTERVAL 7 DAY)) Days
FROM 
kenyaemr_etl.etl_client_registration r
JOIN 
kenyaemr_etl.etl_prep_followup p
ON
p.patient_id = r.client_id
JOIN openmrs.patient_identifier i 
ON i.patient_id = p.patient_id
WHERE 
(p.appointment_date + INTERVAL 7 DAY) <= NOW()
AND -- you can adjust date by changing number of days here < 9 or 8 days
DATEDIFF(CURDATE(), (p.appointment_date + INTERVAL 7 DAY)) < 9 
GROUP BY 
p.patient_id
ORDER BY Days ASC;