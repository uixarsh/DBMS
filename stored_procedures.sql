-- STORED PROCEDURES
-- in simple terms they are just like functions in any programming language...

USE lco_films;

-- ####################################################
DELIMITER #
-- Delimiter updates the current semi-colon to end any query with our desired character

-- CREATE PROCEDURES 
CREATE PROCEDURE showLimitedOrdersandOrderDetails ()
BEGIN
	SELECT * FROM actor LIMIT 10;
    SELECT * FROM address LIMIT 5;
END #

DELIMITER ;
-- Update the delimiter back to the way it originally was

-- CALL PROCEDURE
CALL showLimitedOrdersandOrderDetails();
-- ####################################################


-- ####################################################
-- PASS VALUES INSIDE STORED PROCEDURE;
DELIMITER $
CREATE PROCEDURE passingValuestoOrder(IN lt INT)
BEGIN
	SELECT * FROM actor LIMIT lt;
END $
DELIMITER ;

CALL passingValuestoOrder(14);
DROP PROCEDURE IF EXISTS passingValuestoOrder;
-- ####################################################


-- ####################################################
DELIMITER $$
CREATE PROCEDURE passingtoOrder(IN p_limit INT, IN p_name VARCHAR(45))
BEGIN
    SELECT *
    FROM actor
    WHERE first_name = p_name
    LIMIT p_limit;
END $$
DELIMITER ;

CALL passingtoOrder(10, 'PENELOPE');
DROP PROCEDURE IF EXISTS passingtoOrder;
-- ####################################################


-- ####################################################
DELIMITER $$
CREATE PROCEDURE returnOrder(IN p_name VARCHAR(45), OUT r_cnt INT)
BEGIN
    SELECT COUNT(*) INTO r_cnt FROM actor WHERE first_name = p_name;
END $$
DELIMITER ;

CALL returnOrder('PENELOPE', @cnt);		-- @cnt is a session variable i.e, available throughout your current database connection!
DROP PROCEDURE IF EXISTS returnOrder;
SELECT @cnt;
-- ####################################################


-- ####################################################
DELIMITER #
CREATE PROCEDURE proc()
BEGIN
	DECLARE x INT;
    SET x = 1;
    WHILE x<= 5 DO
		SELECT x;
        SET x = x+1;
	END WHILE;
END #
DELIMITER ;

CALL proc();
DROP PROCEDURE IF EXISTS proc;
-- ####################################################
