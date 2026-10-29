USE sakila;
GO

IF OBJECT_ID('course_lab.v_director_awards', 'V') IS NOT NULL DROP VIEW course_lab.v_director_awards;
IF OBJECT_ID('course_lab.v_film_awards', 'V') IS NOT NULL DROP VIEW course_lab.v_film_awards;
IF OBJECT_ID('course_lab.v_customer_rentals', 'V') IS NOT NULL DROP VIEW course_lab.v_customer_rentals;
IF OBJECT_ID('course_lab.v_customer_directory', 'V') IS NOT NULL DROP VIEW course_lab.v_customer_directory;
IF OBJECT_ID('course_lab.usp_add_award', 'P') IS NOT NULL DROP PROCEDURE course_lab.usp_add_award;
IF OBJECT_ID('course_lab.usp_add_actor', 'P') IS NOT NULL DROP PROCEDURE course_lab.usp_add_actor;
IF OBJECT_ID('course_lab.usp_films_by_category', 'P') IS NOT NULL DROP PROCEDURE course_lab.usp_films_by_category;
IF OBJECT_ID('course_lab.ufn_get_award_count', 'FN') IS NOT NULL DROP FUNCTION course_lab.ufn_get_award_count;
IF OBJECT_ID('course_lab.ufn_customer_rental_count', 'FN') IS NOT NULL DROP FUNCTION course_lab.ufn_customer_rental_count;

IF OBJECT_ID('course_lab.customer_loyalty', 'U') IS NOT NULL DROP TABLE course_lab.customer_loyalty;
IF OBJECT_ID('course_lab.loyalty_tier', 'U') IS NOT NULL DROP TABLE course_lab.loyalty_tier;
IF OBJECT_ID('course_lab.customer_preferences', 'U') IS NOT NULL DROP TABLE course_lab.customer_preferences;
IF OBJECT_ID('course_lab.migration_log', 'U') IS NOT NULL DROP TABLE course_lab.migration_log;
IF OBJECT_ID('course_lab.order_detail_3nf', 'U') IS NOT NULL DROP TABLE course_lab.order_detail_3nf;
IF OBJECT_ID('course_lab.order_3nf', 'U') IS NOT NULL DROP TABLE course_lab.order_3nf;
IF OBJECT_ID('course_lab.product_3nf', 'U') IS NOT NULL DROP TABLE course_lab.product_3nf;
IF OBJECT_ID('course_lab.customer_3nf', 'U') IS NOT NULL DROP TABLE course_lab.customer_3nf;
IF OBJECT_ID('course_lab.film_tag_map', 'U') IS NOT NULL DROP TABLE course_lab.film_tag_map;
IF OBJECT_ID('course_lab.film_tag', 'U') IS NOT NULL DROP TABLE course_lab.film_tag;
IF OBJECT_ID('course_lab.customer_note', 'U') IS NOT NULL DROP TABLE course_lab.customer_note;
IF OBJECT_ID('course_lab.employee_demo', 'U') IS NOT NULL DROP TABLE course_lab.employee_demo;
IF OBJECT_ID('course_lab.director_award', 'U') IS NOT NULL DROP TABLE course_lab.director_award;
IF OBJECT_ID('course_lab.film_award', 'U') IS NOT NULL DROP TABLE course_lab.film_award;
IF OBJECT_ID('course_lab.film_director', 'U') IS NOT NULL DROP TABLE course_lab.film_director;
IF OBJECT_ID('course_lab.award', 'U') IS NOT NULL DROP TABLE course_lab.award;
IF OBJECT_ID('course_lab.director', 'U') IS NOT NULL DROP TABLE course_lab.director;
IF OBJECT_ID('course_lab.join_right', 'U') IS NOT NULL DROP TABLE course_lab.join_right;
IF OBJECT_ID('course_lab.join_left', 'U') IS NOT NULL DROP TABLE course_lab.join_left;

IF SCHEMA_ID('course_lab') IS NOT NULL
    DROP SCHEMA course_lab;
GO

