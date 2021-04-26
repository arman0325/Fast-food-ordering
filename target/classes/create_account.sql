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

CREATE TABLE comments (
    commentId VARCHAR(50) NOT NULL,
    itemId VARCHAR(50) NOT NULL,
    userName VARCHAR(50) NOT NULL,
    contents VARCHAR(50) NOT NULL,
    PRIMARY KEY (commentId)
);

INSERT INTO users(username, password, fullName, phone, address) VALUES ('tim', '{noop}timpw', 'Yuen Yiu Man', '66227788', 'Kwai Chung');
INSERT INTO user_roles(username, role) VALUES ('tim', 'ROLE_ADMIN');

INSERT INTO users(username, password, fullName, phone, address) VALUES ('peter', '{noop}peterpw', 'Yu Hui', '57448993', 'Kowloon Tong');
INSERT INTO user_roles(username, role) VALUES ('peter', 'ROLE_USER');

