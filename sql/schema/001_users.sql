-- +goose Up
CREATE TABLE users (
  id UUID PRIMARY KEY,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  name TEXT NOT NULL UNIQUE
);

-- +goose Down
DROP TABLE users;

-- start or terminate the sql server: sudo service postgresql start/stop
-- connection string: postgres://postgres:postgres@localhost:5432/gator use the psql command to connect to the database
-- goose command: goose -dir ./sql/schema postgres "postgres://postgres:postgres@localhost:5432/gator" up
-- connect to the database: psql postgres://postgres:postgres@localhost:5432/gator, then use \dt to see a list of relations