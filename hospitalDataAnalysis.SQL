/*Display all the records where the employee has resigned*/
SELECT emp_id, fname, lname, date_of_resign
FROM `medicaldataset.employees`
WHERE date_of_resign IS NOT NULL;
#13 records of employee resignation

/*Find the number of males and females in each employee type category*/
SELECT emp_type, sex, COUNT(sex) as gender_count
FROM `medicaldataset.employees`
GROUP BY emp_type, sex 
ORDER BY emp_type;
#30 female doctors, 65 male doctors, 14 male janitors, 26 female nurses, 9 male nurses, 5 female REC, 11 male SEC

/*List the top 5 treatment most expensive treatments*/
SELECT treatment_name, fees
FROM `medicaldataset.treatments`
ORDER BY fees DESC
LIMIT 5;
# 1. Stereotactic neurosurgery at 15,000,000 2. Hip replacement at 5,000,000 3. Heart Transplant at 3,500,000 4. Heart Valve Repair at 2,500,000 5. Cerebrovascular surgery at 2,500,000

/*List the department name and total, average, max, and min fees spent in the department*/
SELECT d.dep_name, sum(fees) as total_fees, avg(fees) as avg_fees, max(fees) as max_fees, min(fees) as min_fees
FROM `medicaldataset.departments` as d inner join `medicaldataset.treatments` as t on d.dep_no = t.dep_no
GROUP BY d.dep_name;

/*The top 3 department of total fees spent*/
SELECT d.dep_name, sum(fees) as total_fees
FROM `medicaldataset.departments` as d inner join `medicaldataset.treatments` as t on d.dep_no = t.dep_no
GROUP BY d.dep_name
ORDER BY sum(fees) DESC
LIMIT 3;
# 1. Neurology with 25,810,000 2. Oncology with 11,000,000 3. Orthopaedics with 9,650,000

/*List the department_id, department_name, and the treatment names where fees are greater than 10,000*/
SELECT d.dep_no, dep_name, treatment_name, fees
FROM `medicaldataset.departments` as d inner join `medicaldataset.treatments` as t on d.dep_no = t.dep_no
WHERE fees > 10000;

