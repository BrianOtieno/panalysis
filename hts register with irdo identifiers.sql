 
 
 SELECT h.patient_id, visit_date, d.given_name, d.middle_name, d.family_name, d.Gender, d.DOB, 
 d.marital_status, d.phone_number, h.population_type, h.key_population_type, h.ever_tested_for_hiv,
 h.months_since_last_test, h.client_tested_as, h.setting, h.test_strategy, h.hts_entry_point, 
 h.test_1_kit_name, h.test_1_kit_lot_no, h.test_1_kit_expiry, h.test_1_result, h.final_test_result,
 h.patient_given_result, h.couple_discordant, h.tb_screening, h.patient_had_hiv_self_test, 
 h.creator, u.username, 
 CONCAT_WS(' ',pt.ClientFirstName,pt.ClientMiddleName,pt.ClientFamilyName) AS "Provider Name"
 FROM kenyaemr_etl.etl_hts_test h
 JOIN kenyaemr_etl.etl_patient_demographics d
 ON h.patient_id = d.patient_id 
 JOIN openmrs.users u
 ON u.user_id = h.creator
 JOIN (SELECT person_id, given_name as ClientFirstName, middle_name as ClientMiddleName, 
			  family_name as ClientFamilyName
       FROM openmrs.person_name) pt 
ON pt.person_id = u.person_id
JOIN emrfix.irdorawids i
ON i.

 
 