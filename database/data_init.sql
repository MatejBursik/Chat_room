USE chat_room_db;

-- optional data
INSERT INTO users (username, password, pictureURL, color) VALUES ('john_doe', 'password1', 'john_doe.png', '#2144fb');
INSERT INTO users (username, password, pictureURL, color) VALUES ('jane_doe', 'password2', 'jane_doe.png', '#631ac6');
INSERT INTO chat_rooms (name, pictureURL, owner) VALUES ('test_room', 'test_room.png', 1);
INSERT INTO can_access (userID, chatRoomID) VALUES (1, 1);
INSERT INTO can_access (userID, chatRoomID) VALUES (2, 1);
INSERT INTO messages (messageText, sendBy, chatRoomID) VALUES ('test 1', 1, 1);
INSERT INTO messages (messageText, sendBy, chatRoomID) VALUES ('test 2', 2, 1);
INSERT INTO friends (userID1, userID2) VALUES (1, 2);
