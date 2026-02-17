SET search_path TO spotify;

CREATE TABLE users (
    user_id BIGSERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    subscription_type VARCHAR(20)
        CHECK (subscription_type IN ('free', 'premium')),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE artists (
    artist_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE albums (
    album_id BIGSERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    artist_id BIGINT REFERENCES artists(artist_id),
    release_date DATE
);

CREATE TABLE tracks (
    track_id BIGSERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    duration_seconds INT NOT NULL,
    album_id BIGINT REFERENCES albums(album_id),
    artist_id BIGINT REFERENCES artists(artist_id)
);

CREATE TABLE playlists (
    playlist_id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(user_id),
    name VARCHAR(150) NOT NULL,
    is_collaborative BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE playlist_tracks (
    playlist_id BIGINT REFERENCES playlists(playlist_id),
    track_id BIGINT REFERENCES tracks(track_id),
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (playlist_id, track_id)
);

CREATE TABLE likes (
    user_id BIGINT REFERENCES users(user_id),
    track_id BIGINT REFERENCES tracks(track_id),
    liked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, track_id)
);

CREATE TABLE user_follows (
    follower_id BIGINT REFERENCES users(user_id),
    following_id BIGINT REFERENCES users(user_id),
    followed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (follower_id, following_id)
);

CREATE TABLE user_artist_follows (
    user_id BIGINT REFERENCES users(user_id),
    artist_id BIGINT REFERENCES artists(artist_id),
    followed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, artist_id)
);

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'spotify';










