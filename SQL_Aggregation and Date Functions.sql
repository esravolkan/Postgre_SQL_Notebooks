-- Create the PETRESCUE table

drop table if exists PETRESCUE;

create table PETRESCUE (
	ID INTEGER NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	COST DECIMAL(6,2),
	RESCUEDATE DATE,
	PRIMARY KEY (ID)
	);

insert into PETRESCUE values 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15')
	
;
SELECT * FROM petrescue p 

-- AGGREGATION FUNCTIONS

--Write a query that calculates the total cost of all animal rescues in the PETRESCUE table.
SELECT sum(COST) AS SUM_OF_COST FROM petrescue p; 

--Write a query that displays the maximum and minimum quantity of animals rescued (of any kind).
SELECT max(Quantity) FROM petrescue p

SELECT min(Quantity) FROM petrescue p  

--Write a query that displays the average cost of animals rescued.
SELECT avg(COST) FROM petrescue p; 

-- Write a query that displays the rounded integral cost of each rescue.
SELECT round(COST, 2) FROM petrescue p ;

-- Write a query that displays the length of each animal name.
SELECT length (animal) FROM petrescue p;

-- Write a query that displays the animal name in each rescue in uppercase or lowercase.
SELECT upper(animal) FROM petrescue p; 
SELECT lower(animal) FROM petrescue p; 


-- DATE FUNCTIONS
-- Write a query that displays the rescue date.
	-- The query for this question can be written as:
		SELECT EXTRACT(DAY FROM RESCUEDATE) FROM PETRESCUE;
	-- In case the query was asking for MONTH of rescue, the query would change to:
		SELECT EXTRACT(MONTH FROM RESCUEDATE) FROM PETRESCUE;
	-- In case the query was asking for YEAR of rescue, the query would change to:
		SELECT EXTRACT(YEAR FROM RESCUEDATE) FROM PETRESCUE;
	
-- Animals rescued should see the vet within three days of arrival. Write a query that displays the third day of each rescue.
	SELECT RESCUEDATE + INTERVAL '3 DAY' FROM PETRESCUE;

-- Write a query that displays the length of time the animals have been rescued, for example, the difference between the current date and the rescue date.
	SELECT CURRENT_DATE - RESCUEDATE FROM PETRESCUE;

-- PRACTICE QUESTIONS

--Write a query that displays the average cost of rescuing a single dog. 
	SELECT AVG(COST/QUANTITY) FROM PETRESCUE WHERE ANIMAL = 'Dog';
--Write a query that displays the animal name in each rescue in uppercase without duplications. 
	SELECT DISTINCT Upper(ANIMAL) FROM PETRESCUE;
--Write a query that displays all the columns from the PETRESCUE table where the animal(s) rescued are cats. 
	--Use cat in lowercase in the query.
	SELECT * FROM PETRESCUE WHERE lower(ANIMAL)= 'cat';
--Write a query that displays the number of rescues in the 5th month.
	SELECT SUM(QUANTITY) FROM PETRESCUE WHERE EXTRACT(MONTH FROM RESCUEDATE)='05';
--The rescue shelter is supposed to find good homes for all animals within 1 year of their rescue. 
	-- Write a query that displays the ID and the target date.
	SELECT ID, RESCUEDATE + INTERVAL '1 YEAR' FROM PETRESCUE;

--
--
--
--
--
--
--
