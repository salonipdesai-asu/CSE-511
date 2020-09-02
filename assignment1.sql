create table users (
userid INTEGER PRIMARY KEY NOT NULL, 
name TEXT NOT NULL
);

create table movies (
movieid INTEGER PRIMARY KEY NOT NULL,
title TEXT NOT NULL
);

create table taginfo (
tagid INTEGER PRIMARY KEY NOT NULL,
content TEXT NOT NULL
);

create table genres(
genreid INTEGER PRIMARY KEY NOT NULL,
name TEXT NOT NULL
);

create table ratings(
userid INTEGER NOT NULL,
movieid INTEGER NOT NULL,
rating NUMERIC NOT NULL CHECK (rating >=0 and rating <=5),
timestamp BIGINT NOT NULL, 
PRIMARY KEY (userid, movieid),
FOREIGN KEY(movieid) references movies ON DELETE CASCADE,
FOREIGN KEY(userid) references users ON DELETE CASCADE
);

create table tags (
userid INTEGER NOT NULL, 
movieid INTEGER NOT NULL, 
tagid INTEGER NOT NULL,
timestamp BIGINT NOT NULL,
PRIMARY KEY ( userid, movieid, tagid, timestamp),
FOREIGN KEY(userid) references users(userid) ON DELETE CASCADE,
FOREIGN KEY(movieid) references movies(movieid) ON DELETE CASCADE,
FOREIGN KEY(tagid) references taginfo(tagid) ON DELETE CASCADE
);

create table hasagenre(
movieid INTEGER NOT NULL,
genreid INTEGER NOT NULL,
PRIMARY KEY (movieid, genreid),
FOREIGN KEY (movieid) references movies(movieid) ON DELETE CASCADE,
FOREIGN KEY (genreid) references genres(genreid) ON DELETE CASCADE);
