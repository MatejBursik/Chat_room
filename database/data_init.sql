USE chat_room_db;

INSERT INTO users (id, username, password, pictureURL, color) VALUES (1, 'deleted_user', 'admin', 'deleted_user.png', '#000000');

-- optional data
INSERT INTO users (username, password, pictureURL, color) VALUES ('john_doe', 'password1', 'john_doe.png', '#2144fb');
INSERT INTO users (username, password, pictureURL, color) VALUES ('jane_doe', 'password2', 'jane_doe.png', '#631ac6');
INSERT INTO chat_rooms (name, pictureURL, createdBy) VALUES ('test_room', 'test_room.png', 2);
INSERT INTO can_access (userID, chatRoomID) VALUES (2, 1);
INSERT INTO messages (messageText, sendBy, chatRoomID) VALUES ('test 1', 2, 1);
INSERT INTO messages (messageText, sendBy, chatRoomID) VALUES ('test 2', 3, 1);
INSERT INTO messages (messageText, chatRoomID) VALUES ('test 3', 1);
DELETE FROM users WHERE id = 3;
