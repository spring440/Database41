INSERT INTO Addresses (address, city, zipcode, state) VALUES
  ('2264 Frum Street', 'Nashville', '37205','Tennessee'),
  ('20 Maple Avenue', 'San Pedro', '90731', 'California'),
  ('7246 W. Adams Lane', 'San Jose', '95608', 'California'),
  ('186 Britannia CI', 'Carterton', 'OX18', 'United Kingdom'),
  ('károly körút 23', 'Budapest', '1075', 'Hungary'),
  ('10 Napa Ct.', 'Lebanon', '97355', 'Oregon'),
  ('1000 Bidweld Street', 'Haney', 'V2W 1W2', 'British Columbia'),
  ('1003 Matterhorn Ct', 'Lebanon', '97355',  'Oregon'),
  ('1010 Maple', 'Baltimore', '21201', 'Oregon');

INSERT INTO Locations (location, number_of_rooms) VALUES
  ('Budapest', 125),
  ('Los Angeles', 250),
  ('New York', 300),
  ('San Francisco', 200),
  ('Tokyo', 100),
  ('Baltimore', 150),
  ('Bogota', 75),
  ('Kyiv', 75),
  ('Brisbane', 200),
  ('Plovdiv', 100),
  ('Philadelphia', 100);

INSERT INTO Tables ([table]) VALUES
  ('Table 1'),
  ('Table 2'),
  ('Table 3'),
  ('Table 4'),
  ('Table 5'),
  ('Table 6'),
  ('Table 7'),
  ('Table 8'),
  ('Table 9'),
  ('Table 10');

INSERT INTO Persons (first, last, email, address_id) VALUES
  ('Cesar', 'Moran', 'cesar@gmail.com', (SELECT id FROM Addresses WHERE city='San Jose')),
  ('Kevin', 'Goff', 'KGoff@gmail.com', (SELECT id FROM Addresses WHERE city='San Pedro')),
  ('Yomama', 'Gorda', 'yscd@yahoo.com', (SELECT id FROM Addresses WHERE city='Budapest')),
  ('Kathleen', 'Chuong', 'kchoung@gmail.com', (SELECT id FROM Addresses WHERE city='Carterton')),
  ('Some', 'Name', 'name@gmail.com', (SELECT id FROM Addresses WHERE city='Nashville')),
  ('Amanda', 'Long', 'ALong@gmail.com', (SELECT id FROM Addresses WHERE address='10 Napa Ct.')),
  ('Christian', 'Shan', 'CShan@gmail.com', (SELECT id FROM Addresses WHERE city='Haney')),
  ('Kaithlyn', 'Baker', 'KBaker@gmail.com', (SELECT id FROM Addresses WHERE address='1003 Matterhorn Ct')),
  ('Steve', 'Simon', 'SSimon@gmail.com', (SELECT id FROM Addresses WHERE city='Baltimore'));

INSERT INTO Events (location_id, date, title) VALUES
  ((SELECT id FROM Locations WHERE location = 'Budapest'), '05/06/2017', 'SQLSaturday #626 - Budapest 2017'),
  ((SELECT id FROM Locations WHERE location = 'Baltimore'), '05/06/2017', 'SQLSaturday #615 - Baltimore 2017'),
  ((SELECT id FROM Locations WHERE location = 'Bogota'), '05/13/2017', 'SQLSaturday #608 - Bogota 2017'),
  ((SELECT id FROM Locations WHERE location = 'Kyiv'), '05/20/2017', 'SQLSaturday #616 - Kyiv 2017'),
  ((SELECT id FROM Locations WHERE location = 'New York City'), '05/20/2017', 'SQLSaturday #588 - New York City 2017'),
  ((SELECT id FROM Locations WHERE location = 'Brisbane'), '05/27/2017', 'SQLSaturday #630 - Brisbane 2017'),
  ((SELECT id FROM Locations WHERE location = 'Plovdiv'), '05/27/2017', 'SQLSaturday #599 - Plovdiv 2017'),
  ((SELECT id FROM Locations WHERE location = 'Philadelphia'), '06/03/2017', 'SQLSaturday #638 - Philadelphia 2017');

