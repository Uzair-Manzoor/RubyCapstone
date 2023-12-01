--create music album table--
CREATE TABLE MUSIC_ALBUM(
    ID INTEGER PRIMARY KEY,
    ON_SPOTIFY BOOLEAN,
    ARCHIVED BOOLEAN,
    PUBLISH_DATE DATE,
    GENRE VARCHAR(100) REFERENCES GENRE(NAME),
    AUTHOR VARCHAR(100) REFERENCES authors(first_name),
    LABEL VARCHAR(100) REFERENCES labels(TITLE),
)

--Create Genre table--
CREATE TABLE IF NOT EXISTS GENRE(
    ID INTEGER,
    NAME CHAR(32) NOT NULL,
    ITEMS INT REFERENCES (books, MUSIC_ALBUM, games),
    PRIMARY KEY(ID, items)
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
