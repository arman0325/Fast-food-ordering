CREATE TABLE food (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL,
    availability BOOLEAN NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE attachment (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    filename VARCHAR(255) DEFAULT NULL,
    content_type VARCHAR(255) DEFAULT NULL,
    content BLOB DEFAULT NULL,
    food_id INTEGER DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (food_id) REFERENCES food(id)
);

CREATE TABLE comment (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    timestamp VARCHAR(50) NOT NULL,
    food_id INTEGER DEFAULT NULL,
    userName VARCHAR(50) NOT NULL,
    contents VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO food (name, description, price, availability) VALUES 
('Fish and Chips', 'An yummy Fish and Chips!', 15.5, true);

INSERT INTO food (name, description, price, availability) VALUES 
('Hamburger', 'A big Hamburger with cheese!', 20.5, true);

INSERT INTO comment (timestamp, food_id, userName, contents) VALUES 
('2021.04.20.19.42.04', 1, 'tim', 'Good!!');
