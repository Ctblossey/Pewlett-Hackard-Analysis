-- retirement_titles
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date

INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

--SELECT * FROM retirement_titles

-- unique_titles
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
rt.title

INTO unique_titles
FROM employees AS e
INNER JOIN retirement_titles AS rt
ON e.emp_no = rt.emp_no
WHERE rt.to_date = '9999-01-01'
ORDER BY e.emp_no, rt.to_date DESC;

--SELECT * FROM unique_titles

-- retiring_titles
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
Order BY count DESC

--SELECT * FROM retiring_titles

-- mentorship_eligibility
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
d.from_date,
d.to_date,
t.title

INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp AS d
ON (e.emp_no = d.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (d.to_date = '9999-01-01')
ORDER BY e.emp_no, t.from_date DESC