INSERT INTO Attendees (person_id, event_id) VALUES
  ((SELECT id FROM Persons WHERE Persons.id = 1), (SELECT id FROM Events WHERE title='SQLSaturday #626 - Budapest 2017')),
  ((SELECT id FROM Persons WHERE Persons.id = 2), (SELECT id FROM Events WHERE title='SQLSaturday #626 - Budapest 2017')),
  ((SELECT id FROM Persons WHERE Persons.id = 3), (SELECT id FROM Events WHERE title='SQLSaturday #626 - Budapest 2017')),
  ((SELECT id FROM Persons WHERE Persons.id = 4), (SELECT id FROM Events WHERE title='SQLSaturday #626 - Budapest 2017')),
  ((SELECT id FROM Persons WHERE Persons.id = 5), (SELECT id FROM Events WHERE title='SQLSaturday #626 - Budapest 2017')),
  ((SELECT id FROM Persons WHERE Persons.id = 6), (SELECT id FROM Events WHERE title='SQLSaturday #626 - Budapest 2017')),
  ((SELECT id FROM Persons WHERE Persons.id = 7), (SELECT id FROM Events WHERE title='SQLSaturday #626 - Budapest 2017')),
  ((SELECT id FROM Persons WHERE Persons.id = 8), (SELECT id FROM Events WHERE title='SQLSaturday #626 - Budapest 2017')),
  ((SELECT id FROM Persons WHERE Persons.id = 9), (SELECT id FROM Events WHERE title='SQLSaturday #626 - Budapest 2017')),
  ((SELECT id FROM Persons WHERE Persons.id = 1), (SELECT id FROM Events WHERE title='SQLSaturday #615 - Baltimore 2017')),
  ((SELECT id FROM Persons WHERE Persons.id = 2), (SELECT id FROM Events WHERE title='SQLSaturday #615 - Baltimore 2017')),
  ((SELECT id FROM Persons WHERE Persons.id = 3), (SELECT id FROM Events WHERE title='SQLSaturday #615 - Baltimore 2017')),
  ((SELECT id FROM Persons WHERE Persons.id = 4), (SELECT id FROM Events WHERE title='SQLSaturday #615 - Baltimore 2017')),
  ((SELECT id FROM Persons WHERE first = 'Steve'), (SELECT id FROM Events WHERE title='SQLSaturday #615 - Baltimore 2017'));

