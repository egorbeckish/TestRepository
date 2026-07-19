Выражение **BETWEEN** используется для того, чтобы результат запроса содержал только те строки, в которых значение проверяемого столбца находится в заданном диапазоне, включая его границы.

```sql
SELECT {список столбцов}
FROM {список таблица}
WHERE {имя столбца} BETWEEN V_MIN AND V_MAX;  -- ({имя столбца} >= V_MIN) AND ({имя столбца} <= V_MAX)
```
---
> - V_MIN — нижняя граница диапазона;
> - V_MAX — верхняя граница диапазона.

Запрос 1. [Вывести данные о сотрудниках, зарплата которых находится в определенном диапазоне](#query1)
```sql
SELECT
	employee_id,
	first_name,
	last_name,
	department_id
FROM
	employees
WHERE
	salary BETWEEN 6000 AND 8000;

--|employee_id|first_name |last_name|department_id|
--|-----------|-----------|---------|-------------|
--|104        |Bruce      |Ernst    |60           |
--|111        |Ismael     |Sciarra  |100          |
--|112        |Jose Manuel|Urman    |100          |
--|...        |...        |...      |...          |
--|203        |Susan      |Mavris   |40           |
```

Запрос 2. [Получить данные о договорах, дата заключения которых лежит в определенном диапазоне](#query2)
```sql
SELECT
	*
FROM
	orders
WHERE
	order_date BETWEEN '01.09.2019' AND '30.09.2019';

--|order_id|customer_id|status |salesman_id|order_date|
--|--------|-----------|-------|-----------|----------|
--|23      |23         |Shipped|152        |2019-09-07|
--|24      |41         |Shipped|152        |2019-09-07|
--|95      |45         |Shipped|179        |2019-09-19|
--|96      |46         |Shipped|179        |2019-09-14|
```

Запрос 3. [Получить данные о договорах, дата заключения которых не лежит в определенном диапазоне](#query3)
```sql
SELECT
	*
FROM
	orders
WHERE
	order_date NOT BETWEEN '01.09.2019' AND '30.09.2019';

--|order_id|customer_id|status  |salesman_id|order_date|
--|--------|-----------|--------|-----------|----------|
--|8       |28         |Shipped |155        |2020-03-21|
--|32      |25         |Shipped |158        |2019-04-19|
--|35      |24         |Shipped |160        |2018-12-11|
--|...     |...        |...     |...        |...       |
--|59      |70         |Shipped |           |2017-07-29|
```

Запрос 4. [Получить данные о сотрудниках, работающих в отделе 50, имена которых начинаются с букв в диапазоне от A до B (содержит ошибку)](#query4)
```sql
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
```

Запрос 5. [Получить данные о сотрудниках, работающих в отделе 50, имена которых начинаются с букв в диапазоне от A до B](#query5)
```sql
SELECT
	employee_id,
	first_name,
	last_name,
	department_id
FROM
	employees
WHERE
	department_id = 50
	AND first_name BETWEEN 'A' AND 'C';

--|employee_id|first_name|last_name|department_id|
--|-----------|----------|---------|-------------|
--|121        |Adam      |Fripp    |50           |
--|185        |Alexis    |Bull     |50           |
--|187        |Anthony   |Cabrio   |50           |
--|193        |Britney   |Everett  |50           |
--|196        |Alana     |Walsh    |50           |
```
