
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    department VARCHAR(50)
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    department VARCHAR(50)
);

CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Student VALUES 
(1, 'Harshita', 20, 'Female', 'CSE'),
(2, 'Vikhil', 21, 'Male', 'ECE'),
(3, 'Kush', 22, 'Male', 'CSE'),
(4, 'lia', 20, 'Female', 'EEE');

INSERT INTO Course VALUES
(101, 'Data Structures', 'CSE'),
(102, 'Digital Circuits', 'ECE'),
(103, 'Microprocessors', 'EEE'),
(104, 'Algorithms', 'CSE');

INSERT INTO Enrollment VALUES
(1, 1, 101, 85),
(2, 2, 102, 78),
(3, 3, 101, 92),
(4, 1, 104, 88),
(5, 4, 103, 74),
(6, 3, 104, 81);


SELECT * FROM Student;

SELECT * FROM Student
WHERE department = 'CSE';

SELECT * FROM Student
WHERE age > 20
ORDER BY age DESC;

SELECT department, COUNT(*) AS student_count
FROM Student
GROUP BY department;

SELECT s.name, c.course_name, e.marks
FROM Enrollment e
JOIN Student s ON e.student_id = s.student_id
JOIN Course c ON e.course_id = c.course_id;

SELECT c.course_name, AVG(e.marks) AS avg_marks
FROM Enrollment e
JOIN Course c ON e.course_id = c.course_id
GROUP BY c.course_name;

SELECT s.name, c.course_name, e.marks
FROM Enrollment e
JOIN Student s ON e.student_id = s.student_id
JOIN Course c ON e.course_id = c.course_id
WHERE e.marks > 80;

SELECT s.name, COUNT(e.course_id) AS total_courses
FROM Student s
JOIN Enrollment e ON s.student_id = e.student_id
GROUP BY s.name;
