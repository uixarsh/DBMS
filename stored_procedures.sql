-- STORED PROCEDURES
-- in simple terms they are just like functions in any programming language...

USE lco_films;

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
