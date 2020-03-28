CREATE DATABASE IF NOT EXISTS gdhe;
USE gdhe;

CREATE TABLE subject(
    subject_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    required_class_hours INTEGER(2) NOT NULL
);

CREATE TABLE classroom(
    classroom_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE major(
    major_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE `group`(
    group_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    approved TINYINT(1) NOT NULL,
    group_letter CHAR(1) NOT NULL,
    semester INTEGER(2) NOT NULL,
    major_id INTEGER NOT NULL,
    FOREIGN KEY (major_id) REFERENCES major(major_id),
    UNIQUE(group_letter, semester, major_id)
);

CREATE TABLE student(
    student_id INTEGER(4) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(90) NOT NULL,
    first_last_name VARCHAR(30) NOT NULL,
    second_last_name VARCHAR(30) NOT NULL,
    password VARCHAR(50) NOT NULL,
    major_id INTEGER NOT NULL,
    group_id INTEGER NOT NULL,
    FOREIGN KEY (major_id) REFERENCES major(major_id),
    FOREIGN KEY (group_id) REFERENCES `group`(group_id)
);

CREATE TABLE professor(
    professor_id INTEGER(4) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
    password VARCHAR(50) NOT NULL,
    name VARCHAR(90) NOT NULL,
    first_last_name VARCHAR(30) NOT NULL,
    second_last_name VARCHAR(30) NOT NULL
);

CREATE TABLE admin(
    admin_id INTEGER(4) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(90) NOT NULL,
    first_last_name VARCHAR(30) NOT NULL,
    second_last_name VARCHAR(30) NOT NULL,
    password VARCHAR(50) NOT NULL
);

CREATE TABLE course(
    course_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    professor_id INTEGER(4) ZEROFILL NOT NULL,
    subject_id INTEGER NOT NULL,
    group_id INTEGER NOT NULL,
    FOREIGN KEY (professor_id) REFERENCES professor(professor_id),
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id),
    FOREIGN KEY (group_id) REFERENCES `group`(group_id),
    UNIQUE(professor_id, subject_id, group_id)
);

CREATE TABLE class(
    class_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    start_hour TIME(4) NOT NULL,
    end_hour TIME(4) NOT NULL,
    weekday VARCHAR(10) NOT NULL,
    classroom_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    FOREIGN KEY (classroom_id) REFERENCES classroom(classroom_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);
