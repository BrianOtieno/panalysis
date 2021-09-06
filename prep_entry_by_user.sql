SELECT d.given_name as "Client First Name", d.middle_name as "Client Middle Name", 
d.family_name as "Client Last Name", e.visit_date, e.provider as "Provider ID", x.ProviderFirstName as "Provider First Name",
x.ProviderMiddleName as "Provider Middle Name", x.ProviderLastName as "Provider Last Name"
FROM kenyaemr_etl.etl_prep_enrolment e
JOIN kenyaemr_etl.etl_patient_demographics d
ON e.patient_id = d.patient_id
JOIN (SELECT patient_id, given_name ProviderFirstName, middle_name as ProviderMiddleName, 
		family_name as ProviderLastName 
        FROM kenyaemr_etl.etl_patient_demographics) x ON x.patient_id = e.provider
WHERE e.visit_date >= NOW() - INTERVAL 120 DAY
ORDER BY e.provider ASC;