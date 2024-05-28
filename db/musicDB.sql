CREATE DATABASE IF NOT EXISTS music_db;

USE music_db;

CREATE TABLE IF NOT EXISTS artists (
    id_artist int primary key,
    name varchar(100) NOT NULL,
    surname varchar(100) NOT NULL,
    username varchar(100) NOT NULL UNIQUE,
    email varchar(500),
    telephone varchar(500),
    description varchar(10000)
);

CREATE TABLE IF NOT EXISTS songs (
    id_song int primary key,
    title varchar(100) NOT NULL,
    genre varchar(100) NOT NULL,
    duration varchar(500),
    album_name varchar(500),
    hot_hit enum('yes','no')
);

CREATE TABLE IF NOT EXISTS collaborations (
    id_collaboration int primary key,
    id_artist int,
    id_song int,
    date_collaboration date NOT NULL,
    role varchar(500) NOT NULL,
    royalties_percentage DECIMAL(5, 2) NOT NULL,
    foreign key (id_artist) references artists(id_artist),
    foreign key (id_song) references songs(id_song)
);

/* USE music_db;
SELECT songs.*, GROUP_CONCAT(artists.name, ' ', artists.surname) AS artists
FROM songs
LEFT JOIN collaborations ON songs.id_song = collaborations.id_song
LEFT JOIN artists ON collaborations.id_artist = artists.id_artist
WHERE songs.title = 'sicko mode'
GROUP BY songs.id_song;

SELECT count(*)
FROM artists JOIN collaborations ON artists.id_artist = collaborations.id_artist JOIN songs ON songs.id_song = collaborations.id_song
WHERE songs.title = 'Sicko Mode'
GROUP BY songs.id;

SELECT artists.*
FROM artists JOIN collaborations ON artists.id_artist = collaborations.id_artist JOIN songs ON songs.id_song = collaborations.id_song
WHERE songs.title = 'Sicko Mode'; */