INSERT INTO Sponsors (sname, slevel, event_id, table_id) VALUES
  ('VMWare', 'Platinum Sponsor', (SELECT id FROM Events WHERE title ='SQLSaturday #626 - Budapest 2017'), (SELECT id FROM Tables WHERE Tables.id = 1)),
  ('Verizon Digital Media Services', 'Platinum Sponsor', (SELECT id FROM Events WHERE title ='SQLSaturday #626 - Budapest 2017'), (SELECT id FROM Tables WHERE Tables.id = 2)),
  ('Microsoft Corporation (GAP) (GAP Sponsor)', 'Platinum Sponsor', (SELECT id FROM Events WHERE title ='SQLSaturday #626 - Budapest 2017'), (SELECT id FROM Tables WHERE Tables.id = 3)),
  ('Tintri', 'Platinum Sponsor', (SELECT id FROM Events WHERE title ='SQLSaturday #626 - Budapest 2017'), (SELECT id FROM Tables WHERE Tables.id = 4)),
  ('Amazon Web Services, LLC', 'Gold Sponsor', (SELECT id FROM Events WHERE title ='SQLSaturday #626 - Budapest 2017'), (SELECT id FROM Tables WHERE Tables.id = 5)),
  ('Pyramid Analytics (GAP Sponsor)', 'Gold Sponsor', (SELECT id FROM Events WHERE title ='SQLSaturday #626 - Budapest 2017'), (SELECT id FROM Tables WHERE Tables.id = 6)),
  ('Pure Storage', 'Gold Sponsor', (SELECT id FROM Events WHERE title ='SQLSaturday #626 - Budapest 2017'), (SELECT id FROM Tables WHERE Tables.id = 7)),
  ('Profisee', 'Gold Sponsor', (SELECT id FROM Events WHERE title ='SQLSaturday #626 - Budapest 2017'), (SELECT id FROM Tables WHERE Tables.id = 8)),
  ('NetLib Security', 'Silver Sponsor', (SELECT id FROM Events WHERE title ='SQLSaturday #626 - Budapest 2017'), (SELECT id FROM Tables WHERE Tables.id = 9)),
  ('Melissa Data Corp.', 'Silver Sponsor', (SELECT id FROM Events WHERE title ='SQLSaturday #626 - Budapest 2017'), (SELECT id FROM Tables WHERE Tables.id = 10)),
  ('Red Gate Software', 'Silver Sponsor', (SELECT id FROM Events WHERE title ='SQLSaturday #588 - New York City 2017'), (SELECT id FROM Tables WHERE Tables.id = 1)),
  ('SentryOne', 'Silver Sponsor', (SELECT id FROM Events WHERE title ='SQLSaturday #588 - New York City 2017'), (SELECT id FROM Tables WHERE Tables.id = 2)),
  ('Hush Hush', 'Bronze Sponsor', (SELECT id FROM Events WHERE title ='SQLSaturday #588 - New York City 2017'), (SELECT id FROM Tables WHERE Tables.id = 3)),
  ('COZYROC', 'Bronze Sponsor', (SELECT id FROM Events WHERE title ='SQLSaturday #588 - New York City 2017'), (SELECT id FROM Tables WHERE Tables.id = 4)),
  ('SQLDocKit by Acceleratio Ltd.', 'Bronze Sponsor', (SELECT id FROM Events WHERE title ='SQLSaturday #588 - New York City 2017'), (SELECT id FROM Tables WHERE Tables.id = 5)),
  ('VMWare', 'Platinum Sponsor', (SELECT id FROM Events WHERE title ='SQLSaturday #588 - New York City 2017'), (SELECT id FROM Tables WHERE Tables.id = 6));

INSERT INTO Raffles ([sponsor_id]) VALUES
  ((SELECT id FROM Sponsors WHERE Sponsors.id =1)),
  ((SELECT id FROM Sponsors WHERE Sponsors.id =2)),
  ((SELECT id FROM Sponsors WHERE Sponsors.id =3)),
  ((SELECT id FROM Sponsors WHERE Sponsors.id =4)),
  ((SELECT id FROM Sponsors WHERE Sponsors.id =5)),
  ((SELECT id FROM Sponsors WHERE Sponsors.id =6)),
  ((SELECT id FROM Sponsors WHERE Sponsors.id =7)),
  ((SELECT id FROM Sponsors WHERE Sponsors.id =8)),
  ((SELECT id FROM Sponsors WHERE Sponsors.id =9)),
  ((SELECT id FROM Sponsors WHERE Sponsors.id =10)),
  ((SELECT id FROM Sponsors WHERE Sponsors.id =11)),
  ((SELECT id FROM Sponsors WHERE Sponsors.id =1)),
  ((SELECT id FROM Sponsors WHERE Sponsors.id =2));

INSERT INTO Gifts (gift_name, sponsor_id) VALUES
  ('Cookie', (SELECT id FROM Sponsors WHERE Sponsors.id =1)),
  ('Gift Basket', (SELECT id FROM Sponsors WHERE Sponsors.id =1)),
  ('Laptop', (SELECT id FROM Sponsors WHERE Sponsors.id =1)),
  ('Lightsaber', (SELECT id FROM Sponsors WHERE Sponsors.id =1)),
  ('Google Pixel', (SELECT id FROM Sponsors WHERE Sponsors.id =2)),
  ('Google Pixel XL', (SELECT id FROM Sponsors WHERE Sponsors.id =2)),
  ('Samsung Galaxy S8', (SELECT id FROM Sponsors WHERE Sponsors.id =2)),
  ('iPhone 8', (SELECT id FROM Sponsors WHERE Sponsors.id =2)),
  ('Verizon Gift Card', (SELECT id FROM Sponsors WHERE Sponsors.id =2));

