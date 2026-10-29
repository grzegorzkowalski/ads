# Project 2 — Directors and Awards Extension — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Expand the reference implementation

```sql
USE sakila;
GO

IF OBJECT_ID('course_lab.director_award', 'U') IS NOT NULL DROP TABLE course_lab.director_award;
IF OBJECT_ID('course_lab.film_award', 'U') IS NOT NULL DROP TABLE course_lab.film_award;
IF OBJECT_ID('course_lab.film_director', 'U') IS NOT NULL DROP TABLE course_lab.film_director;
IF OBJECT_ID('course_lab.award', 'U') IS NOT NULL DROP TABLE course_lab.award;
IF OBJECT_ID('course_lab.director', 'U') IS NOT NULL DROP TABLE course_lab.director;
GO

CREATE TABLE course_lab.director
(
    director_id int IDENTITY(1, 1) CONSTRAINT PK_director PRIMARY KEY,
    first_name nvarchar(50) NOT NULL,
    last_name nvarchar(50) NOT NULL,
    birth_date date NULL,
    nationality nvarchar(50) NULL,
    CONSTRAINT UQ_director_name UNIQUE (first_name, last_name)
);

CREATE TABLE course_lab.award
(
    award_id int IDENTITY(1, 1) CONSTRAINT PK_award PRIMARY KEY,
    award_name nvarchar(100) NOT NULL,
    award_type nvarchar(50) NOT NULL,
    award_year int NOT NULL,
    CONSTRAINT UQ_award UNIQUE (award_name, award_type, award_year),
    CONSTRAINT CK_award_year CHECK (award_year BETWEEN 1900 AND 2100)
);

CREATE TABLE course_lab.film_director
(
    film_id int NOT NULL,
    director_id int NOT NULL,
    CONSTRAINT PK_film_director PRIMARY KEY (film_id, director_id),
    CONSTRAINT FK_film_director_film
        FOREIGN KEY (film_id) REFERENCES dbo.film(film_id),
    CONSTRAINT FK_film_director_director
        FOREIGN KEY (director_id) REFERENCES course_lab.director(director_id)
);

CREATE TABLE course_lab.film_award
(
    film_id int NOT NULL,
    award_id int NOT NULL,
    CONSTRAINT PK_film_award PRIMARY KEY (film_id, award_id),
    CONSTRAINT FK_film_award_film
        FOREIGN KEY (film_id) REFERENCES dbo.film(film_id),
    CONSTRAINT FK_film_award_award
        FOREIGN KEY (award_id) REFERENCES course_lab.award(award_id)
);

CREATE TABLE course_lab.director_award
(
    director_id int NOT NULL,
    award_id int NOT NULL,
    CONSTRAINT PK_director_award PRIMARY KEY (director_id, award_id),
    CONSTRAINT FK_director_award_director
        FOREIGN KEY (director_id) REFERENCES course_lab.director(director_id),
    CONSTRAINT FK_director_award_award
        FOREIGN KEY (award_id) REFERENCES course_lab.award(award_id)
);

CREATE INDEX IX_film_director_director_film
    ON course_lab.film_director (director_id, film_id);
CREATE INDEX IX_film_award_award_film
    ON course_lab.film_award (award_id, film_id);
CREATE INDEX IX_director_award_award_director
    ON course_lab.director_award (award_id, director_id);
GO

SET IDENTITY_INSERT course_lab.director ON;
INSERT INTO course_lab.director
    (director_id, first_name, last_name, birth_date, nationality)
VALUES
    (1, N'Christopher', N'Nolan', '1970-07-30', N'British'),
    (2, N'Greta', N'Gerwig', '1983-08-04', N'American'),
    (3, N'Bong', N'Joon-ho', '1969-09-14', N'South Korean'),
    (4, N'Sofia', N'Coppola', '1971-05-14', N'American'),
    (5, N'Hayao', N'Miyazaki', '1941-01-05', N'Japanese'),
    (6, N'Ava', N'DuVernay', '1972-08-24', N'American'),
    (7, N'Pedro', N'Almodóvar', '1949-09-25', N'Spanish'),
    (8, N'Chloé', N'Zhao', '1982-03-31', N'Chinese'),
    (9, N'Jordan', N'Peele', '1979-02-21', N'American'),
    (10, N'Jane', N'Campion', '1954-04-30', N'New Zealander');
SET IDENTITY_INSERT course_lab.director OFF;

SET IDENTITY_INSERT course_lab.award ON;
INSERT INTO course_lab.award
    (award_id, award_name, award_type, award_year)
VALUES
    (1, N'Best Picture', N'Oscar', 2020),
    (2, N'Best Director', N'Oscar', 2021),
    (3, N'Best Screenplay', N'BAFTA', 2019),
    (4, N'Jury Prize', N'Cannes', 2019),
    (5, N'Best International Film', N'European Film Award', 2020);
SET IDENTITY_INSERT course_lab.award OFF;

INSERT INTO course_lab.film_director (film_id, director_id)
VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
       (6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
       (11, 1), (12, 2), (13, 3), (14, 4), (15, 5);

INSERT INTO course_lab.film_award (film_id, award_id)
VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (11, 2), (12, 3);

INSERT INTO course_lab.director_award (director_id, award_id)
VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (1, 2), (3, 5);
GO

CREATE OR ALTER VIEW course_lab.v_film_awards
AS
SELECT
    f.film_id,
    f.title,
    TRY_CONVERT(int, f.release_year) AS release_year,
    c.name AS category_name,
    CONCAT(d.first_name, ' ', d.last_name) AS director_name,
    a.award_name,
    a.award_type,
    a.award_year
FROM dbo.film AS f
JOIN course_lab.film_director AS fd ON fd.film_id = f.film_id
JOIN course_lab.director AS d ON d.director_id = fd.director_id
LEFT JOIN dbo.film_category AS fc ON fc.film_id = f.film_id
LEFT JOIN dbo.category AS c ON c.category_id = fc.category_id
LEFT JOIN course_lab.film_award AS fa ON fa.film_id = f.film_id
LEFT JOIN course_lab.award AS a ON a.award_id = fa.award_id;
GO

CREATE OR ALTER VIEW course_lab.v_director_awards
AS
SELECT
    d.director_id,
    CONCAT(d.first_name, ' ', d.last_name) AS director_name,
    award_counts.award_count,
    COALESCE(film_list.film_titles, N'') AS awarded_film_titles
FROM course_lab.director AS d
OUTER APPLY
(
    SELECT COUNT(*) AS award_count
    FROM course_lab.director_award AS da
    WHERE da.director_id = d.director_id
) AS award_counts
OUTER APPLY
(
    SELECT STRING_AGG(CONVERT(nvarchar(max), x.title), N', ')
               WITHIN GROUP (ORDER BY x.title) AS film_titles
    FROM
    (
        SELECT DISTINCT f.title
        FROM course_lab.director_award AS da2
        JOIN course_lab.film_award AS fa ON fa.award_id = da2.award_id
        JOIN dbo.film AS f ON f.film_id = fa.film_id
        WHERE da2.director_id = d.director_id
    ) AS x
) AS film_list
;
GO

CREATE OR ALTER PROCEDURE course_lab.usp_add_award
    @award_name nvarchar(100),
    @award_type nvarchar(50),
    @award_year int,
    @film_id int = NULL,
    @director_id int = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF @film_id IS NULL AND @director_id IS NULL
        THROW 51020, 'Assign the award to a film, a director, or both.', 1;

    IF @film_id IS NOT NULL AND NOT EXISTS
       (SELECT 1 FROM dbo.film WHERE film_id = @film_id)
        THROW 51021, 'The film does not exist.', 1;

    IF @director_id IS NOT NULL AND NOT EXISTS
       (SELECT 1 FROM course_lab.director WHERE director_id = @director_id)
        THROW 51022, 'The director does not exist.', 1;

    BEGIN TRANSACTION;

    DECLARE @award_id int;

    SELECT @award_id = award_id
    FROM course_lab.award
    WHERE award_name = @award_name
      AND award_type = @award_type
      AND award_year = @award_year;

    IF @award_id IS NULL
    BEGIN
        INSERT INTO course_lab.award (award_name, award_type, award_year)
        VALUES (@award_name, @award_type, @award_year);
        SET @award_id = CONVERT(int, SCOPE_IDENTITY());
    END;

    IF @film_id IS NOT NULL
       AND NOT EXISTS
       (SELECT 1 FROM course_lab.film_award WHERE film_id = @film_id AND award_id = @award_id)
        INSERT INTO course_lab.film_award (film_id, award_id)
        VALUES (@film_id, @award_id);

    IF @director_id IS NOT NULL
       AND NOT EXISTS
       (SELECT 1 FROM course_lab.director_award WHERE director_id = @director_id AND award_id = @award_id)
        INSERT INTO course_lab.director_award (director_id, award_id)
        VALUES (@director_id, @award_id);

    COMMIT TRANSACTION;

    SELECT @award_id AS award_id;
END;
GO

CREATE OR ALTER FUNCTION course_lab.ufn_get_award_count
(
    @entity_type varchar(10),
    @entity_id int
)
RETURNS int
AS
BEGIN
    DECLARE @result int = 0;

    IF @entity_type = 'film'
        SELECT @result = COUNT(*) FROM course_lab.film_award WHERE film_id = @entity_id;
    ELSE IF @entity_type = 'director'
        SELECT @result = COUNT(*) FROM course_lab.director_award WHERE director_id = @entity_id;

    RETURN @result;
END;
GO

SELECT * FROM course_lab.v_film_awards;
SELECT * FROM course_lab.v_director_awards;

SELECT
    d.director_id,
    CONCAT(d.first_name, ' ', d.last_name) AS director_name,
    COUNT(*) AS collaboration_count
FROM course_lab.film_director AS fd
JOIN course_lab.director AS d ON d.director_id = fd.director_id
GROUP BY d.director_id, d.first_name, d.last_name
HAVING COUNT(*) >= 2
ORDER BY collaboration_count DESC;

EXEC course_lab.usp_add_award
    @award_name = N'Debut of the Year',
    @award_type = N'Course Award',
    @award_year = 2026,
    @director_id = 6;
```


