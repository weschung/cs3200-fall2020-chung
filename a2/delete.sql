# delete Alice's primary address
DELETE FROM addresses a
WHERE a.person_id = 12 AND a.primary = 1; 

# delete widget, last widget in the Contact page
DELETE FROM widgets wi
WHERE wi.page_id = 345
ORDER BY wi.order DESC
LIMIT 1;

# delete page, last updated page in Wikipedia
DELETE FROM pages pa
WHERE pa.id = 345
ORDER BY pa.updated_last DESC
LIMIT 1;

# delete website, remove CNET website as well as all related roles and privileges relating to the Website and Pages
DELETE FROM websites w
WHERE w.id = 567;