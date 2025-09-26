-- TRIGGERS
-- It is like an eventListener
-- for ex : whenever you update some data you directly can execute some queries, whenver you insert something you can do something (everything depends on an event I say!)
-- for ex : user will provide a plane string password what we can do we can encrypt it automatically!



USE lco_films;

DELIMITER #
CREATE TRIGGER logger
BEFORE INSERT ON actor
FOR EACH ROW
	SET @log = "Adding new Product";
#
DELIMITER ;

SET @log = "";

SELECT * FROM actor LIMIT 2;
INSERT INTO actor (first_name, last_name, address_id) VALUES ("ARSH", "SINGHAL", 4);