INSERT INTO Tracks (area) VALUES
  ('SQL Development'),
  ('Administration'),
  ('Architecture'),
  ('Network Systems');

INSERT INTO Presenters (attendee_id)
  SELECT id
  FROM Attendees;

INSERT INTO Organizers (attendee_id)
  SELECT id
  FROM Attendees;

INSERT INTO Courses (title, description, duration, difficulty, track_id) VALUES
  ('A dive into Data Quality Services', 'Talking about Data Quality', 60, 'Intermediate',(SELECT id FROM Tracks WHERE area='SQL Development')),
  ('Absolute Introductory Session on SQL Server 2014 In-Memory Optimized Databases (Hekaton)', 'Native-code stored procedure optimizations when using Hekaton', 60, 'Beginner',(SELECT id FROM Tracks WHERE area='SQL Development')),
  ('Implementing Data Warehouse Patterns with the Microsoft BI Tools', 'Implementing Data Warehouse', 60, 'Intermediate', (SELECT id FROM Tracks WHERE area='Administration')),
  ('T-SQL for Application Developers - Attendees chose', 'Application Developers', 60, 'Intermediate', (SELECT id FROM Tracks WHERE area='SQL Development'));

INSERT INTO Presentations (presenter_id, course_id) VALUES
  ((SELECT id FROM Presenters WHERE Presenters.id =9), (SELECT id FROM Courses WHERE title='A dive into Data Quality Services')),
  ((SELECT id FROM Presenters WHERE Presenters.id =2), (SELECT id FROM Courses WHERE title='Absolute Introductory Session on SQL Server 2014 In-Memory Optimized Databases (Hekaton)')),
  ((SELECT id FROM Presenters WHERE Presenters.id =2), (SELECT id FROM Courses WHERE title='Implementing Data Warehouse Patterns with the Microsoft BI Tools')),
  ((SELECT id FROM Presenters WHERE Presenters.id =2), (SELECT id FROM Courses WHERE title='T-SQL for Application Developers - Attendees chose'));

INSERT INTO Rooms (capacity, room_name) VALUES
  (20, 'SQL Development'),
  (30, 'SQL Development'),
  (50, 'SQL Development'),
  (20, 'Administration'),
  (30, 'Administration'),
  (50, 'Administration'),
  (20, 'Architecture'),
  (30, 'Architecture'),
  (50, 'Architecture'),
  (20, 'Network Systems'),
  (30, 'Network Systems'),
  (50, 'Network Systems');

INSERT INTO Schedules (room_id, presentation_id, start_time, end_time) VALUES
  ((SELECT id FROM Rooms WHERE room_name='SQL Development' AND capacity='20'), (SELECT id FROM Presentations WHERE Presentations.id=2), '05/06/2017 12:00', '05/06/2017 13:00'),
  ((SELECT id FROM Rooms WHERE room_name='SQL Development' AND capacity='30'), (SELECT id FROM Presentations WHERE Presentations.id=3), '05/06/2017 12:00', '05/06/2017 13:00'),
  ((SELECT id FROM Rooms WHERE room_name='SQL Development' AND capacity='50'), (SELECT id FROM Presentations WHERE Presentations.id=4), '05/06/2017 13:00', '05/06/2017 14:00'),
  ((SELECT id FROM Rooms WHERE room_name='SQL Development' AND capacity='50'), (SELECT id FROM Presentations WHERE Presentations.id=5), '05/06/2017 14:00', '05/06/2017 15:00');
