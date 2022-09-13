-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!

-- This is only an example of how you add INSERT statements to this file.
--   You may remove it.
INSERT INTO technicians VALUES (1001,'Ali Azimi','514-235-3232');
INSERT INTO technicians VALUES (1002,'Mohammad Mohammadi','514-235-3233');
INSERT INTO technicians VALUES (1003,'Saman Namjoo','514-235-3234');
INSERT INTO technicians VALUES (1004,'Gholi Zafar','514-235-3235');
INSERT INTO technicians VALUES (1005,'Asghar Farhadi','514-235-3236');

INSERT INTO parents VALUES (2001,'Zahra Asadi','1980-01-15','Hawaii','514-123-2330','B+','Home maker','zahra.asadi@gmail.com');
INSERT INTO parents VALUES (2002,'Fateme Amini','1981-02-16','California','514-123-2331','B-','Packer','fateme.amini@gmail.com');
INSERT INTO parents VALUES (2003,'Shiva Malekshah','1982-01-17','Ohaio','514-123-2332','A+','Programmer','shiva.malekshah@gmail.com');
INSERT INTO parents VALUES (2004,'Mahshid Rahbar','1983-01-18','Vegas','514-123-2333','A-','Gamer','mahshid.rahbar@gmail.com');
INSERT INTO parents VALUES (2005,'Sanaz Soltani','1984-01-19','Kerman','514-123-2334','O+','YouTuber','sanaz.soltani@gmail.com');
INSERT INTO parents VALUES (2006,'Nariman Zendehrooh','1985-01-20','Quebec','514-123-2335','O-','Mechanical Engineer','nariman.zendehrooh@gmail.com');
INSERT INTO parents VALUES (2007,'Soroush Saryazdi','1986-01-21','Montreal','514-123-2336','AB+','Chemical Engineer','soroush.saryazdi@gmail.com');
INSERT INTO parents VALUES (2008,'Nader Asadi','1987-01-22','Toronto','514-123-2337','AB-','Driver','nader.asadi@gmail.com');
INSERT INTO parents VALUES (2009,'Farzad Salajeghe','1988-01-23','Vancouver','514-123-2338','B+','Software Engineer','farzad.salajeghe@gmail.com');
INSERT INTO parents VALUES (2010,'Ali Ganji','1989-01-24','Alberta','514-123-2339','B-','Data Scientist','ali.ganji@gmail.com');
INSERT INTO parents VALUES (2011,'Victoria Gutierrez','1996-08-07','Cancun','514-123-2340','O+','Data Scientist','vicky.gutierrez@gmail.com');
INSERT INTO parents VALUES (2012,'Maedeh Najafpoor','1996-02-25','Montreal','514-123-2341','A+','UI Designer','maedeh.najafpoor@gmail.com');
INSERT INTO parents VALUES (2013,'Boshra Najafpoor','1997-03-26','Quebec','514-123-2342','A-','Boxer','boshra.najafpoor@gmail.com');
INSERT INTO parents VALUES (2014,'Curr Pregnant','1998-03-26','West Island','514-123-2343','AB-','Engineer','curr.pregnant@gmail.com');
INSERT INTO parents VALUES (2015,'Not Pregnant','1990-03-26','Outremont','514-123-2344','AB+','Retired','not.pregnant@gmail.com');
INSERT INTO parents VALUES (2016,'wrong mid','1998-03-26','Laval','514-123-2345','A+','Trainer','wrong.mid@gmail.com');
INSERT INTO parents VALUES (2017,'multiple children1','1995-03-26','Laval','514-123-2346','A+','Trainer','multiple.children1@gmail.com');
INSERT INTO parents VALUES (2018,'multiple children2','1996-03-26','Laval','514-123-2347','A+','Trainer','multiple.children2@gmail.com');



