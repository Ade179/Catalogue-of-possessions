CREATE TABLE authors(
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE games(
    id INT GENERATED ALWAYS AS IDENTITY,
    genre_id INT REFERENCES genres(id),
    author_id INT REFERENCES authors(id),
    source_id INT REFERENCES sources(id),
    label_id INT REFERENCES labels(id),
    publish_date DATE,
    archived BOOL,
    multiplayer BOOL,
    last_played_at DATE,
    PRIMARY KEY (id)
);
