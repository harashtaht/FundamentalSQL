SELECT * FROM finalproject.employeeattrition;

SELECT AVG('Age') FROM finalproject.employeeattrition;

SELECT COUNT('BusinessTravel') from employeeattrition where Attrition= 'No';

SELECT JobRole, COUNT(*) as jumlah FROM employeeattrition where Attrition = 'No'
GROUP BY JobRole;

SELECT Attrition, AVG(MonthlyRate) from employeeattrition GROUP BY Attrition;

SELECT Attrition, JobRole, MaritalStatus, MonthlyIncome from employeeattrition;

SELECT JobRole, avg(MonthlyIncome) as ratarata from employeeattrition WHERE Attrition= 'Yes' GROUP BY JobRole
HAVING ratarata>5000;

-- SELECT * from employeeattrition WHERE Attrition='Yes' GROUP BY MaritalStatus HAVING NumCompaniesWorked >1;

select AVG(DistanceFromHome) as jarak, JobRole from employeeattrition GROUP BY JobRole HAVING jarak > 5;

-- SELECT COUNT(JobRole), avg(MonthlyIncome) as RATA 
-- from employeeattrition 
-- GROUP BY JobRole 
-- HAVING RATA> RATA WHERE JobRole = 'Sales Executive';

SELECT AVG(MonthlyIncome), JobRole
from employeeattrition
WHERE JobRole = 'Sales Executive';

SELECT count(*)
from employeeattrition
WHERE JobRole = 'Manager' and MonthlyIncome > (SELECT AVG(MonthlyIncome)
from employeeattrition
WHERE JobRole = 'Sales Executive');


-- Test dari Baron

SELECT * from employeeattrition;

SELECT MAX(Education) from employeeattrition;


select count(*), Education from employeeattrition 
where MonthlyIncome > (select max(MonthlyIncome) from employeeattrition where Education=3) 
GROUP BY Education;