INSERT INTO institutions VALUES ('inst1@inst.com','www.inst1.ca','inst1','514-456-3440','Hawaii');
INSERT INTO institutions VALUES ('inst2@inst.com','www.inst2.ca','inst2','514-456-3441','California');
INSERT INTO institutions VALUES ('inst3@inst.com','www.inst3.ca','inst3','514-456-3442','Kerman');
INSERT INTO institutions VALUES ('inst4@inst.com','www.inst4.ca','inst4','514-456-3443','Quebec');
INSERT INTO institutions VALUES ('inst5@inst.com','www.inst5.ca','inst5','514-456-3444','Montreal');
INSERT INTO institutions VALUES ('inst6@inst.com','www.inst6.ca','inst6','514-456-3446','Vegas');
INSERT INTO institutions VALUES ('inst7@inst.com','www.inst7.ca','inst7','514-456-3447','Ohaio');
INSERT INTO institutions VALUES ('inst8@inst.com','www.inst8.ca','inst8','514-456-3448','Toronto');
INSERT INTO institutions VALUES ('inst9@inst.com','www.inst9.ca','inst9','514-456-3449','Vancouver');
INSERT INTO institutions VALUES ('inst10@inst.com','www.inst10.ca','inst10','514-456-3450','Alberta');
INSERT INTO institutions VALUES ('inst11@inst.com','www.inst11.ca','inst11','514-456-3451','Westmount');
INSERT INTO institutions VALUES ('inst12@inst.com','www.inst12.ca','inst12','514-456-3452','Griffin Town');
INSERT INTO institutions VALUES ('lac-saint-louis@inst.com','www.lac-saint-louis.ca','Lac-Saint-Louis','514-456-3453','Downtown');


INSERT INTO communityClinic VALUES ('inst1@inst.com');
INSERT INTO communityClinic VALUES ('inst2@inst.com');
INSERT INTO communityClinic VALUES ('inst3@inst.com');
INSERT INTO communityClinic VALUES ('inst4@inst.com');
INSERT INTO communityClinic VALUES ('inst5@inst.com');
INSERT INTO communityClinic VALUES ('inst11@inst.com');


INSERT INTO birthCenter VALUES ('inst6@inst.com');
INSERT INTO birthCenter VALUES ('inst7@inst.com');
INSERT INTO birthCenter VALUES ('inst8@inst.com');
INSERT INTO birthCenter VALUES ('inst9@inst.com');
INSERT INTO birthCenter VALUES ('inst10@inst.com');
INSERT INTO birthCenter VALUES ('inst12@inst.com');
INSERT INTO birthCenter VALUES ('lac-saint-louis@inst.com');


INSERT INTO midwives VALUES (3001,'mid1','438-123-4140','mid1@inst.com','inst1@inst.com');
INSERT INTO midwives VALUES (3002,'mid2','438-123-4141','mid2@inst.com','inst2@inst.com');
INSERT INTO midwives VALUES (3003,'mid3','438-123-4142','mid3@inst.com','inst3@inst.com');
INSERT INTO midwives VALUES (3004,'mid4','438-123-4143','mid4@inst.com','inst4@inst.com');
INSERT INTO midwives VALUES (3005,'mid5','438-123-4144','mid5@inst.com','inst5@inst.com');
INSERT INTO midwives VALUES (3006,'mid6','438-123-4145','mid6@inst.com','inst6@inst.com');
INSERT INTO midwives VALUES (3007,'mid7','438-123-4146','mid7@inst.com','inst7@inst.com');
INSERT INTO midwives VALUES (3008,'mid8','438-123-4147','mid8@inst.com','inst8@inst.com');
INSERT INTO midwives VALUES (3009,'mid9','438-123-4148','mid9@inst.com','inst9@inst.com');
INSERT INTO midwives VALUES (3010,'mid10','438-123-4149','mid10@inst.com','inst10@inst.com');
INSERT INTO midwives VALUES (3011,'Marion Girard','438-123-4150','marion.girard@inst.com','inst1@inst.com');
INSERT INTO midwives VALUES (3012,'mid11','438-123-4151','mid11@inst.com','inst11@inst.com');
INSERT INTO midwives VALUES (3013,'mid12','438-123-4152','mid12@inst.com','inst12@inst.com');
INSERT INTO midwives VALUES (3014,'saint louis','438-123-4153','saintlouis@inst.com','lac-saint-louis@inst.com');


INSERT INTO couples VALUES (4001,1, '2022-08-02','2022-07-10',3001,3002);
INSERT INTO couples VALUES (4002,2, '2022-08-03','2022-07-11',3003,3004);
INSERT INTO couples VALUES (4003,3, '2022-08-04','2022-07-12',3005,3006);
INSERT INTO couples VALUES (4004,4, '2022-08-05','2022-07-13',3007,3008);
INSERT INTO couples VALUES (4005,5, '2022-08-06','2022-07-14',3009,3010);
INSERT INTO couples VALUES (4006,1, '2010-01-05','2010-01-10',3001,3002);
INSERT INTO couples VALUES (4006,2, '2022-03-01','2022-03-10',3003,3004);
INSERT INTO couples VALUES (4007,1, '2022-07-15','2022-07-10',3012,3013);
INSERT INTO couples (cid, pregnum, estdue, prim, backup) VALUES (4008,1,'2022-07-20',3013,3012);
INSERT INTO couples VALUES (4009,1, '2022-08-15','2022-08-10',3014,3013);
INSERT INTO couples VALUES (4010,1, '2010-09-15','2010-09-10',3014,3013);
INSERT INTO couples VALUES (4011,1, '2022-10-15','2022-10-10',3012,3013);
INSERT INTO couples VALUES (4012,1, '2010-10-15','2010-10-10',3012,3013);
INSERT INTO couples VALUES (4012,2, '2020-10-15','2020-10-10',3012,3013);
INSERT INTO couples VALUES (4013,1, '2021-10-15','2021-10-10',3012,3013);



