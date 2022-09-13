-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

-- This is only an example of how you add create table ddls to this file.
--   You may remove it.
CREATE TABLE technicians
(
    techid INTEGER NOT NULL,
    name VARCHAR(30) NOT NULL,
    pnum VARCHAR(30) NOT NULL,
    PRIMARY KEY (techid)
);

CREATE TABLE parents
(
    hcardid INTEGER NOT NULL,
    name VARCHAR(30) NOT NULL,
    bdate DATE NOT NULL,
    address VARCHAR(30) NOT NULL,
    pnum VARCHAR(15) NOT NULL,
    bloodtype VARCHAR(10),
    profession VARCHAR(20) NOT NULL,
    email VARCHAR(30) NOT NULL,
    PRIMARY KEY (hcardid)
);

CREATE TABLE institutions
(
    email VARCHAR(30) NOT NULL,
    website VARCHAR(30) NOT NULL,
    name VARCHAR(30) NOT NULL,
    pnum VARCHAR(30) NOT NULL,
    address VARCHAR(40) NOT NULL,
    PRIMARY KEY (email)
);

CREATE TABLE communityClinic
(
    email VARCHAR(30) NOT NULL,
    PRIMARY KEY (email),
    FOREIGN KEY (email) REFERENCES institutions
);

CREATE TABLE birthCenter
(
    email VARCHAR(30) NOT NULL,
    PRIMARY KEY (email),
    FOREIGN KEY (email) REFERENCES institutions
);

CREATE TABLE midwives
(
    pracid INTEGER NOT NULL,
    name VARCHAR(30) NOT NULL,
    pnum VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    instEmail VARCHAR(30) NOT NULL,
    PRIMARY KEY (pracid),
    FOREIGN KEY (instEmail) REFERENCES institutions
);

CREATE TABLE couples
(
    cid INTEGER NOT NULL,
    pregnum INTEGER NOT NULL,
    agreeddue DATE,
    estdue DATE NOT NULL,
    prim INTEGER NOT NULL,
    backup INTEGER,
    PRIMARY KEY (cid,pregnum),
    FOREIGN KEY (prim) REFERENCES midwives,
    FOREIGN KEY (backup) REFERENCES midwives
);

CREATE TABLE mothers
(
    hcardid INTEGER NOT NULL,
    lastperiod DATE,
    cid INTEGER NOT NULL,
    pregnum INTEGER NOT NULL,
    PRIMARY KEY (hcardid,cid,pregnum),
    FOREIGN KEY (hcardid) REFERENCES parents,
    FOREIGN KEY (cid,pregnum) REFERENCES couples (cid,pregnum)
);

CREATE TABLE fathers
(
    hcardid INTEGER NOT NULL,
    cid INTEGER NOT NULL,
    pregnum INTEGER NOT NULL,
    PRIMARY KEY (hcardid,cid,pregnum),
    FOREIGN KEY (hcardid) REFERENCES parents,
    FOREIGN KEY (cid,pregnum) REFERENCES couples (cid,pregnum)
);

CREATE TABLE children
(
    childid INTEGER NOT NULL,
    gender VARCHAR(10),
    bloodtype VARCHAR(10),
    bdate DATE,
    btime TIME,
    homebirth BOOLEAN,
    instemail VARCHAR(30),
    cid INTEGER NOT NULL,
    pregnum INTEGER NOT NULL,
    PRIMARY KEY (childid),
    FOREIGN KEY (instemail) REFERENCES birthCenter,
    FOREIGN KEY (cid,pregnum) REFERENCES couples (cid,pregnum)
);

CREATE TABLE infoSessions
(
    sid INTEGER NOT NULL,
    date DATE NOT NULL,
    language VARCHAR(10) NOT NULL ,
    time TIME NOT NULL,
    pracid INTEGER NOT NULL,
    PRIMARY KEY (sid),
    FOREIGN KEY (pracid) REFERENCES midwives
);

CREATE TABLE invite
(
    cid INTEGER NOT NULL,
    pregnum INTEGER NOT NULL,
    instEmail VARCHAR(30) NOT NULL,
    sid INTEGER NOT NULL,
    FOREIGN KEY (cid,pregnum) REFERENCES couples (cid,pregnum),
    FOREIGN KEY (instEmail) REFERENCES institutions,
    FOREIGN KEY (sid) REFERENCES infoSessions
);

CREATE TABLE appointments
(
    appid INTEGER NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    pracid INTEGER NOT NULL,
    cid INTEGER NOT NULL,
    pregnum INTEGER NOT NULL,
    PRIMARY KEY (appid),
    FOREIGN KEY (pracid) REFERENCES midwives,
    FOREIGN KEY (cid,pregnum) REFERENCES couples (cid,pregnum)
);

CREATE TABLE notes
(
    nid INTEGER NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    appid INTEGER NOT NULL,
    pracid INTEGER,
    PRIMARY KEY (nid),
    FOREIGN KEY (appid) REFERENCES appointments,
    FOREIGN KEY (pracid) REFERENCES midwives
);

CREATE TABLE tests
(
    tid INTEGER NOT NULL,
    labdate DATE,
    sampdate DATE,
    prescdate DATE,
    type VARCHAR(30) NOT NULL,
    result VARCHAR(30),
    techid INTEGER NOT NULL,
    appid INTEGER NOT NULL,
    pracid INTEGER NOT NULL,
    PRIMARY KEY (tid),
    FOREIGN KEY (techid) REFERENCES technicians,
    FOREIGN KEY (appid) REFERENCES appointments,
    FOREIGN KEY (pracid) REFERENCES midwives
);
