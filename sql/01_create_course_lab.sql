USE sakila;
GO

IF SCHEMA_ID('course_lab') IS NULL
    EXEC('CREATE SCHEMA course_lab');
GO

IF OBJECT_ID('course_lab.join_left', 'U') IS NULL
BEGIN
    CREATE TABLE course_lab.join_left
    (
        left_id int NOT NULL CONSTRAINT PK_join_left PRIMARY KEY,
        label nvarchar(50) NOT NULL
    );

    INSERT INTO course_lab.join_left (left_id, label)
    VALUES (1, N'One'), (2, N'Two'), (3, N'Only on the left');
END;
GO

IF OBJECT_ID('course_lab.join_right', 'U') IS NULL
BEGIN
    CREATE TABLE course_lab.join_right
    (
        right_id int NOT NULL CONSTRAINT PK_join_right PRIMARY KEY,
        left_id int NULL,
        label nvarchar(50) NOT NULL
    );

    INSERT INTO course_lab.join_right (right_id, left_id, label)
    VALUES (10, 1, N'One'), (20, 2, N'Two'), (30, NULL, N'Only on the right');
END;
GO

SELECT * FROM course_lab.join_left;
SELECT * FROM course_lab.join_right;

