-- Create a table with the requested data and filter it down by age
-- and sort order it by emp number.
SELECT  
e.emp_no, e.first_name, e.last_name,
 ti.title,ti.from_date, ti.to_date
INTO retirement_titles
FROM employees as e
Inner JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND ti.to_date = '9999-01-01'
ORDER BY e.emp_no asc;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no)
rt.emp_no, rt.first_name, rt.last_name, ti.title
INTO Unique_Titles 
FROM retirement_titles as rt
Inner JOIN titles as ti
ON rt.emp_no = ti.emp_no
ORDER BY rt.emp_no, ti.to_date desc;

--------------------------------------------
-- group by title to show how many of each title will retire 
SELECT COUNT(rt.emp_no), rt.title
INTO retiring_titles
FROM retirement_titles as rt
GROUP BY rt.title;

------Mentorship Eligibility table ---------------
SELECT  Distinct on (e.emp_no)
e.emp_no, e.first_name, e.last_name,
de.from_date,de.to_date,
ti.title
INTO mentorship_eligibilty
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN titles AS ti
        ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND de.to_date = '9999-01-01';