INSERT INTO mothers VALUES (2001,'2022-02-11',4001,1);
INSERT INTO mothers VALUES (2002,'2022-02-12',4002,2);
INSERT INTO mothers VALUES (2003,'2022-02-13',4003,3);
INSERT INTO mothers VALUES (2004,'2022-02-14',4004,4);
INSERT INTO mothers VALUES (2005,'2022-02-15',4005,5);
INSERT INTO mothers VALUES (2011,'2009-06-01',4006,1);
INSERT INTO mothers VALUES (2011,'2021-06-01',4006,2);
INSERT INTO mothers VALUES (2012,'2021-11-05',4007,1);
INSERT INTO mothers VALUES (2013,'2021-11-10',4008,1);
INSERT INTO mothers VALUES (2014,'2021-11-10',4009,1);
INSERT INTO mothers VALUES (2015,'2010-11-10',4010,1);
INSERT INTO mothers VALUES (2016,'2021-12-10',4011,1);
INSERT INTO mothers VALUES (2017,'2009-12-10',4012,1);
INSERT INTO mothers VALUES (2017,'2019-12-10',4012,2);
INSERT INTO mothers VALUES (2018,'2021-12-10',4013,1);


INSERT INTO fathers VALUES (2006,4001,1);
INSERT INTO fathers VALUES (2007,4002,2);
INSERT INTO fathers VALUES (2008,4003,3);
INSERT INTO fathers VALUES (2009,4004,4);
INSERT INTO fathers VALUES (2010,4005,5);

INSERT INTO children (childid, cid,pregnum) VALUES (5001,4001,1);
INSERT INTO children (childid, cid,pregnum) VALUES (5002,4002,2);
INSERT INTO children (childid, cid,pregnum) VALUES (5003,4003,3);
INSERT INTO children (childid, cid,pregnum) VALUES (5004,4004,4);
INSERT INTO children (childid, cid,pregnum) VALUES (5005,4005,5);
INSERT INTO children (childid, cid,pregnum) VALUES (5006,4006,1);
INSERT INTO children (childid, cid,pregnum) VALUES (5007,4006,2);
INSERT INTO children (childid, cid,pregnum) VALUES (5008,4007,1);
INSERT INTO children (childid, cid,pregnum) VALUES (5009,4008,1);
INSERT INTO children (childid, cid,pregnum) VALUES (5010,4009,1);
INSERT INTO children (childid, cid,pregnum) VALUES (5011,4010,1);
INSERT INTO children (childid, cid,pregnum) VALUES (5012,4011,1);
INSERT INTO children (childid, cid,pregnum) VALUES (5013,4012,1);
INSERT INTO children (childid, cid,pregnum) VALUES (5014,4012,1);
INSERT INTO children (childid, cid,pregnum) VALUES (5015,4012,2);
INSERT INTO children (childid, cid,pregnum) VALUES (5016,4012,2);
INSERT INTO children (childid, cid,pregnum) VALUES (5017,4012,2);
INSERT INTO children (childid, cid,pregnum) VALUES (5018,4013,1);
INSERT INTO children (childid, cid,pregnum) VALUES (5019,4013,1);

INSERT INTO infoSessions VALUES (6001,'2022-01-01','English','09:00:00',3001);
INSERT INTO infoSessions VALUES (6002,'2022-01-02','English','10:00:00',3003);
INSERT INTO infoSessions VALUES (6003,'2022-01-03','German','11:00:00',3005);
INSERT INTO infoSessions VALUES (6004,'2022-01-04','English','12:00:00',3007);
INSERT INTO infoSessions VALUES (6005,'2022-01-05','French','13:00:00',3009);
INSERT INTO infoSessions VALUES (6006,'2022-01-06','English','13:00:00',3012);
INSERT INTO infoSessions VALUES (6007,'2022-01-07','French','13:00:00',3013);
INSERT INTO infoSessions VALUES (6008,'2022-01-08','French','13:00:00',3014);
INSERT INTO infoSessions VALUES (6009,'2010-01-08','French','13:00:00',3014);

