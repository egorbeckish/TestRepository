Оператор **SELECT** предназначен для выборки данных из таблиц, то есть он реализует одно из основных назначений базы данных - предоставлять пользователю информацию. Результатом выполнения оператора **SELECT** является таблица.

Структура оператора представлена в следующем виде:
```sql
SELECT [ALL|DISTINCT] {список столбцов или выражений}
[FROM {список таблиц}]
[WHERE {условия выбора}]
[GROUP BY {столбцы группировки}]
[HAVING {условия на группу}];
[ORDER BY {столбцы сортировки [ASC|DESC]}]
[LIMIT {N}][OFFSET{M}];
```

Запрос 1. [Вывод содержимого одного столбца](https://github.com/egorbeckish/TestRepository/blob/main/SELECT/sql/query1.sql)
```sql
SELECT
	employee_id
FROM
	employees;

--|employee_id|
--|-----------|
--|100        |
--|101        |
--|102        |
--|103        |
--|104        |
--|...        |
--|126        |
```

Запрос 2. [Вывод содержимого нескольких столбцов](https://github.com/egorbeckish/TestRepository/blob/main/SELECT/sql/query2.sql)
```sql
SELECT
	employee_id,
	first_name,
	last_name,
	department_id
FROM
	employees;

--|employee_id|first_name |last_name  |department_id|
--|-----------|-----------|-----------|-------------|
--|100        |Steven     |King       |90           |
--|101        |Neena      |Kochhar    |90           |
--|102        |Lex        |De Haan    |90           |
--|103        |Alexander  |Hunold     |60           |
--|104        |Bruce      |Ernst      |60           |
--|106        |Valli      |Pataballa  |60           |
--|...        |...        |...        |...          |
--|126        |Irene      |Mikkilineni|50           |
```

Запрос 3. [Вывод значений всех столбцов](https://github.com/egorbeckish/TestRepository/blob/main/SELECT/sql/query3.sql)
```sql
SELECT
	*
FROM
	employees;

--|employee_id|first_name |last_name  |email   |phone_number      |hire_date |job_id    |salary|commission_pct|manager_id|department_id|rating_e|
--|-----------|-----------|-----------|--------|------------------|----------|----------|------|--------------|----------|-------------|--------|
--|100        |Steven     |King       |SKING   |515.123.4567      |1987-06-17|AD_PRES   |24 000|              |          |90           |4       |
--|101        |Neena      |Kochhar    |NKOCHHAR|515.123.4568      |1989-09-21|AD_VP     |17 000|              |100       |90           |5       |
--|102        |Lex        |De Haan    |LDEHAAN |515.123.4569      |1993-01-13|AD_VP     |17 000|              |100       |90           |3       |
--|103        |Alexander  |Hunold     |AHUNOLD |590.423.4567      |1990-01-03|IT_PROG   |9 000 |              |102       |60           |3       |
--|104        |Bruce      |Ernst      |BERNST  |590.423.4568      |1991-05-21|IT_PROG   |6 000 |              |103       |60           |3       |
--|...        |...        |...        |...     |...               |...       |...       |...   |...           |...       |...          |...     |
--|126        |Irene      |Mikkilineni|IMIKKILI|650.124.1224      |1998-09-28|PU_CLERK  |2 700 |              |120       |50           |        |
```

Запрос 4. [Вывод значений столбца job_id](https://github.com/egorbeckish/TestRepository/blob/main/SELECT/sql/query4.sql)
```sql
SELECT
	job_id
FROM
	employees;

--|job_id    |
--|----------|
--|AD_PRES   |
--|AD_VP     |
--|AD_VP     |
--|IT_PROG   |
--|IT_PROG   |
--|...       |
--|PU_CLERK  |
```

Запрос 5. [Вывод значений столбца job_id без дублирования](https://github.com/egorbeckish/TestRepository/blob/main/SELECT/sql/query5.sql)
```sql
SELECT
	DISTINCT job_id
FROM
	employees;

--|job_id    |
--|----------|
--|SH_CLERK  |
--|AD_VP     |
--|SA_MAN    |
--|...       |
--|AC_ACCOUNT|

```
