--create music album table--
CREATE TABLE MUSIC_ALBUM_(
    ID INTEGER PRIMARY KEY,
    ON_SPOTIFY BOOLEAN,
    ARCHIVED BOOLEAN
    PUBLISH_DATE DATE
)

--Create Genre table--
CREATE TABLE IF NOT EXISTS GENRE (
    ID INTEGER PRIMARY KEY,
    NAME CHAR(32) NOT NULL,
)

-- Create the games table
CREATE TABLE games (
  id INT PRIMARY KEY,
  item_id INT, -- A foreign key to reference the parent item table
  title VARCHAR(255),
  publish_date DATE,
  multiplayer BOOLEAN,
  last_played_at DATE,
  archived BOOLEAN DEFAULT false,
  author_id INT, -- Add a foreign key for the author (one-to-many relationship)
  FOREIGN KEY (author_id) REFERENCES authors (id)
);

-- Create the authors table
CREATE TABLE authors (
  id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE books (
    publisher VARCHAR(100),
    cover_state VARCHAR(100),
);

CREATE TABLE labels (
    id  INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    PRIMARY KEY(id)
);