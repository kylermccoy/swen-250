--Task 1: Find all the information on all the catchers (position 2) in the database.
select * from Player where position = 2 ;
--Task 2: Find the name and age of all pitchers (position 1) on the Rays.
select name, age from Player where position = 1 and team = "Rays" ;
--Task 3: Find the name, number, and team of all outfielders (positions 7 through 9) who are 25 years old 
--	  or younger. 
select name, number, team from Player where position >= 7 and position <= 9 and age <= 25 ;
--Task 4: Find the name and number of all infielders (positions 3 through 6) on the Red Sox.
select name, number from Player where position >= 3 and position <= 6 and team ="Red Sox" ;
--Task 5: Find the name, number, and team of all pitchers who are over 30 years old.
select name, number, team from Player where position = 1 and age > 30 ;
