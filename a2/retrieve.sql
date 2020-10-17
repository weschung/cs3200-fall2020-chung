# retrieve all developers
SELECT p.id, p.first_name, p.last_name FROM persons p, developers d
WHERE p.id = d.id;

# retrieve a developer with id equal to 34
SELECT p.id, p.first_name, p.last_name FROM persons p, developers d
WHERE p.id = d.id AND d.id = 34;

# retrieve all developers who have a role in Twitter other than owner
SELECT p.first_name, p.last_name FROM persons p, website_roles wr
WHERE wr.website_id_role = 234 AND website_role != 'owner' AND p.id = wr.developer_id_role;

# retrieve all developers who are page reviewers of pages with less than 300000 visits
SELECT p.first_name, p.last_name FROM persons p, page_roles pr, pages pa
WHERE p.id = pr.developer_id_role AND pa.views < 300000 AND pr.page_role = 'reviewer' AND pr.page_id_role = pa.id;

# retrieve the writer developer who added a heading widget to CNET's home page
SELECT p.first_name, p.last_name FROM pages pa, persons p, page_roles pr, widgets wi, websites w
WHERE pa.website_id = w.id AND w.name = 'CNET' AND p.id = pr.developer_id_role AND pr.page_id_role = 123 AND pa.title = 'Home' AND wi.dtype = 'heading' AND wi.page_id = pa.id AND pr.page_role = 'writer';

# retrieve the website with the least number of visits
SELECT w.name FROM websites w
WHERE w.visits = (SELECT min(w.visits) FROM websites w);

# retrieve the name of a website whose id is 678
SELECT w.name FROM websites w
WHERE w.id = 678;

# retrieve all websites with videos reviewed by Bob
SELECT w.name FROM websites w, pages pa, widgets wi, page_roles pr
WHERE w.id = pa.website_id AND wi.page_id = pa.id AND wi.dtype = 'youtube' AND pr.page_id_role = pa.id AND pr.page_role = 'reviewer' AND pr.developer_id_role = 23;

# retrieve all websites where Alice is an owner
SELECT w.name FROM websites w, website_roles wr
WHERE w.id = wr.website_id_role AND wr.website_role = 'owner' AND wr.developer_id_role = 12;

# retrieve all websites where Charlie is an admin and get more than 6000000 visits
SELECT w.name FROM websites w, website_roles wr
WHERE w.id = wr.website_id_role AND wr.website_role = 'admin' AND wr.developer_id_role = 34 AND w.visits > 6000000;

# retrieve the page with the most number of views
SELECT pa.title FROM pages pa
WHERE pa.views = (SELECT max(pa.views) FROM pages pa);

# retrieve the title of a page whos is is 234
SELECT pa.title FROM pages pa
WHERE pa.id = 234;

# retrieve all pages where Alice is an editor
SELECT pa.title FROM pages pa, page_roles pr
WHERE pa.id = pr.page_id_role AND pr.developer_id_role = 12 AND pr.page_role = 'editor';

# retrieve the total number of page views in CNET
SELECT SUM(pa.views) FROM pages pa, websites w
WHERE w.name = 'CNET' AND w.id = pa.website_id;

# retrieve the average number of page views in the website Wikipedia
SELECT AVG(pa.views) FROM pages pa, websites w
WHERE w.name = 'Wikipedia' AND w.id = pa.website_id;

# retrieve all widgets in CNET's Home page
SELECT wi.name FROM widgets wi, pages pa, websites w
WHERE wi.page_id = pa.id AND pa.website_id = w.id AND w.name = 'CNET' AND pa.title = 'Home';

# retrieve all youtube widgets in CNN
SELECT wi.name FROM widgets wi, pages pa, websites w
WHERE wi.page_id = pa.id AND pa.website_id = w.id AND w.name = 'CNN';

# retrieve all image widgets on pages reviewed by Alice
SELECT wi.name FROM widgets wi, page_roles pr
WHERE wi.page_id = pr.page_id_role AND page_role = 'reviewer' AND pr.developer_id_role = 12;

# retrieve how many widgets are in Wikipedia
SELECT COUNT(wi.id) FROM widgets wi, pages pa, websites w
WHERE wi.page_id = pa.id AND pa.website_id = w.id AND w.name = 'Wikipedia';

# retrieve the names of all the websites where Bob has DELETE privileges
SELECT w.name FROM websites w, website_privileges wp
WHERE w.id = wp.website_id_privilege AND wp.developer_id_privilege = 23 AND wp.website_privilege = 'delete';

# retrieve the names of all the pages where Charlie has CREATE privileges
SELECT pa.title FROM pages pa, page_privileges pp
WHERE pa.id = pp.page_id_privilege AND pp.developer_id_privilege = 34 AND pp.page_privilege = 'create';
