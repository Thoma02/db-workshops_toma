CREATE DATABASE IF NOT EXISTS uni;

--@block
DROP DATABASE uni;

--@block
USE uni;

--@block
CREATE TABLE IF NOT EXISTS Students (
  id integer PRIMARY KEY AUTO_INCREMENT,
  name varchar(128) NOT NULL,
  age integer
);

--@block
CREATE TABLE IF NOT EXISTS Teachers (
  id integer AUTO_INCREMENT,
  name varchar(128) NOT NULL,
  age integer,
  PRIMARY KEY (id)
);

--@block
CREATE TABLE IF NOT EXISTS Competencies (
  id integer AUTO_INCREMENT,
  title varchar(128) NOT NULL,
  PRIMARY KEY (id)
);

--@block
CREATE TABLE IF NOT EXISTS TeachersToCompetencies (
  id integer AUTO_INCREMENT,
  teacher_id integer,
  competencies_id integer,
  FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE NO ACTION,
  FOREIGN KEY (competencies_id) REFERENCES Competencies(id),
  PRIMARY KEY (id)
);

--@block
CREATE TABLE IF NOT EXISTS Courses (
  id integer AUTO_INCREMENT,
  teacher_id integer,
  title varchar(128) NOT NULL,
  headman_id integer,
  FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE NO ACTION,
  FOREIGN KEY (headman_id) REFERENCES Students(id) ON DELETE SET NULL,
  PRIMARY KEY (id)
);

--@block
CREATE TABLE IF NOT EXISTS StudentsToCourses (
  id integer AUTO_INCREMENT,
  student_id integer,
  course_id integer,
  FOREIGN KEY (student_id) REFERENCES Students(id) ON DELETE CASCADE,
  FOREIGN KEY (course_id) REFERENCES Courses(id) ON DELETE CASCADE,
  PRIMARY KEY (id)
);

--@block
-- Values
INSERT INTO Students (name, age)
VALUES ('Charles R.Campbell', 22),
  ('Brian L.Forrest', 23),
  ('Robert K.Lucas', 23),
  ('Melissa B.Lopez', 51),
  ('Jessica M.Farrell', 21),
  ('Inez J.Michel', 36);

--@block
INSERT INTO Teachers (name, age)
VALUES ('Lois C.Holmes', 44),
  ('Evelyn E.Anderson', 38),
  ('James D.Brown', 56),
  ('Randall L.Smith', 66),
  ('Roy S.Barron', 53),
  ('Kathy G.Howe', 48);

--@block
INSERT INTO Competencies (title)
VALUES ('Mathematics'),
  ('Computer science'),
  ('Programming'),
  ('Graphic arts');

--@block
INSERT INTO TeachersToCompetencies (teacher_id, competencies_id)
VALUES (1, 1),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 1),
  (5, 3);

--@block
INSERT INTO Courses (teacher_id, title, headman_id)
VALUES (1, 'Algebra of logic', 2),
  (2, 'Mathematical statistics', 3),
  (4, 'Higher mathematics', 5),
  (5, 'Javascript', 1),
  (5, 'Basic Python', 1);

--@block
INSERT INTO StudentsToCourses (student_id, course_id)
VALUES (1, 1),
  (2, 1),
  (3, 2),
  (3, 3),
  (4, 5);

--@block
SELECT *
FROM Courses

--@block
DELETE FROM Students
WHERE id = 1;


