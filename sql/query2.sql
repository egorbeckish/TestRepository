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