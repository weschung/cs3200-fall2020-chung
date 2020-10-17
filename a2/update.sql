# update Charlie's primary phone number to 333-444-5555
UPDATE phones ph
SET ph.phone = '333-444-5555'
WHERE ph.primary = 1 AND ph.person_id = 34;

# update the relative order of widget head345 so that its new order is 3
UPDATE widgets wi
SET wi.order = 3
WHERE wi.id = 345;
UPDATE widgets wi
SET wi.order = 1
WHERE wi.id = 456;
UPDATE widgets wi
SET wi.order = 2
WHERE wi.id = 567;

# update page, append 'CNET' to the beginning of all CNET's page titles
UPDATE pages pa, websites w
SET pa.title = 'CNET Home'
WHERE pa.website_id = w.id AND w.name = 'CNET' AND pa.id = 123;
UPDATE pages pa, websites w
SET pa.title = 'CNET Profile'
WHERE pa.website_id = w.id AND w.name = 'CNET' AND pa.id = 567;  

# update roles, swap Charlie's and Bob's role in CNET's Home page
DELETE FROM page_roles pa
WHERE pa.page_id_role = 123 AND pa.developer_id_role = 23;
DELETE FROM page_roles pa
WHERE pa.page_id_role = 123 AND pa.developer_id_role = 34;
INSERT INTO page_roles VALUES (DEFAULT, 'reviewer', 123, 34);
INSERT INTO page_roles VALUES (DEFAULT, 'writer', 123, 23);

 
