CREATE DATABASE CatalogOfThings;
USE CatalogOfMyThings;

CREATE TABLE item (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    publish_date DATE,
    publisher VARCHAR(255),
    cover_state VARCHAR(255)
    archived BOOLEAN,
    label_id INT, -- Add a foreign key for the label (one-to-many relationship)
    genre_id INT, -- Add a foreign key for the genre (one-to-many relationship)
    author_id INT, -- Add a foreign key for the author (one-to-many relationship)
    FOREIGN KEY (label_id) REFERENCES labels (id)  
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (author_id) REFERENCES authors (id),
);

--create music album table--
CREATE TABLE music_album(
	id INT NOT NULL,
	on_spotify BOOLEAN,
	FOREIGN KEY (id) REFERENCES item (id)
);
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