INSERT INTO invite VALUES (4001,1,'inst1@inst.com',6001);
INSERT INTO invite VALUES (4002,2,'inst2@inst.com',6002);
INSERT INTO invite VALUES (4003,3,'inst3@inst.com',6003);
INSERT INTO invite VALUES (4004,4,'inst4@inst.com',6004);
INSERT INTO invite VALUES (4005,5,'inst5@inst.com',6005);
INSERT INTO invite VALUES (4006,1,'inst1@inst.com',6001);
INSERT INTO invite VALUES (4006,2,'inst5@inst.com',6005);
INSERT INTO invite VALUES (4007,1,'inst11@inst.com',6006);
INSERT INTO invite VALUES (4008,1,'inst12@inst.com',6007);
INSERT INTO invite VALUES (4009,1,'lac-saint-louis@inst.com',6008);
INSERT INTO invite VALUES (4010,1,'lac-saint-louis@inst.com',6009);
INSERT INTO invite VALUES (4011,1,'inst12@inst.com',6007);


INSERT INTO appointments VALUES (7001,'2022-02-01','11:00:00',3001,4001,1);
INSERT INTO appointments VALUES (7002,'2022-02-02','12:00:00',3002,4002,2);
INSERT INTO appointments VALUES (7003,'2022-02-03','13:00:00',3003,4003,3);
INSERT INTO appointments VALUES (7004,'2022-02-04','14:00:00',3004,4004,4);
INSERT INTO appointments VALUES (7005,'2022-02-05','15:00:00',3005,4005,5);
INSERT INTO appointments VALUES (7006,'2022-03-21','16:00:00',3011,4001,1);
INSERT INTO appointments VALUES (7007,'2022-03-25','17:00:00',3011,4002,2);
INSERT INTO appointments VALUES (7008,'2022-03-26','18:00:00',3011,4003,3);
INSERT INTO appointments VALUES (7009,'2010-03-26','19:00:00',3001,4006,1);
INSERT INTO appointments VALUES (7010,'2022-03-27','20:00:00',3003,4006,2);
INSERT INTO appointments VALUES (7011,'2022-03-28','21:00:00',3012,4007,1);
INSERT INTO appointments VALUES (7012,'2022-03-29','22:00:00',3013,4008,1);


INSERT INTO notes VALUES (8001,'2022-02-01', '11:30:00',7001,3001);
INSERT INTO notes VALUES (8002,'2022-02-02', '12:30:00',7002,3002);
INSERT INTO notes VALUES (8003,'2022-02-03', '13:30:00',7003,3003);
INSERT INTO notes VALUES (8004,'2022-02-04', '14:30:00',7004,3004);
INSERT INTO notes VALUES (8005,'2022-02-05', '15:30:00',7005,3005);
INSERT INTO notes VALUES (8006,'2022-03-28', '21:30:00',7011,3012);
INSERT INTO notes VALUES (8007,'2022-03-29', '22:30:00',7012,3013);

INSERT INTO tests VALUES (9001,'2022-03-03','2022-03-02','2022-03-01','type1','Good',1001,7001,3001);
INSERT INTO tests VALUES (9002,'2022-04-03','2022-04-02','2022-04-01','type2','Normal',1002,7002,3002);
INSERT INTO tests VALUES (9003,'2022-05-03','2022-05-02','2022-05-01','type3','Bad',1003,7003,3003);
INSERT INTO tests VALUES (9004,'2022-06-03','2022-06-02','2022-06-01','type4','Very Good',1004,7004,3004);
INSERT INTO tests VALUES (9005,'2022-07-03','2022-07-02','2022-07-01','type5','Dangerous',1005,7005,3005);
INSERT INTO tests VALUES (9006,'2010-08-03','2010-08-02','2010-08-01','blood iron','satisfiable',1005,7009,3001);
INSERT INTO tests VALUES (9007,'2022-09-03','2022-09-02','2022-09-01','blood iron','Dangerous',1005,7010,3003);
INSERT INTO tests VALUES (9008,'2022-03-30','2022-03-29','2022-03-28','type6','Good',1005,7011,3012);
INSERT INTO tests VALUES (9009,'2022-03-31','2022-03-30','2022-03-29','type7','Bad',1005,7012,3013);
