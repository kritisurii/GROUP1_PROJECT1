create database music_s;
use music_s;

create table album( 
       album_id varchar (20) primary key,
       album_name varchar (20) not null
);

INSERT INTO album(album_id, album_name) VALUES("a1", "Bollywood");
INSERT INTO album(album_id, album_name) VALUES("a2", "Hollywood");

create table artist (
       aid varchar (20) primary key,
       aname varchar (20) not null,about varchar(1000) 
);

INSERT INTO artist(aid, aname) VALUES("1", "Imtiaz Ali");
INSERT INTO artist(aid, aname) VALUES("2", "Arijit Singh");
INSERT INTO artist(aid, aname) VALUES("3", "Drake");
INSERT INTO artist(aid, aname) VALUES("4", "Rihanna");


create table song (
       sid varchar (20) primary key,
       sname varchar (20) not null,
       album_id varchar (20) not null,
       genre varchar(20),
       play_count int not null,
       song_num int
);

INSERT INTO song(sid, sname, album_id, genre, play_count, song_num) VALUES("111", "Ghagra", "a1", "Dance", "21", "54");
INSERT INTO song(sid, sname, album_id, genre, play_count, song_num) VALUES("112", "Musafir", "a1", "Romantic", "99", "87");
INSERT INTO song(sid, sname, album_id, genre, play_count, song_num) VALUES("157", "Demons", "a2", "Pop", "17", "117");
INSERT INTO song(sid, sname, album_id, genre, play_count, song_num) VALUES("432", "Different Worlds", "a2", "Romantic", "99", "225");

create table song_artist (
       sid varchar (20) not null,
       aid varchar (20) not null,
       primary key(sid, aid)
);

INSERT INTO song_artist(sid, aid) VALUES("112", "5");
INSERT INTO song_artist(sid, aid) VALUES("111", "7");
INSERT INTO song_artist(sid, aid) VALUES("157", "88");
INSERT INTO song_artist(sid, aid) VALUES("432", "99");


create table album_artist (
       album_id varchar (20) not null,
       aid varchar (20) not null,
       primary key (album_id, aid)
);

INSERT INTO album_artist(album_id, aid) VALUES("a1", "5");
INSERT INTO album_artist(album_id, aid) VALUES("a2", "88");
INSERT INTO album_artist(album_id, aid) VALUES("a1", "7");
INSERT INTO album_artist(album_id, aid) VALUES("a2", "99");

create table history (
       sid varchar (20) not null,
       last_played date not null,
       primary key (sid) 
);

INSERT INTO history(sid, last_played) VALUES("111", "22-02-04");
INSERT INTO history(sid, last_played) VALUES("112", "22-02-07");
INSERT INTO history(sid, last_played) VALUES("157", "22-02-08");
INSERT INTO history(sid, last_played) VALUES("432", "22-01-11");

create table album_song (
       album_id varchar(20),
       sid varchar(20),
       album_name varchar(20),
       sname varchar(20),
       primary key(album_id, sid),
       foreign key (album_id) references album (album_id),
       foreign key (sid) references song(sid)
);

create table artist_song (
       aid varchar (20) , 
       sid varchar (20) ,
       aname varchar(20),
       sname varchar(20),
       song_num varchar(20),
       primary key(aid, sid),
       foreign key (aid) references artist(aid),
       foreign key(sid) references song (sid)
);

create table artist_lastplayed (
             aid varchar (20) ,
             sid varchar (20) ,
             aname varchar(20),
             last_played date,
             primary key(aid, sid),
             foreign key(aid) references artist(aid)
);

create table artist_genre (
             aid varchar(20),sid varchar (20) ,
             aname varchar(20),
             genre varchar(20),
             primary key(aid, sid),
             foreign key(aid) references artist (aid),
             foreign key(sid) references song(sid)
);
