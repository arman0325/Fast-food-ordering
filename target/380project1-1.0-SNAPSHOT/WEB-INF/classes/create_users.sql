CREATE TABLE users (
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
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

CREATE TABLE Accounts(
    id INT GENERATED ALWAYS AS IDENTITY not null primary key,
    username VARCHAR(16) NOT NULL,
    password VARCHAR(16) NOT NULL,
    fullName VARCHAR(255) NOT NULL,
    phone VARCHAR(8) NOT NULL,
    address VARCHAR(255) NOT NULL
);

INSERT INTO users VALUES ('keith', '{noop}keithpw');
INSERT INTO user_roles(username, role) VALUES ('keith', 'ROLE_USER');
INSERT INTO user_roles(username, role) VALUES ('keith', 'ROLE_ADMIN');

INSERT INTO users VALUES ('vanessa', '{noop}vanessapw');
INSERT INTO user_roles(username, role) VALUES ('vanessa', 'ROLE_ADMIN');

INSERT INTO users VALUES ('kevin', '{noop}kevinpw');
INSERT INTO user_roles(username, role) VALUES ('kevin', 'ROLE_USER');
