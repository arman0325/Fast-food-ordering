/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  arman
 * Created: 2021年4月26日
 */
CREATE TABLE users (
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    fullName VARCHAR(255) NOT NULL,
    phone VARCHAR(8) NOT NULL,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (username)
);

CREATE TABLE user_roles (
    user_role_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    username VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_role_id),
    FOREIGN KEY (username) REFERENCES users(username)
);

INSERT INTO users(username, password, fullName, phone, address) VALUES ('tim', '{noop}timpw', 'Yuen Yiu Man', '66227788', 'Kwai Chung');
INSERT INTO user_roles(username, role) VALUES ('tim', 'ROLE_ADMIN');

INSERT INTO users(username, password, fullName, phone, address) VALUES ('peter', '{noop}peterpw', 'Yu Hui', '57448993', 'Kowloon Tong');
INSERT INTO user_roles(username, role) VALUES ('peter', 'ROLE_USER');

INSERT INTO users(username, password, fullName, phone, address) VALUES ('ugly', '{noop}ugly', 'Perez', '34321809', 'Bernabeu');
INSERT INTO user_roles(username, role) VALUES ('ugly', 'ROLE_USER');

CREATE TABLE records(
    order_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    username VARCHAR(50) NOT NULL,
    orderlist VARCHAR(255) NOT NULL,
    orderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (order_id)
);

INSERT INTO records(username, orderlist) VALUES ('peter', '{Hamburger=1, Big mac=2}');

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
    PRIMARY KEY (id),
    FOREIGN KEY (food_id) REFERENCES food(id)
);

INSERT INTO food (name, description, price, availability) VALUES 
('Fish and Chips', 'An yummy Fish and Chips!', 15.5, true);

INSERT INTO food (name, description, price, availability) VALUES 
('Hamburger', 'A big Hamburger with cheese!', 20.5, true);

INSERT INTO comment (timestamp, food_id, userName, contents) VALUES 
('2021.04.20.19.42.04', 1, 'tim', 'Good!!');