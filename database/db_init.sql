CREATE DATABASE IF NOT EXISTS chat_room_db;

USE chat_room_db;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(100),
    pictureURL VARCHAR(100),
    color VARCHAR(7),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS chat_rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    pictureURL VARCHAR(100),
    owner INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (owner) REFERENCES users(id) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS can_access (
    userID INT,
    chatRoomID INT,
    FOREIGN KEY (userID) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (chatRoomID) REFERENCES chat_rooms(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    messageText VARCHAR(500),
    chatRoomID INT,
    sendBy INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (chatRoomID) REFERENCES chat_rooms(id) ON DELETE CASCADE,
    FOREIGN KEY (sendBy) REFERENCES users(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS friends (
    userID1 INT,
    userID2 INT,
    FOREIGN KEY (userID1) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (userID2) REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
