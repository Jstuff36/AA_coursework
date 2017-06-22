CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE questions_liked (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  questions_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (questions_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Jim', 'Bobberton'),
  ('Bilbo', 'Swaggins');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Lunch', 'What time is lunch?', (SELECT id FROM users WHERE lname = 'Bobberton'));

INSERT INTO
  question_follows (question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'Lunch'), (SELECT id FROM users WHERE lname = 'Swaggins'));

INSERT INTO
  replies (body, question_id, parent_reply_id, user_id)
VALUES
  ('1215 PM', 1, NULL, 1);
