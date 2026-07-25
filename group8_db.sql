-- =========================================================
-- Grace: Faculty table
-- =========================================================









-- =========================================================
-- Sandra: Classroom table
-- =========================================================











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
