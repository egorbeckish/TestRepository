Для того чтобы выводить только те данные, которые удовлетворяют определенным условиям, оператор **SELECT** должен содержать предложение **WHERE**, которое содержит условное выражение:
```
SELECT {список столбцов}
FROM {список таблица}
WHERE {условное выражение};
```

---
> Условное выражение для каждой строки таблицы может принимать значения: **ИСТИНА (TRUE)**, **ЛОЖЬ (FALSE)**, **НЕ ОПРЕДЕЛЕНО (UNKNOWN)**. Результат выполнения запроса будет содержать только те строки, для которых условное выражение будет иметь значение **ИСТИНА (TRUE)**.

> В условных выражениях предложения **WHERE** могут быть использованы операторы сравнения =, <>, <, > и логические операторы **NOT**, **AND**, **OR**. Логические операторы используются для формирования сложных условий выбора и имеют разный приоритет. Сначала выполняются все операторы **NOT**, потом операторы **AND**; операторы **OR** выполняются в последнюю очередь. Для исключения возможных ошибок при формировании сложных запросов следует использовать скобки. Выражения внутри скобок выполняются первыми, слева направо.

```sql
SELECT
	employee_id,
	first_name,
	last_name,
	salary,
	department_id
FROM
	employees
WHERE
	salary > 15000;

--|employee_id|first_name|last_name|salary|department_id|
--|-----------|----------|---------|------|-------------|
--|100        |Steven    |King     |24 000|90           |
--|101        |Neena     |Kochhar  |17 000|90           |
--|102        |Lex       |De Haan  |17 000|90           |
```

```sql
SELECT
	employee_id,
	first_name,
	last_name,
	salary,
	department_id
FROM
	employees
WHERE
	hire_date = '20.08.1997';

--|employee_id|first_name|last_name|salary|department_id|
--|-----------|----------|---------|------|-------------|
--|129        |Laura     |Bissot   |3 300 |50           |
--|152        |Peter     |Hall     |      |80           |
```

```sql
SELECT
	employee_id,
	first_name,
	last_name,
	salary,
	department_id
FROM
	employees
WHERE
	(department_id = 50)
	AND (job_id = 'ST_MAN')

--|employee_id|first_name|last_name|salary|department_id|
--|-----------|----------|---------|------|-------------|
--|120        |Matthew   |Weiss    |8 000 |50           |
--|121        |Adam      |Fripp    |8 200 |50           |
--|122        |Payam     |Kaufling |7 900 |50           |
--|123        |Shanta    |Vollman  |6 500 |50           |
--|124        |Kevin     |Mourgos  |5 800 |50           |
```

```sql
SELECT
	*
FROM
	orders
WHERE
	(salesman_id = 155)
	AND (order_date = '15.03.2018'
		OR order_date = '02.11.2019');

--|order_id|customer_id|status |salesman_id|order_date|
--|--------|-----------|-------|-----------|----------|
--|101     |3          |Pending|155        |2018-03-15|
--|49      |61         |Shipped|155        |2019-11-02|
--|50      |62         |Pending|155        |2019-11-02|
```

```sql
SELECT
	*
FROM
	orders
WHERE
	(salesman_id = 155)
	AND (order_date = '15.03.2018')
	OR (order_date = '02.11.2019');

--|order_id|customer_id|status |salesman_id|order_date|
--|--------|-----------|-------|-----------|----------|
--|101     |3          |Pending|155        |2018-03-15|
--|49      |61         |Shipped|155        |2019-11-02|
--|50      |62         |Pending|155        |2019-11-02|
--|52      |64         |Shipped|160        |2019-11-02|
--|51      |63         |Shipped|           |2019-11-02|
```
