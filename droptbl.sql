-- Include your drop table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the drop table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been dropped (reverse of the creation order).

-- This is only an example of how you add drop table ddls to this file.
--   You may remove it.
DROP TABLE technicians;
DROP TABLE tests;
DROP TABLE appointments;
DROP TABLE notes;
DROP TABLE midwives;
DROP TABLE institutions;
DROP TABLE communityClinic;
DROP TABLE birthCenter;
DROP TABLE couples;
DROP TABLE infoSessions;
DROP TABLE invite;
DROP TABLE fathers;
DROP TABLE mothers;
DROP TABLE parents;
DROP TABLE children;
DROP VIEW midwifeinfo;
