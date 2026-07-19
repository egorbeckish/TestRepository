SELECT
	employee_id,
	first_name,
	last_name,
	department_id
FROM
	employees
WHERE
	department_id = 50
	AND first_name BETWEEN 'A' AND 'B';

--|employee_id|first_name|last_name|department_id|
--|-----------|----------|---------|-------------|
--|121        |Adam      |Fripp    |50           |
--|185        |Alexis    |Bull     |50           |
--|187        |Anthony   |Cabrio   |50           |
--|196        |Alana     |Walsh    |50           |