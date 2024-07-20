# Basic Commands
These are commands for basic operations in SQL such as:
- creating a database.
- using a database.
- deleting a database.

## CREATE a Database
To create a new Database we use the **CREATE** keyword followed by **DATABASE** keyword and it's name.

**Example:**
```sql
CREATE DATABASE db_name;
```

## USE Database
we can use the **USE** command to access a specific database to work with it. alternately in mysql we can right click on that database in schema menu on left side and set it as default schema.

**Example:**
```sql
USE db_name;
```


## DROP Database
we can delete a database using **DROP** keyword followed by the database name.

**Example:**
```sql
DROP DATABASE db_name;
```

## Other Basic Commands

### READ ONLY
we can set a database as Read only so that we can only see and access its content but cannot modify them.

**Read Only Mode**:
```sql
ALTER DATABASE db_name READ ONLY = 1;
```
**Disable Read Only Mode**:
```sql
ALTER DATABASE db_name READ ONLY = 0;
```