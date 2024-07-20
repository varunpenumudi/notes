# TABLES

The information in a database is stored in form of tables. These tables are the ones similar to the ones we see in the spreadsheet. they contains rows and columns of data.

## CONTENTS

- CREATE
  - Data Types
- SELECT
- RENAME
- Alter

## CREATE TABLE

To create a new table in the current database we have to use the following syntax

**Syntax:**

```sql
CREATE TABLE table_name (
    field_name1 dtype1,
    field_name2 dtype2,
    ....
    ....
    ....
)
```

**Example:**

```sql
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(30),
    emp_wage DECIMAL(5, 2),
    hire_date DATE,
)
```

This command creates the following empty table in the current database being used.

| emp_id | emp_name | emp_wage | hire_date |
| -------- | ------- | ------- | ------- |
| - | - |  - | - |


## Data types

As you can see in the above examples while giving field names we also need to give their respective data types stored in that column.

Some useful datatypes are:

- `INT`: Integer datatype
- `VARCHAR(limit)`: Variable Length Char with limit no.of maximum characters
- `DECIMAL(digits, decimal places)`: Decimal with maximum digits adn decimal places to store.
- `DATE`: the datatype which represents dates.

## SELECT

To access elements in a table we use the **SELECT** keyword. to select every thing from a table we use the following syntax:

**Syntax:**

```sql
SELECT * FROM table_name
```

Here `*` is a wild card character which means select every row from the table

## RENAME  

This keyword can be used to rename the table using the following syntax.

```sql
RENAME TABLE prev_table_name TO new_table_name
```

## ALTER TABLE

The `ALTER` keyword along with `TABLE` can be used to modify table to do things such as adding new row to it.

**Example:**

```sql
ALTER TABLE table_name ADD new_row dtype;
```
