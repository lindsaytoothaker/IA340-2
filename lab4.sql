--4.1
/* No, you cannot delete Virginia from the name table because it is referred to by the other tables (it is both a primary and foreign key, 1 to M relationship). 
You need to maintain data consistency.

--4.2
/* No, it will not run because you do not have records with a value of fips = 80 (invalid data).

--4.3
/* It is good. There is some redundancy, but that can be fixed with more detailed instructions.

--4.5
/* Yes, ChatGBT recognizes and reads the er diagram.

--4.6
/* It works perfectly */

SELECT n.name, i.income, i.year
FROM income i
INNER JOIN name n ON i.fips = n.fips
WHERE i.year = (SELECT MAX(year) FROM income)
ORDER BY i.income DESC
LIMIT 1;

--4.7
/* My prompt was: "calculate the VA population growth rate in the past five years" and it only returned one of about 1.819. 
/* So I edited my prompt to ask: "calculate the population growth rate of each year for the past five years in VA" which returned five
/* different growth rates for years 2015-2019 with the correct results of 0.209 for 2019, 0.563 for 2018, etc.



/*For my random question, I asked ChatGBT to 'find the five states with the lowest income in recent years.' It worked well and 
/*ChatGBT understood what I was asking and how to solve problems

SELECT n.name, i.income, i.year
FROM income i
JOIN name n ON i.fips = n.fips
WHERE i.year = (
    SELECT MAX(year) FROM income
)
ORDER BY i.income ASC
LIMIT 5;

--4.8
/* ChatGBT usually produces accurate responses, however, you will likely have to be specific in your instructions and modify prompts.
