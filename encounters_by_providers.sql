-- SELECT * FROM openmrs.obs;
SELECT o.person_id, pt.ClientFirstName AS "Client First Name", pt.ClientMiddleName AS "Client Middle Name", 
pt.ClientFamilyName AS "Client Last Name",  DATE(o.date_created) as "Date Entered", f.name AS "Form Type",
p.provider_id as "Provider ID", pn.given_name "Provider First Name", pn.middle_name "Provider Middle Name", pn.family_name AS "Provider Last Name"
FROM openmrs.obs o
JOIN openmrs.encounter e
ON e.encounter_id = o.encounter_id
JOIN openmrs.form f
ON f.form_id = e.form_id
JOIN openmrs.encounter_provider ep
ON ep.encounter_id = e.encounter_id
JOIN openmrs.provider p
ON p.provider_id = ep.provider_id
JOIN openmrs.person pe
ON pe.person_id = p.person_id 
JOIN openmrs.person_name pn
ON pn.person_id = pe.person_id
JOIN (SELECT person_id, given_name as ClientFirstName, middle_name as ClientMiddleName, 
    family_name as ClientFamilyName
    FROM openmrs.person_name) pt ON pt.person_id = o.person_id

-- WHERE f.form_id in (1,5,7,50,57,58,59,60,61,62,71,72,79,94,95)
-- WHERE f.form_id in (57) -- Behaviour Risk Assessment
WHERE f.form_id in (46, 31, 32, 33, 47, 55, 56) -- HTS Eligibility Screening
-- By Provider ID
-- AND ep.provider_id = 39
-- By Date
-- AND o.date_created BETWEEN '2021-03-01' and '2021-04-30'
-- AND o.date_created > '2021-06-1'
GROUP BY o.person_id, o.date_created;

-- select * from openmrs.form where name like "%HTS%";