DROP TABLE IF EXISTS users, posts, comments, images, videos;

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
  twitter VARCHAR(300),
  password_digest VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
)