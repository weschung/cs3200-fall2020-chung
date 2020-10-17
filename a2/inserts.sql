INSERT INTO persons VALUES
	(12, 'Alice', 'Wonder', 'alice', 'alice', 'alice@wonder.com', null),
    (23, 'Bob', 'Marley', 'bob', 'bob', 'bob@marley.com', null),
    (34, 'Charles', 'Garcia', 'charlie', 'charlie', 'church@garcia.com', null),
    (45, 'Dan', 'Martin', 'dan', 'dan', 'dan@martin.com', null),
    (56, 'Ed', 'Karaz', 'ed', 'ed', 'ed@kar.com', null);
INSERT INTO developers VALUES
	(12, '4321rewq'),
    (23, '5432trew'),
    (34, '6543ytre');
INSERT INTO users VALUES
	(45, 1),
    (56, 0);
INSERT INTO websites VALUES
	(123, 'Facebook', 'an online social media and social networking service', DEFAULT, DEFAULT, 1234234),
    (234, 'Twitter', 'an online news and social networking service', DEFAULT, DEFAULT, 4321543),
    (345, 'Wikipedia', 'a free online encyclopedia', DEFAULT, DEFAULT, 3456654),
    (456, 'CNN', 'an American basic cable and satelite television new channel', DEFAULT, DEFAULT, 6543345),
    (567, 'CNET', 'an American media website that publishes reviews, news, articles, blogs, podcasts and videos on technology and consumer electronics', DEFAULT, DEFAULT, 5433455),
    (678, 'Gizmodo', 'a design, technology, science and science fiction website that also writes articles on politics', DEFAULT, DEFAULT, 4322345);
INSERT INTO website_roles VALUES
	(DEFAULT, 'owner', 123, 12),
    (DEFAULT, 'editor', 123, 23),
    (DEFAULT, 'admin', 123, 34),
    (DEFAULT, 'owner', 234, 23),
    (DEFAULT, 'editor', 234, 34),
    (DEFAULT, 'admin', 234, 12),
    (DEFAULT, 'owner', 345, 34),
    (DEFAULT, 'editor', 345, 12),
    (DEFAULT, 'admin', 345, 23),
    (DEFAULT, 'owner', 456, 12),
    (DEFAULT, 'editor', 456, 23),
    (DEFAULT, 'admin', 456, 34),
    (DEFAULT, 'owner', 567, 23),
    (DEFAULT, 'editor', 567, 34),
    (DEFAULT, 'admin', 567, 12),
    (DEFAULT, 'owner', 678, 34),
    (DEFAULT, 'editor', 678, 12),
    (DEFAULT, 'admin', 678, 23);
INSERT INTO pages VALUES
	(123, 567, 'Home', 'Landing page', DEFAULT, DEFAULT, 123434),
    (234, 678, 'About', 'Website description', DEFAULT, DEFAULT, 234545),
    (345, 345, 'Contact', 'Addresses, phones, and contact info', DEFAULT, DEFAULT, 345656),
    (456, 456, 'Preferences', 'Where users can configure their preferences', DEFAULT, DEFAULT, 456776),
    (567, 567, 'Profile', 'Users can configure their personal information', DEFAULT, DEFAULT, 567878);
INSERT INTO page_roles VALUES
	(DEFAULT, 'editor', 123, 12),
    (DEFAULT, 'reviewer', 123, 23),
    (DEFAULT, 'writer', 123, 34),
    (DEFAULT, 'editor', 234, 23),
    (DEFAULT, 'reviewer', 234, 34),
    (DEFAULT, 'writer', 234, 12),
    (DEFAULT, 'editor', 345, 34),
    (DEFAULT, 'reviewer', 345, 12),
    (DEFAULT, 'writer', 345, 23),
    (DEFAULT, 'editor', 456, 12),
    (DEFAULT, 'reviewer', 456, 23),
    (DEFAULT, 'writer', 456, 34),
    (DEFAULT, 'editor', 567, 23),
    (DEFAULT, 'reviewer', 567, 34),
    (DEFAULT, 'writer', 567, 12);
INSERT INTO widgets VALUES 
	(123,123,'heading','head123',NULL,NULL,NULL,NULL,'Welcome',0,NULL,NULL,NULL,NULL,2,NULL),
	(234,234,'html','post234',NULL,NULL,NULL,NULL,'<p>Lorem</p>',0,NULL,NULL,NULL,NULL,2,NULL),
    (345,345,'heading','head345',NULL,NULL,NULL,NULL,'Hi',1,NULL,NULL,NULL,NULL,2,NULL),
    (456,345,'html','intro456',NULL,NULL,NULL,NULL,'<h1>Hi</h1>',2,NULL,NULL,NULL,NULL,2,NULL),
    (567,345,'image','image345',50,100,NULL,NULL,NULL,3,'/img/567.png',NULL,NULL,NULL,2,NULL),
    (678,456,'youtube','video456',400,300,NULL,NULL,NULL,0,'https://youtu.be/h67VX51QXiQ',NULL,NULL,NULL,2,NULL);
INSERT INTO addresses VALUES 
	(DEFAULT,12,'123 Adam St.','Alton','01234',NULL,1),
	(DEFAULT,12,'234 Birch St.','Boston','02345',NULL,0),
    (DEFAULT,23,'345 Charles St.','Chelms','03455',NULL,1),
    (DEFAULT,23,'456 Down St.','Dalton','04566',NULL,0),
    (DEFAULT,23,'543 East St.','Everett','01112',NULL,0),
    (DEFAULT,34,'654 Frank St.','Foulton','04322',NULL,1);
INSERT INTO phones VALUES 
	(DEFAULT,12,'123-234-3456',1),
    (DEFAULT,12,'234-345-4566',0),
    (DEFAULT,23,'345-456-5677',1),
    (DEFAULT,34,'321-432-5435',1),
    (DEFAULT,34,'432-432-5433',0),
    (DEFAULT,34,'543-543-6544',0);
