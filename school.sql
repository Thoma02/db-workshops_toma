USE hr;


--@block
CREATE DATABASE school_database;

--@block
DROP DATABASE school_database;


--@block
CREATE TABLE students (
  students_id INT NOT NULL AUTO_INCREMENT,
  students_name VARCHAR(128),
  students_age INT,
  PRIMARY KEY (students_id)
);


--@block
CREATE TABLE teachers (
  teachers_id INT NOT NULL AUTO_INCREMENT,
  teachers_name VARCHAR(128) NOT NULL,
  teachers_age INT,
  PRIMARY KEY (teachers_id)
);


--@block
CREATE TABLE competencies (
  competencies_id INT NOT NULL AUTO_INCREMENT,
  competencies_title VARCHAR(128) NOT NULL,
  PRIMARY KEY (competencies_id)
);


--@block
CREATE TABLE teachers_to_competencies (
  teach_comp_id INT NOT NULL AUTO_INCREMENT,
  teachers_id INT,
  competencies_id INT,
  PRIMARY KEY (teach_comp_id)
);


--@block
CREATE TABLE courses (
  courses_id INT NOT NULL AUTO_INCREMENT,
  teachers_id INT,
  competencies_title VARCHAR(128) NOT NULL,
  headman_id INT,
  PRIMARY KEY (courses_id)
);


--@block
CREATE TABLE students_to_courses (
  stud_course_id INT NOT NULL AUTO_INCREMENT,
  students_id INT,
  courses_id INT,
  PRIMARY KEY (stud_course_id)
) 

--@block
INSERT INTO students(students_name, students_age)
VALUES ("Robert", 38),
  ("Joan", 27),
  ("Lilith", 22),
  ("Vasil", 29),
  ("Ricardo", 35),
  ("Maria", 43);

--@block
INSERT INTO teachers(teachers_name, teachers_age)
VALUES ("Leo", 46),
  ("Janneth", 53),
  ("Eva", 39),
  ("George", 34),
  ("Silvia", 28),
  ("Johannes", 32);

--@block
INSERT INTO competencies(competencies_title)
VALUES ("Mathematics"),
  ("Computer Science"),
  ("Programming"),
  ("Graphic Arts");

--@block
SELECT * FROM courses;

--@block
ALTER TABLE courses RENAME COLUMN competencies_title TO courses_title;

--@block
INSERT INTO teachers_to_competencies(teachers_id, competencies_id)
VALUES (1, 1), (2, 1), (2, 3), (3, 2), (4, 1), (5, 3);

--@block
INSERT INTO courses(teachers_id, courses_title, headman_id)
VALUES (1, "Algebra of logic", 2),
(2, "Mathematical Statistics", 3),
(4, "Higher Mathematics", 5),
(5, "Javascript", 1),
(5, "Basic Python", 1);

--@block
INSERT INTO students_to_courses(students_id, courses_id)
VALUES (1, 1), (2, 1), (3, 2), (3, 3), (4, 5);