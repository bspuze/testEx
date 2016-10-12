SELECT contact.display_name, employer_contact.organization_name, COUNT(contact.display_name)
FROM `civicrm_contact` AS contact
LEFT JOIN `civicrm_contact` AS employer_contact ON contact.employer_id = employer_contact.id, 
`civicrm_case` AS civi_case, 
`civicrm_case_contact` AS case_contact, 
`civicrm_case_type` AS case_type
WHERE contact.contact_type = 'individual'
AND contact.id = case_contact.contact_id
AND case_contact.case_id = civi_case.id
AND civi_case.case_type_id = case_type.id
AND case_type.title = 'ongoing'
GROUP BY contact.display_name;
