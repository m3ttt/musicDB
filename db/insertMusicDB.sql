USE music_db;

-- Artisti
INSERT INTO artists (id_artist, name, surname, username, email, telephone, description) VALUES
(1, 'Jacques', 'Webster II', 'Travis Scott', 'travis.scott@astroworld.com', '123-456-7890', 'American rapper, singer, songwriter, and record producer. Known for his unique sound and energetic performances.'),
(2, 'Kendrick', 'Duckworth', 'Kendrick Lamar', 'kingkunta@gmail.com', '987-654-3210', 'American rapper, songwriter, and record producer. Renowned for his thought-provoking lyrics and socially conscious themes.'),
(3, 'Symere', 'Woods', 'Lil Uzi Vert', 'uzigang@gmail.com', '555-555-5555', 'American rapper, singer, and songwriter. Recognized for his melodic style and innovative approach to hip-hop.'),
(4, 'Jermaine', 'Cole', 'J. Cole', 'coleworld@dreamville.com', '444-555-6666', 'American rapper, singer, and songwriter. Known for his introspective storytelling and insightful commentary on life and society.'),
(5, 'Austin', 'Post', 'Post Malone', 'posty@postmalone.com', '777-888-9999', 'American rapper, singer, and songwriter. Celebrated for his genre-blending music and laid-back demeanor.'),
(6, 'Donald', 'Glover', 'Childish Gambino', 'donaldglover@pharos.earth', '123-123-1234', 'American rapper, singer, actor, writer, and producer. Notable for his versatility and boundary-pushing creativity.'),
(7, 'Aubrey', 'Graham', 'Drake', 'champagnepapi@ovo.com', '111-222-3333', 'Canadian rapper, singer, and songwriter. Known for his catchy hooks and emotional vulnerability in his music.');

-- PRODUCERS
INSERT INTO artists (id_artist, name, surname, username, email, telephone, description) VALUES
(8, 'Michael', 'Dean', 'MIKE DEAN', 'mikedean@gmail.com', '123-456-7890', 'American record producer, audio engineer, and musician. Known for his work as a producer for various hip-hop artists.'),
(9, 'Michael', 'Williams II', 'Mike Will Made-It', 'mikewill@gmail.com', '987-654-3210', 'American record producer, rapper, and songwriter. Notable for producing hit singles for various artists.'),
(10, 'Leland', 'Wayne', 'Metro Boomin', 'metroboomin@gmail.com', '555-555-5555', 'American record producer, record executive, songwriter, and DJ. Known for his distinct tag, "If Young Metro don\'t trust you, I\'m gon\' shoot you".');

-- Canzoni
INSERT INTO songs (id_song, title, genre, duration, album_name, hot_hit) VALUES
(1, 'SICKO MODE', 'Hip-Hop', '5:12', 'ASTROWORLD', 'yes'),
(2, 'HUMBLE.', 'Hip-Hop', '3:04', 'DAMN.', 'yes'),
(3, 'XO Tour Llif3', 'Hip-Hop', '3:02', 'Luv Is Rage 2', 'yes'),
(4, 'No Role Modelz', 'Hip-Hop', '4:52', '2014 Forest Hills Drive', 'yes'),
(5, 'rockstar', 'Hip-Hop', '3:38', 'beerbongs & bentleys', 'no'),
(6, 'This Is America', 'Hip-Hop', '3:46', 'Single', 'no'),
(7, 'Hotline Bling', 'Hip-Hop', '4:27', 'Views', 'no');


-- Travis Scott - SICKO MODE
INSERT INTO collaborations (id_collaboration, id_artist, id_song, date_collaboration, role, royalties_percentage) VALUES
(1, 1, 1, '2018-08-21', 'Main Artist', 75);

-- Kendrick Lamar - HUMBLE.
INSERT INTO collaborations (id_collaboration, id_artist, id_song, date_collaboration, role, royalties_percentage) VALUES
(2, 2, 2, '2017-03-30', 'Main Artist', 70);

-- Lil Uzi Vert - XO Tour Llif3
INSERT INTO collaborations (id_collaboration, id_artist, id_song, date_collaboration, role, royalties_percentage) VALUES
(3, 3, 3, '2017-03-24', 'Main Artist', 63.76);

-- J. Cole - No Role Modelz
INSERT INTO collaborations (id_collaboration, id_artist, id_song, date_collaboration, role, royalties_percentage) VALUES
(4, 4, 4, '2014-12-09', 'Main Artist', 100);

-- Post Malone - rockstar
INSERT INTO collaborations (id_collaboration, id_artist, id_song, date_collaboration, role, royalties_percentage) VALUES
(5, 5, 5, '2017-09-15', 'Main Artist', 80);

-- Donald Glover - This Is America
INSERT INTO collaborations (id_collaboration, id_artist, id_song, date_collaboration, role, royalties_percentage) VALUES
(6, 6, 6, '2018-05-05', 'Main Artist', 100);

-- Aubrey Graham - Hotline Bling
INSERT INTO collaborations (id_collaboration, id_artist, id_song, date_collaboration, role, royalties_percentage) VALUES
(7, 7, 7, '2015-07-31', 'Main Artist', 100);


-- Collaborations - PRODUCERS
-- Mike Dean - SICKO MODE (come producer)
INSERT INTO collaborations (id_collaboration, id_artist, id_song, date_collaboration, role, royalties_percentage) VALUES
(8, 8, 1, '2018-08-21', 'Producer', 25);

-- Mike WiLL Made-It - HUMBLE. (come producer)
INSERT INTO collaborations (id_collaboration, id_artist, id_song, date_collaboration, role, royalties_percentage) VALUES
(9, 9, 2, '2017-03-30', 'Producer', 30);

-- Metro Boomin - rockstar (come producer)
INSERT INTO collaborations (id_collaboration, id_artist, id_song, date_collaboration, role, royalties_percentage) VALUES
(10, 10, 5, '2017-09-15', 'Producer', 20);

INSERT INTO artists (id_artist, name, surname, username, email, telephone, description)
VALUES (11, 'Bryan', 'Simmons', 'TM88', 'tm88@example.com', '123-456-7890', 'American record producer and DJ known for his work in the trap genre. Collaborated with numerous artists including Lil Uzi Vert, Future, and Travis Scott.');

INSERT INTO collaborations (id_collaboration, id_artist, id_song, date_collaboration, role, royalties_percentage)
VALUES (11, 11, 3, '2022-05-12', 'Producer', 36.24);

USE music_db;
/* SELECT songs.*, GROUP_CONCAT(artists.username) AS artists
FROM (songs JOIN collaborations USING (id_song)) JOIN artists USING (id_artist)
WHERE songs.id_song IN (
        SELECT id_song 
        FROM collaborations 
        JOIN artists USING (id_artist)
        WHERE artists.username = "Travis Scott"
    )
GROUP BY songs.id_song; */


/* USE music_db;
SELECT username, role, royalties_percentage FROM (collaborations JOIN artists USING(id_artist)) JOIN songs USING(id_song)
WHERE songs.title = "XO Tour Llif3";

USE music_db;
SELECT * FROM artists WHERE username = "Travis Scott";





USE music_db;
SELECT title, genre, duration, album_name, hot_hit FROM (collaborations JOIN artists USING(id_artist)) JOIN songs USING(id_song)
WHERE artists.username = "Travis Scott"; */

