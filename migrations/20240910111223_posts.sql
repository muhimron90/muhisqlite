-- +goose Up
-- +goose StatementBegin
CREATE TABLE posts(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  createdAt DATETIME NOT NULL
);
-- +goose StatementEnd
INSERT INTO posts (
  title, content, createdAt
) VALUES ('The joy of CODING 1', 'coding 1', datetime('now','localtime'));
INSERT INTO posts (
  title, content, createdAt
) VALUES ('The joy of CODING 2', 'coding 2', datetime('now','localtime'));
INSERT INTO posts (
  title, content, createdAt
) VALUES ('The joy of CODING 3', 'coding 3', datetime('now','localtime'));
INSERT INTO posts (
  title, content, createdAt
) VALUES ('The joy of CODING 4', 'coding 4', datetime('now','localtime'));
-- +goose Down
-- +goose StatementBegin
DROP TABLE posts;
-- +goose StatementEnd
