-- =========================================
-- 02_demo_data.sql
-- Demo records for analytical testing
-- Matches schema in your file. Referenced schema: see uploaded spotify 1_notepad.txt. :contentReference[oaicite:1]{index=1}
-- =========================================

-- ----- ARTISTS -----
INSERT INTO spotify.artists (artist_id, name, genre, country) VALUES
(1, 'Arijit Singh', 'Bollywood', 'India'),
(2, 'Shreya Ghoshal', 'Bollywood', 'India'),
(3, 'The Weeknd', 'Pop', 'Canada'),
(4, 'Dua Lipa', 'Pop', 'UK'),
(5, 'A. R. Rahman', 'Soundtrack', 'India');

-- ----- ALBUMS -----
INSERT INTO spotify.albums (album_id, title, artist_id, release_date) VALUES
(1, 'Romantic Hits', 1, '2020-02-14'),
(2, 'Melody Queen', 2, '2021-08-10'),
(3, 'After Hours', 3, '2020-03-20'),
(4, 'Future Nostalgia', 4, '2020-04-01'),
(5, 'Scores', 5, '2018-11-05');

-- ----- TRACKS -----
INSERT INTO spotify.tracks (track_id, title, duration_seconds, album_id, artist_id) VALUES
(1, 'Tum Hi Ho', 240, 1, 1),
(2, 'Raabta', 210, 1, 1),
(3, 'Sun Raha Hai', 230, 2, 2),
(4, 'Blinding Lights', 200, 3, 3),
(5, 'In Your Eyes', 215, 3, 3),
(6, 'Levitating', 205, 4, 4),
(7, 'Naatu Naatu', 185, 5, 5),
(8, 'Jiya', 195, 5, 5),
(9, 'New Ballad', 270, 2, 2),
(10,'Acoustic Hit', 150, NULL, 1);

-- ----- USERS -----
INSERT INTO spotify.users (user_id, username, email, subscription_type, registration_date) VALUES
(1, 'ramchandra', 'ram@example.com', 'premium', '2024-10-05 09:12:00'),
(2, 'musiclover', 'lover@example.com', 'free', '2024-11-20 15:30:00'),
(3, 'datafan', 'datafan@example.com', 'premium', '2025-01-12 08:00:00'),
(4, 'anita', 'anita@example.com', 'free', '2024-09-03 19:45:00');

-- ----- PLAYLISTS -----
INSERT INTO spotify.playlists (playlist_id, user_id, name, is_collaborative, created_at) VALUES
(1, 1, 'Top Bollywood', FALSE, '2025-01-18 10:00:00'),
(2, 2, 'Workout Mix', TRUE, '2025-02-01 08:20:00'),
(3, 3, 'Chill Evenings', FALSE, '2025-01-25 21:00:00');

-- ----- PLAYLIST_TRACKS -----
INSERT INTO spotify.playlist_tracks (playlist_id, track_id, added_at) VALUES
(1,1,'2025-01-18 10:05:00'),
(1,2,'2025-01-18 10:06:00'),
(1,7,'2025-01-18 10:08:00'),
(2,4,'2025-02-01 08:25:00'),
(2,6,'2025-02-01 08:26:00'),
(3,5,'2025-01-26 21:15:00'),
(3,8,'2025-01-26 21:16:00');

-- ----- LIKES -----
INSERT INTO spotify.likes (user_id, track_id, liked_at) VALUES
(1,4,'2025-02-02 12:00:00'),
(2,1,'2025-02-03 14:10:00'),
(3,6,'2025-02-04 18:22:00'),
(1,3,'2025-02-05 09:00:00'),
(4,7,'2025-01-20 11:00:00');

-- ----- USER_FOLLOWS (user -> user) -----
INSERT INTO spotify.user_follows (follower_id, following_id, followed_at) VALUES
(2,1,'2025-01-19 09:00:00'),
(3,1,'2025-01-20 10:10:00'),
(4,2,'2025-02-01 07:00:00');

-- ----- USER_ARTIST_FOLLOWS -----
INSERT INTO spotify.user_artist_follows (user_id, artist_id, followed_at) VALUES
(1,3,'2025-01-18 10:15:00'),
(1,5,'2025-01-19 12:00:00'),
(2,1,'2025-02-01 09:00:00'),
(3,2,'2025-02-04 13:30:00');

-- Done
