-- =========================================================
-- Grace: Faculty table
-- =========================================================
CREATE TABLE Faculty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL
);
 
-- Grace: sample data
INSERT INTO Faculty (name, email, department) VALUES
('Dr. Alice Uwase',    'a.uwase@alu.edu',    'Computer Science'),
('Dr. Brian Mugisha',  'b.mugisha@alu.edu',  'Mathematics'),
('Ms. Clara Niyonsaba', 'c.niyonsaba@alu.edu', 'Business'),
('Mr. David Habimana', 'd.habimana@alu.edu', 'Engineering'),
('Dr. Esther Mukamana','e.mukamana@alu.edu', 'Humanities');
 
-- Grace: update
UPDATE Faculty SET department = 'Software Engineering' WHERE faculty_id = 1;
 
-- Grace: delete (demo row)
INSERT INTO Faculty (name, email, department) VALUES
('Temp Faculty', 'temp@alu.edu', 'Temp Dept');
DELETE FROM Faculty WHERE name = 'Temp Faculty';
 
-- Grace: select with WHERE
SELECT * FROM Faculty WHERE department = 'Mathematics';









-- =========================================================
-- Sandra: Classroom table
-- =========================================================
CREATE TABLE Classroom (
    classroom_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL,
    building VARCHAR(50) NOT NULL,
    capacity INT NOT NULL,
    floor INT NOT NULL
);
-- Sandra: sample data
INSERT INTO Classroom (room_number, building, capacity, floor) VALUES
('A101', 'Main Block', 40, 1),
('A102', 'Main Block', 35, 1),
('B201', 'Innovation Block', 50, 2),
('B202', 'Innovation Block', 30, 2),
('C301', 'Science Block', 25, 3);
-- Sandra: update
UPDATE Classroom
SET capacity = 45
WHERE room_number = 'A101';
-- Sandra: delete (demo row)
INSERT INTO Classroom (room_number, building, capacity, floor) VALUES
('Z999', 'Temp Block', 10, 9);
DELETE FROM Classroom WHERE room_number = 'Z999';
-- Sandra: select with WHERE
SELECT * FROM Classroom
WHERE capacity >= 40;









-- =========================================================
-- Job: Students table
-- =========================================================













-- =========================================================
-- Shima: Courses table
-- =========================================================

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    faculty_id INT,
    classroom_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
 
-- Shima: sample data
INSERT INTO Courses (course_name, credits, faculty_id, classroom_id) VALUES
('Introduction to Programming', 4, 1, 3),
('Calculus I', 3, 2, 1),
('Principles of Marketing', 3, 3, 4),
('Circuits and Systems', 4, 4, 2),
('African Philosophy', 3, 5, 5);
 
-- Shima: update
UPDATE Courses SET credits = 5 WHERE course_id = 4;
 
-- Shima: delete (demo row - safe pattern)
INSERT INTO Courses (course_name, credits, faculty_id, classroom_id) VALUES
('Temp Course', 1, 1, 1);
DELETE FROM Courses WHERE course_name = 'Temp Course';
 
-- Shima: select with WHERE
SELECT * FROM Courses WHERE credits >= 4;















-- =========================================================
-- Digne: Extra_Curricular_Activities table
-- =========================================================

CREATE TABLE Extra_Curricular_Activities (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    activity_name VARCHAR(100) NOT NULL,
    activity_type VARCHAR(50),
    meeting_day VARCHAR(20),
    faculty_advisor_id INT,
    FOREIGN KEY (faculty_advisor_id) REFERENCES Faculty(faculty_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

-- Digne: sample data
INSERT INTO Extra_Curricular_Activities 
(activity_name, activity_type, meeting_day, faculty_advisor_id) VALUES
('Debate Club', 'Academic', 'Monday', 1),
('Football Team', 'Sports', 'Wednesday', 2),
('Coding Club', 'Academic', 'Thursday', 3),
('Traditional Dance', 'Cultural', 'Friday', 4),
('Environmental Club', 'Service', 'Tuesday', 5);

-- Digne: update
UPDATE Extra_Curricular_Activities
SET meeting_day = 'Tuesday'
WHERE activity_id = 1;

-- Digne: delete (demo row)
INSERT INTO Extra_Curricular_Activities
(activity_name, activity_type, meeting_day, faculty_advisor_id)
VALUES
('Temporary Club', 'Temporary', 'Sunday', 1);

DELETE FROM Extra_Curricular_Activities
WHERE activity_name = 'Temporary Club';

-- Digne: select with WHERE
SELECT *
FROM Extra_Curricular_Activities
WHERE activity_type = 'Academic';














-- =========================================================
-- Shima: Student_Activities (junction table)
-- =========================================================
CREATE TABLE Student_Activities (
    student_id INT NOT NULL,
    activity_id INT NOT NULL,
    join_date DATE NOT NULL,
    PRIMARY KEY (student_id, activity_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (activity_id) REFERENCES Extra_Curricular_Activities(activity_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Shima: sample data
INSERT INTO Student_Activities (student_id, activity_id, join_date) VALUES
(1, 1, '2025-09-10'),
(2, 3, '2025-09-10'),
(3, 2, '2025-09-11'),
(4, 4, '2025-09-11'),
(5, 5, '2025-09-12');

-- Shima: update
UPDATE Student_Activities SET join_date = '2025-09-13' WHERE student_id = 3 AND activity_id = 2;

-- Shima: delete (demo row - safe pattern)
INSERT INTO Student_Activities (student_id, activity_id, join_date) VALUES
(1, 2, '2025-09-10');
DELETE FROM Student_Activities WHERE student_id = 1 AND activity_id = 2;

-- Shima: select with WHERE
SELECT * FROM Student_Activities WHERE activity_id = 1;
