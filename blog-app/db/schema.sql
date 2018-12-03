DROP TABLE IF EXISTS comments, images, videos, users, posts;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(150),
  last_name VARCHAR(150),
  username VARCHAR(50) NOT NULL UNIQUE,
  about TEXT,
  picture TEXT,
  email VARCHAR(250),
  facebook TEXT,
  instagram TEXT,
  github TEXT,
  linkedin TEXT,
  twitter TEXT,
  zipcode INTEGER NOT NULL,
  password_digest VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title VARCHAR(250),
  content TEXT,
  category VARCHAR(250),
  user_id INTEGER REFERENCES user (id),
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  content TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  post_id INTEGER REFERENCES post (id),
  user_id INTEGER REFERENCES user (id)
);

CREATE TABLE images (
  id SERIAL PRIMARY KEY,
  img_url TEXT,
  post_id INTEGER REFERENCES post (id),
  user_id INTEGER REFERENCES user (id)
);

CREATE TABLE videos (
  id SERIAL PRIMARY KEY,
  video_url TEXT,
  post_id INTEGER REFERENCES post (id),
  user_id INTEGER REFERENCES user (id)
);

