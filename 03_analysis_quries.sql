-- =========================================
-- 03_analysis_queries.sql
-- Analytical queries to run after demo data insertion
-- =========================================

-- 1) Basic counts (health check)
SELECT (SELECT COUNT(*) FROM spotify.users) AS users_count,
       (SELECT COUNT(*) FROM spotify.artists) AS artists_count,
       (SELECT COUNT(*) FROM spotify.tracks) AS tracks_count,
       (SELECT COUNT(*) FROM spotify.playlists) AS playlists_count;

-- 2) Artist performance: total tracks and avg duration
SELECT a.artist_id, a.name AS artist,
       COUNT(t.track_id) AS total_tracks,
       ROUND(AVG(t.duration_seconds),2) AS avg_duration_sec
FROM spotify.artists a
LEFT JOIN spotify.tracks t ON a.artist_id = t.artist_id
GROUP BY a.artist_id, a.name
ORDER BY total_tracks DESC;

-- 3) Genre-level summary (tracks & avg duration)
SELECT a.genre,
       COUNT(t.track_id) AS track_count,
       ROUND(AVG(t.duration_seconds),2) AS avg_duration_sec
FROM spotify.artists a
LEFT JOIN spotify.tracks t ON a.artist_id = t.artist_id
GROUP BY a.genre
ORDER BY track_count DESC;

-- 4) Most popular playlists (by number of tracks)
SELECT p.playlist_id, p.name,
       COUNT(pt.track_id) AS track_count
FROM spotify.playlists p
LEFT JOIN spotify.playlist_tracks pt ON p.playlist_id = pt.playlist_id
GROUP BY p.playlist_id, p.name
ORDER BY track_count DESC;

-- 5) Top liked tracks
SELECT t.track_id, t.title, a.name AS artist, COUNT(l.user_id) AS likes
FROM spotify.tracks t
LEFT JOIN spotify.likes l ON t.track_id = l.track_id
LEFT JOIN spotify.artists a ON t.artist_id = a.artist_id
GROUP BY t.track_id, t.title, a.name
ORDER BY likes DESC, t.title
LIMIT 10;

-- 6) Users with most artist follows
SELECT u.user_id, u.username, COUNT(uf.artist_id) AS artists_followed
FROM spotify.users u
LEFT JOIN spotify.user_artist_follows uf ON u.user_id = uf.user_id
GROUP BY u.user_id, u.username
ORDER BY artists_followed DESC;

-- 7) Ranking tracks per artist by duration (window function)
SELECT a.name AS artist, t.title, t.duration_seconds,
       RANK() OVER (PARTITION BY a.artist_id ORDER BY t.duration_seconds DESC) AS duration_rank
FROM spotify.tracks t
JOIN spotify.artists a ON t.artist_id = a.artist_id
ORDER BY a.name, duration_rank
LIMIT 50;

-- 8) Example segmentation: short / medium / long tracks
SELECT duration_segment,
       COUNT(*) AS tracks,
       ROUND(AVG(duration_seconds),2) AS avg_duration
FROM (
    SELECT track_id, duration_seconds,
      CASE
        WHEN duration_seconds < 180 THEN 'Short'
        WHEN duration_seconds BETWEEN 180 AND 240 THEN 'Medium'
        ELSE 'Long'
      END AS duration_segment
    FROM spotify.tracks
) s
GROUP BY duration_segment
ORDER BY tracks DESC;
