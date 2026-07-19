Выражение **IN** используется для того, чтобы результат запроса содержал только те строки, в которых значение проверяемого столбца совпадает с одним из значений, указанных в списке.

```sql
SELECT {список столбцов}
FROM {список таблица}
WHERE {имя столбца} IN {список значений};
```

Запрос 1. [Вывести данные о сотрудниках, которые работают в отделах с определёнными номерами](https://github.com/egorbeckish/ArtificialIntelligence/tree/main/SQL+PL-pgSQL/SQL/OperatorsStructure/IN/query1.sql)
```sql
SELECT
	employee_id,
	first_name,
	last_name,
	department_id
FROM
	employees
WHERE
	department_id IN (40, 10, 110);

--|employee_id|first_name|last_name|department_id|
--|-----------|----------|---------|-------------|
--|200        |Jennifer  |Whalen   |10           |
--|203        |Susan     |Mavris   |40           |
--|205        |Shelley   |Higgins  |110          |
--|206        |William   |Gietz    |110          |
```

Запрос 2. [Вывести данные о договорах, заключённых в определённые даты](https://github.com/egorbeckish/ArtificialIntelligence/tree/main/SQL+PL-pgSQL/SQL/OperatorsStructure/IN/query2.sql)
```sql
SELECT
	*
FROM
	orders
WHERE
	order_date IN ('07.09.19', '14.09.19', '19.09.19');

--|order_id|customer_id|status |salesman_id|order_date|
--|--------|-----------|-------|-----------|----------|
--|23      |23         |Shipped|152        |2019-09-07|
--|24      |41         |Shipped|152        |2019-09-07|
--|95      |45         |Shipped|179        |2019-09-19|
--|96      |46         |Shipped|179        |2019-09-14|
```

Запрос 3. [Вывести данные о сотрудниках, которые не работают в отделах с определёнными номерами](https://github.com/egorbeckish/ArtificialIntelligence/tree/main/SQL+PL-pgSQL/SQL/OperatorsStructure/IN/query3.sql)
```sql
SELECT
	employee_id,
	first_name,
	last_name,
	department_id
FROM
	employees
WHERE
	department_id NOT IN (30, 50, 60, 80, 90, 100);

--|employee_id|first_name|last_name|department_id|
--|-----------|----------|---------|-------------|
--|200        |Jennifer  |Whalen   |10           |
--|201        |Michael   |Hartstein|20           |
--|202        |Pat       |Fay      |20           |
--|203        |Susan     |Mavris   |40           |
--|204        |Hermann   |Baer     |70           |
--|205        |Shelley   |Higgins  |110          |
--|206        |William   |Gietz    |110          |
```

Запрос 4. [Вывести названия городов, которые расположены в США (country_id = 'US') или Канаде (country_id = 'CA') и имеют почтовый индекс, заканчивающийся цифрой 2](https://github.com/egorbeckish/ArtificialIntelligence/tree/main/SQL+PL-pgSQL/SQL/OperatorsStructure/IN/query4.sql)
```sql
SELECT
	city
FROM
	locations
WHERE
	country_id IN ('US', 'CA')
	AND (postal_code LIKE '%2');

--|city      |
--|----------|
--|Southlake |
--|Whitehorse|
```

Запрос 5. [Вывести данные о сотрудниках, которые работают в отделах с определёнными номерами, и о сотрудниках, у которых не задан номер отдела (содержит ошибку)](https://github.com/egorbeckish/ArtificialIntelligence/tree/main/SQL+PL-pgSQL/SQL/OperatorsStructure/IN/query5.sql)

---
> Если список значений в **IN** будет содержать **NULL**, то результат выполнения оператора не будет содержать строк, у которых проверяемый столбец имеет значение **NULL**, так как результат сравнения с **NULL** имеет значение **НЕ ОПРЕДЕЛЕНО** (**UNKNOWN**).
```sql
SELECT
	employee_id,
	first_name,
	last_name,
	department_id
FROM
	employees
WHERE
	department_id IN (40, 10, 110, NULL);

--|employee_id|first_name|last_name|department_id|
--|-----------|----------|---------|-------------|
--|200        |Jennifer  |Whalen   |10           |
--|203        |Susan     |Mavris   |40           |
--|205        |Shelley   |Higgins  |110          |
--|206        |William   |Gietz    |110          |
```

Запрос 6. [Вывести данные о сотрудниках, которые не работают в отделах с определёнными номерами](https://github.com/egorbeckish/ArtificialIntelligence/tree/main/SQL+PL-pgSQL/SQL/OperatorsStructure/IN/query6.sql)
```sql
SELECT
	employee_id,
	first_name,
	last_name,
	department_id
FROM
	employees
WHERE
	department_id NOT IN (30, 50, 60, 80, 90, 100, NULL);

--|employee_id|first_name|last_name|department_id|
--|-----------|----------|---------|-------------|
```
---
> Результат выполнения этого запроса не будет содержать строк. Это произойдёт потому, что оператор: ```X NOT IN (A_1, A_2, ..., A_i)``` эквивалентен выражению ```X <> A_1 AND X <> A_2 AND ... AND X <> A_i```

> Если одно из ```A_i``` будет иметь значение **NULL**, то результат этого выражения будет иметь значение **НЕ ОПРЕДЕЛЕНО** (**UNKNOWN**).
