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
--|113        |Luis       |Popp     |100          |
--|120        |Matthew    |Weiss    |50           |
--|122        |Payam      |Kaufling |50           |
--|123        |Shanta     |Vollman  |50           |
--|153        |Christopher|Olsen    |80           |
--|154        |Nanette    |Cambrault|80           |
--|155        |Oliver     |Tuvault  |80           |
--|160        |Louise     |Doran    |80           |
--|161        |Sarath     |Sewall   |80           |
--|164        |Mattea     |Marvins  |80           |
--|165        |David      |Lee      |80           |
--|166        |Sundar     |Ande     |80           |
--|167        |Amit       |Banda    |80           |
--|171        |William    |Smith    |80           |
--|172        |Elizabeth  |Bates    |80           |
--|173        |Sundita    |Kumar    |80           |
--|178        |Kimberely  |Grant    |             |
--|179        |Charles    |Johnson  |80           |
--|202        |Pat        |Fay      |20           |
--|203        |Susan      |Mavris   |40           |