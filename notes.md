Here’s a **very short note** on the commands:

* **`mysql -u root -p`** → Login to MySQL as root user.
* **`SHOW DATABASES;`** → List all databases.
* **`CREATE DATABASE db;`** → Create a new database named *db*.
* **`USE db;`** → Select *db* as the current working database.

👉 After this, you can create tables and insert data inside *db*.




Here’s a **short note** explaining your `CREATE TABLE` statement and the datatypes used:

---

### 📌 Creating Table in MariaDB

**Command used:**

```sql
CREATE TABLE emp (
  ID INT,
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  Age INT,
  Zone VARCHAR(255)
);
```

✅ This creates a table named **`emp`** with 5 columns.

---

### 🔹 Column Details & Data Types

* **`ID INT`** → Stores employee ID as an integer (whole number).
* **`FirstName VARCHAR(255)`** → Stores first name as text, up to 255 characters.
* **`LastName VARCHAR(255)`** → Stores last name as text, up to 255 characters.
* **`Age INT`** → Stores employee’s age as an integer.
* **`Zone VARCHAR(255)`** → Stores zone/region name as text, up to 255 characters.

---

👉 **Note:**

* `INT` = numeric data type (no decimals).
* `VARCHAR(n)` = variable-length string (up to *n* characters).
* This table has **no primary key** yet (optional but recommended, usually `ID`).


When you run:

```sql
DESC emp;
```

or

```sql
DESCRIBE emp;
```

MariaDB will show the structure of the table `emp`.

---

### ✅ Expected Output

```
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| ID        | int(11)      | YES  |     | NULL    |       |
| FirstName | varchar(255) | YES  |     | NULL    |       |
| LastName  | varchar(255) | YES  |     | NULL    |       |
| Age       | int(11)      | YES  |     | NULL    |       |
| Zone      | varchar(255) | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
```

---

### 🔹 Explanation of Columns

* **Field** → Column name (ID, FirstName, LastName, Age, Zone).
* **Type** → Data type (`INT`, `VARCHAR(255)`).
* **Null** → `YES` means column can have empty (NULL) values.
* **Key** → Shows if it’s a primary key or indexed (empty right now).
* **Default** → Default value (here `NULL`).
* **Extra** → Extra info (e.g., `auto_increment` if set).



---
### **Insert Commands**
* **`INSERT INTO emp (...) VALUES (...);`** → Adds new rows into the table.

```
INSERT INTO emp (ID, FirstName, LastName, Age, Zone)
VALUES (1, 'Pawan', 'Kaur', 18, 'North'),
       (2, 'Ayush', 'Gupta', 18, 'East'),
       (3, 'Moli', 'Gupta', 14, 'West'),
       (4, 'Piyush', 'Gupta', 13, 'South');
```

* **`SELECT * FROM emp;`** → Displays all rows and columns from the table.

```
+----+-----------+----------+------+-------+
| ID | FirstName | LastName | Age  | Zone  |
+----+-----------+----------+------+-------+
|  1 | Pawan     | Kaur     |   18 | North |
|  2 | Ayush     | Gupta    |   18 | East  |
|  3 | Moli      | Gupta    |   14 | West  |
|  4 | Piyush    | Gupta    |   13 | South |
+----+-----------+----------+------+-------+
```
* Without **PRIMARY KEY**, duplicate IDs are allowed (all rows had `ID = 1`).
* To avoid duplicates:

  ```sql
  CREATE TABLE emp (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Age INT,
    Zone VARCHAR(255)
  );
  ```
* With **AUTO\_INCREMENT**, `ID` is generated automatically and stays unique.

---

### **Short note on the `SELECT` statement** in SQL:

---

### 📌 `SELECT` Statement in SQL

* The `SELECT` statement is used to **retrieve data** from a database.
* **Basic Syntax:**

  ```sql
  SELECT column1, column2, ... FROM table_name;
  ```

  * `column1, column2` → columns you want to display.
  * `*` → selects all columns.
  * `table_name` → the table from which data is fetched.

---

### 🔹 Examples

* **Select all columns:**

  ```sql
  SELECT * FROM emp;
  ```
* **Select specific columns:**

  ```sql
  SELECT FirstName, Age FROM emp;
  ```
* **Select with condition:**

  ```sql
  SELECT * FROM emp WHERE Age > 18;
  ```
* **Select with sorting:**

  ```sql
  SELECT * FROM emp ORDER BY Age DESC;
  ```

---

👉 In short: `SELECT` = **query command** to view data with options for filtering (`WHERE`), sorting (`ORDER BY`), and limiting results.

---


## **Short note** on the command **``` select distinct Age from emp;```** used:


### 📌 `SELECT DISTINCT`

* **Purpose:** Removes duplicate values and shows only **unique results**.
* **Syntax:**

  ```sql
  SELECT DISTINCT column_name FROM table_name;
  ```

---

### 🔹 Example

```sql
SELECT DISTINCT Age FROM emp;
```

👉 This will display each **unique Age** from the `emp` table, without repeating values.

**If your table has:**

```
Age
----
13
18
15
15
```

**Output will be:**

```
Age
----
13
18
15
```

---

✅ Use `DISTINCT` when you want to avoid duplicates in query results.



### Here’s a **short note** on `NOT NULL` in MariaDB with example:

---

### 📌 `NOT NULL` Constraint

* **Definition:** Ensures that a column **cannot have NULL values**.
* Used when a column must always store a valid value.
* **Syntax:**

  ```sql
  column_name datatype NOT NULL
  ```

---

### 🔹 Example from your table

```sql
CREATE TABLE demo (
  ID INT NOT NULL,
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  Age INT
);
```

* Here, `ID` is declared as **NOT NULL**.
* This means you **cannot insert NULL** into the `ID` column.

---

### 🔹 Behavior

```sql
INSERT INTO demo(ID, FirstName, LastName, Age)
VALUES (NULL, 'jack', 'sparrow', 40);
```

❌ Error: `Column 'ID' cannot be null`

```sql
INSERT INTO demo(ID, FirstName, LastName, Age)
VALUES (1, 'jack', 'sparrow', 40);
```

✅ Works, since `ID` has a valid (non-NULL) value.

---

👉 In short: `NOT NULL` makes sure a column **always has a value**.





### 📌 Difference between `NOT NULL` and `PRIMARY KEY`

#### 🔹 `NOT NULL`

* Ensures a column **cannot have NULL values**.
* Does **not** enforce uniqueness → duplicate values are allowed.
* Example:

  ```sql
  CREATE TABLE demo (
    ID INT NOT NULL,
    Name VARCHAR(100)
  );
  ```

  * `ID` cannot be `NULL`, but can repeat (e.g., two rows with `ID = 1`).

---

#### 🔹 `PRIMARY KEY`

* Combines **NOT NULL** + **UNIQUE**.
* Ensures column values are **never NULL** and **must be unique**.
* Every table can have **only one primary key**.
* Example:

  ```sql
  CREATE TABLE emp (
    ID INT PRIMARY KEY,
    Name VARCHAR(100)
  );
  ```

  * `ID` must be non-NULL and unique (no duplicates).

---

### ✅ Quick Comparison

| Feature                   | NOT NULL     | PRIMARY KEY                                                            |
| ------------------------- | ------------ | ---------------------------------------------------------------------- |
| NULL Allowed?             | ❌ No         | ❌ No                                                                   |
| Duplicate Values Allowed? | ✅ Yes        | ❌ No                                                                   |
| Uniqueness Enforced?      | ❌ No         | ✅ Yes                                                                  |
| Count per Table           | Many columns | Only 1 primary key (but it can cover multiple columns = composite key) |
---
👉 In short:

* **Use `NOT NULL`** when a column must always have a value.
* **Use `PRIMARY KEY`** when you want a column to uniquely identify each row.
---



### **Foreign Key**
**Foreign Key :**  is a key that is taken from the another table as a reference
  ```
   MariaDB [ayushdb]> create table dep(
    -> D_ID int not null,
    -> D_n varchar(255) not null,
    -> ID int,
    -> primary key (D_ID),
    -> foreign key (ID) references demo1(ID));
  Query OK, 0 rows affected (0.093 sec)
  ```
`foreign key (ID) references demo1(ID));` is the command to connect the `ID` if `demo1` table to the ID in this table.


### **Unique Constraint**
**Note:** A table can have only one Primary Key but van have many unique values

**Input:**
  ```
  MariaDB [ayushdb]> create table emp(
      -> ID int not null,
      -> FN varchar(255),
      -> LN varchar(255),
      -> unique(ID));
  Query OK, 0 rows affected (0.017 sec)
  ```


**Output:**
  ```
  MariaDB [ayushdb]> desc emp
      -> ;
  +-------+--------------+------+-----+---------+-------+
  | Field | Type         | Null | Key | Default | Extra |
  +-------+--------------+------+-----+---------+-------+
  | ID    | int(11)      | NO   | PRI | NULL    |       |
  | FN    | varchar(255) | YES  |     | NULL    |       |
  | LN    | varchar(255) | YES  |     | NULL    |       |
  +-------+--------------+------+-----+---------+-------+
  3 rows in set (0.022 sec)
  ```
### **Default Constraint**
**Default Constraint:** It is used to set a `default value` in a table column.

**Input:**
```
MariaDB [ayushdb]> create table emp1(
    -> ID int not null,
    -> FN varchar(255),
    -> LN varchar(255),
    -> ED varchar(255) default 'oprations');
Query OK, 0 rows affected (0.014 sec)
```
  ` ED varchar(255) default 'oprations');` is the command to set default values.

**Output:**
```
MariaDB [ayushdb]> desc emp1
    -> ;
+-------+--------------+------+-----+-----------+-------+
| Field | Type         | Null | Key | Default   | Extra |
+-------+--------------+------+-----+-----------+-------+
| ID    | int(11)      | NO   |     | NULL      |       |
| FN    | varchar(255) | YES  |     | NULL      |       |
| LN    | varchar(255) | YES  |     | NULL      |       |
| ED    | varchar(255) | YES  |     | oprations |       |
+-------+--------------+------+-----+-----------+-------+
4 rows in set (0.031 sec)
```
**Inserting Value:**
```
MariaDB [ayushdb]> insert into emp1(ID,FN,LN)
    -> value(1,'Ayush','Gupta'),
    -> (2,'Moli','Gupta');
Query OK, 2 rows affected (0.006 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [ayushdb]> select * from emp1
    -> ;
+----+-------+-------+-----------+
| ID | FN    | LN    | ED        |
+----+-------+-------+-----------+
|  1 | Ayush | Gupta | oprations |
|  2 | Moli  | Gupta | oprations |
+----+-------+-------+-----------+
2 rows in set (0.001 sec)
```

### **Check constraint**
**create a table:**
```
MariaDB [ayushdb]> create table emp2(
    -> ID int not null,
    -> FN varchar(255),
    -> LN varchar(255),
    -> Age int,
    -> check(Age>20));
Query OK, 0 rows affected (0.041 sec)

MariaDB [ayushdb]> desc emp2;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| ID    | int(11)      | NO   |     | NULL    |       |
| FN    | varchar(255) | YES  |     | NULL    |       |
| LN    | varchar(255) | YES  |     | NULL    |       |
| Age   | int(11)      | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
4 rows in set (0.028 sec)
```
**Insert Values**
```
MariaDB [ayushdb]> insert into emp2 (ID, FN, LN, Age)
    -> values(1,'Ayush','Gupta',18);
ERROR 4025 (23000): CONSTRAINT `CONSTRAINT_1` failed for `ayushdb`.`emp2`
MariaDB [ayushdb]> insert into emp2 (ID, FN, LN, Age)
    -> values(1,'Ayush','Gupta',20);
ERROR 4025 (23000): CONSTRAINT `CONSTRAINT_1` failed for `ayushdb`.`emp2`
MariaDB [ayushdb]> insert into emp2 (ID, FN, LN, Age)
    -> values(1,'Ayush','Gupta',22);
Query OK, 1 row affected (0.003 sec)
```
**Note:** It is gibing error because we were tring to enter a age less than 20

**Output:**
```
MariaDB [ayushdb]> select * from emp2
    -> ;
+----+-------+-------+------+
| ID | FN    | LN    | Age  |
+----+-------+-------+------+
|  1 | Ayush | Gupta |   22 |
+----+-------+-------+------+
1 row in set (0.001 sec)
```

### **Alter Table**
**Alter table:** It is used to alter the table eather add or delete some thing in a table.


**Adding a Column:**
```
MariaDB [ayushdb]> desc emp2;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| ID    | int(11)      | NO   |     | NULL    |       |
| FN    | varchar(255) | YES  |     | NULL    |       |
| LN    | varchar(255) | YES  |     | NULL    |       |
| Age   | int(11)      | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
4 rows in set (0.055 sec)

MariaDB [ayushdb]> alter table emp2
    -> add EZ varchar(255);
Query OK, 0 rows affected (0.046 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ayushdb]> desc emp2;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| ID    | int(11)      | NO   |     | NULL    |       |
| FN    | varchar(255) | YES  |     | NULL    |       |
| LN    | varchar(255) | YES  |     | NULL    |       |
| Age   | int(11)      | YES  |     | NULL    |       |
| EZ    | varchar(255) | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
5 rows in set (0.063 sec)
```
**Deleating a column:**
```
MariaDB [ayushdb]> desc emp2;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| ID    | int(11)      | NO   |     | NULL    |       |
| FN    | varchar(255) | YES  |     | NULL    |       |
| LN    | varchar(255) | YES  |     | NULL    |       |
| Age   | int(11)      | YES  |     | NULL    |       |
| EZ    | varchar(255) | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
5 rows in set (0.063 sec)

MariaDB [ayushdb]> alter table emp2
    -> drop column EZ;
Query OK, 0 rows affected (0.042 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ayushdb]> desc emp2;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| ID    | int(11)      | NO   |     | NULL    |       |
| FN    | varchar(255) | YES  |     | NULL    |       |
| LN    | varchar(255) | YES  |     | NULL    |       |
| Age   | int(11)      | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
4 rows in set (0.061 sec)

```

**Modify Table:**

```
MariaDB [ayushdb]> desc emp2;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| ID    | int(11)      | NO   |     | NULL    |       |
| FN    | varchar(255) | YES  |     | NULL    |       |
| LN    | varchar(255) | YES  |     | NULL    |       |
| Age   | int(11)      | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
4 rows in set (0.061 sec)

MariaDB [ayushdb]> alter table emp2
    -> modify column Age varchar(255);
Query OK, 1 row affected (0.079 sec)
Records: 1  Duplicates: 0  Warnings: 0

MariaDB [ayushdb]> desc emp2;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| ID    | int(11)      | NO   |     | NULL    |       |
| FN    | varchar(255) | YES  |     | NULL    |       |
| LN    | varchar(255) | YES  |     | NULL    |       |
| Age   | varchar(255) | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
4 rows in set (0.039 sec)
```

**AND OPRATOR:** used to give more than one condition.

```
MariaDB [ayushdb]> select * from emp;
+----+----------+-------+------+-------+
| ID | FN       | LN    | AGE  | ZONE  |
+----+----------+-------+------+-------+
|  1 | Ayush    | Gupta |   18 | North |
|  2 | Sachin   | Sahu  |   29 | North |
|  3 | pawan    | aaaa  |   18 | South |
|  4 | abhishak | roun  |   18 | North |
+----+----------+-------+------+-------+
4 rows in set (0.001 sec)

MariaDB [ayushdb]> select * from emp
    -> where AGE=18 and ZONE='North';
+----+----------+-------+------+-------+
| ID | FN       | LN    | AGE  | ZONE  |
+----+----------+-------+------+-------+
|  1 | Ayush    | Gupta |   18 | North |
|  4 | abhishak | roun  |   18 | North |
+----+----------+-------+------+-------+
2 rows in set (0.001 sec)

MariaDB [ayushdb]> select * from emp
    -> where AGE>=25 and LN='Sahu';
+----+--------+------+------+-------+
| ID | FN     | LN   | AGE  | ZONE  |
+----+--------+------+------+-------+
|  2 | Sachin | Sahu |   29 | North |
+----+--------+------+------+-------+
1 row in set (0.001 sec)
```

**OR oprator**
```
MariaDB [ayushdb]> select * from emp;
+----+----------+-------+------+-------+
| ID | FN       | LN    | AGE  | ZONE  |
+----+----------+-------+------+-------+
|  1 | Ayush    | Gupta |   18 | North |
|  2 | Sachin   | Sahu  |   29 | North |
|  3 | pawan    | aaaa  |   18 | South |
|  4 | abhishak | roun  |   18 | North |
+----+----------+-------+------+-------+
4 rows in set (0.001 sec)

MariaDB [ayushdb]> select * from emp
    -> where ZONE='north' or 'East';
+----+----------+-------+------+-------+
| ID | FN       | LN    | AGE  | ZONE  |
+----+----------+-------+------+-------+
|  1 | Ayush    | Gupta |   18 | North |
|  2 | Sachin   | Sahu  |   29 | North |
|  4 | abhishak | roun  |   18 | North |
+----+----------+-------+------+-------+
3 rows in set, 5 warnings (0.001 sec)

MariaDB [ayushdb]> select * from emp
    -> where fn='Ao' or ln='sahu';
+----+--------+------+------+-------+
| ID | FN     | LN   | AGE  | ZONE  |
+----+--------+------+------+-------+
|  2 | Sachin | Sahu |   29 | North |
+----+--------+------+------+-------+
1 row in set (0.001 sec)
```


**NOT OPRATOR**
```
MariaDB [ayushdb]> select * from emp;
+----+----------+-------+------+-------+
| ID | FN       | LN    | AGE  | ZONE  |
+----+----------+-------+------+-------+
|  1 | Ayush    | Gupta |   18 | North |
|  2 | Sachin   | Sahu  |   29 | North |
|  3 | pawan    | aaaa  |   18 | South |
|  4 | abhishak | roun  |   18 | North |
+----+----------+-------+------+-------+
4 rows in set (0.001 sec)

MariaDB [ayushdb]> select * from emp
    -> where not Age=29;
+----+----------+-------+------+-------+
| ID | FN       | LN    | AGE  | ZONE  |
+----+----------+-------+------+-------+
|  1 | Ayush    | Gupta |   18 | North |
|  3 | pawan    | aaaa  |   18 | South |
|  4 | abhishak | roun  |   18 | North |
+----+----------+-------+------+-------+
3 rows in set (0.001 sec)

MariaDB [ayushdb]> select * from emp
    -> where not zone='south';
+----+----------+-------+------+-------+
| ID | FN       | LN    | AGE  | ZONE  |
+----+----------+-------+------+-------+
|  1 | Ayush    | Gupta |   18 | North |
|  2 | Sachin   | Sahu  |   29 | North |
|  4 | abhishak | roun  |   18 | North |
+----+----------+-------+------+-------+
3 rows in set (0.001 sec)
```

**IN , NOT IN oprator**
```
MariaDB [ayushdb]> select * from emp;
+----+----------+-------+------+-------+
| ID | FN       | LN    | AGE  | ZONE  |
+----+----------+-------+------+-------+
|  1 | Ayush    | Gupta |   18 | North |
|  2 | Sachin   | Sahu  |   29 | North |
|  3 | pawan    | aaaa  |   18 | South |
|  4 | abhishak | roun  |   18 | North |
+----+----------+-------+------+-------+
4 rows in set (0.001 sec)

MariaDB [ayushdb]> select * from emp
    -> where ZONE in ('no','south')
    -> ;
+----+-------+------+------+-------+
| ID | FN    | LN   | AGE  | ZONE  |
+----+-------+------+------+-------+
|  3 | pawan | aaaa |   18 | South |
+----+-------+------+------+-------+
1 row in set (0.001 sec)

MariaDB [ayushdb]> select * from emp
    -> where ln in ('gupta','sahu');
+----+--------+-------+------+-------+
| ID | FN     | LN    | AGE  | ZONE  |
+----+--------+-------+------+-------+
|  1 | Ayush  | Gupta |   18 | North |
|  2 | Sachin | Sahu  |   29 | North |
+----+--------+-------+------+-------+
2 rows in set (0.001 sec)

MariaDB [ayushdb]> select * from emp
    -> where ln not in ('gupta','sahu');
+----+----------+------+------+-------+
| ID | FN       | LN   | AGE  | ZONE  |
+----+----------+------+------+-------+
|  3 | pawan    | aaaa |   18 | South |
|  4 | abhishak | roun |   18 | North |
+----+----------+------+------+-------+
2 rows in set (0.001 sec)
```

**LIKE oprator**

`example 1`
```
MariaDB [ayushdb]> select * from emp;
+----+----------+-------+------+-------+
| ID | FN       | LN    | AGE  | ZONE  |
+----+----------+-------+------+-------+
|  1 | Ayush    | Gupta |   18 | North |
|  2 | Sachin   | Sahu  |   29 | North |
|  3 | pawan    | aaaa  |   18 | South |
|  4 | abhishak | roun  |   18 | North |
+----+----------+-------+------+-------+
4 rows in set (0.001 sec)

MariaDB [ayushdb]> select * from emp
    -> where fn like 'a%';
+----+----------+-------+------+-------+
| ID | FN       | LN    | AGE  | ZONE  |
+----+----------+-------+------+-------+
|  1 | Ayush    | Gupta |   18 | North |
|  4 | abhishak | roun  |   18 | North |
+----+----------+-------+------+-------+
2 rows in set (0.001 sec)
```
`example 2`
```
MariaDB [ayushdb]> select * from emp
    -> where ln like 's%';
+----+--------+------+------+-------+
| ID | FN     | LN   | AGE  | ZONE  |
+----+--------+------+------+-------+
|  2 | Sachin | Sahu |   29 | North |
+----+--------+------+------+-------+
1 row in set (0.001 sec)
```

`Example 3`
```
MariaDB [ayushdb]> select * from emp;
+----+----------+-------+------+-------+
| ID | FN       | LN    | AGE  | ZONE  |
+----+----------+-------+------+-------+
|  1 | Ayush    | Gupta |   18 | North |
|  2 | Sachin   | Sahu  |   29 | North |
|  3 | pawan    | aaaa  |   18 | South |
|  4 | abhishak | roun  |   18 | North |
+----+----------+-------+------+-------+
4 rows in set (0.001 sec)

MariaDB [ayushdb]> select * from emp
    -> where zone like '%h';
+----+----------+-------+------+-------+
| ID | FN       | LN    | AGE  | ZONE  |
+----+----------+-------+------+-------+
|  1 | Ayush    | Gupta |   18 | North |
|  2 | Sachin   | Sahu  |   29 | North |
|  3 | pawan    | aaaa  |   18 | South |
|  4 | abhishak | roun  |   18 | North |
+----+----------+-------+------+-------+
4 rows in set (0.001 sec)
```
`Example 4`
```
MariaDB [ayushdb]> select * from emp
    -> where zone like '___t_';
+----+----------+-------+------+-------+
| ID | FN       | LN    | AGE  | ZONE  |
+----+----------+-------+------+-------+
|  1 | Ayush    | Gupta |   18 | North |
|  2 | Sachin   | Sahu  |   29 | North |
|  3 | pawan    | aaaa  |   18 | South |
|  4 | abhishak | roun  |   18 | North |
+----+----------+-------+------+-------+
4 rows in set (0.001 sec)

MariaDB [ayushdb]> select * from emp
    -> where zone like '___t';
Empty set (0.001 sec)

```

**Between**

```
MariaDB [ayushdb]> select * from emp
    -> ;
ERROR 2006 (HY000): MySQL server has gone away
No connection. Trying to reconnect...
Connection id:    88
Current database: ayushdb

+----+----------+-------+------+-------+
| ID | FN       | LN    | AGE  | ZONE  |
+----+----------+-------+------+-------+
|  1 | Ayush    | Gupta |   18 | North |
|  2 | Sachin   | Sahu  |   29 | North |
|  3 | pawan    | aaaa  |   18 | South |
|  4 | abhishak | roun  |   18 | North |
+----+----------+-------+------+-------+
4 rows in set (0.012 sec)

MariaDB [ayushdb]> select * from emp
    -> where age between 25 and 30;
+----+--------+------+------+-------+
| ID | FN     | LN   | AGE  | ZONE  |
+----+--------+------+------+-------+
|  2 | Sachin | Sahu |   29 | North |
+----+--------+------+------+-------+
1 row in set (0.001 sec)

MariaDB [ayushdb]> select * from emp
    -> where age not between 25 and 30;
+----+----------+-------+------+-------+
| ID | FN       | LN    | AGE  | ZONE  |
+----+----------+-------+------+-------+
|  1 | Ayush    | Gupta |   18 | North |
|  3 | pawan    | aaaa  |   18 | South |
|  4 | abhishak | roun  |   18 | North |
+----+----------+-------+------+-------+
3 rows in set (0.001 sec)
```

**CASE**
```
MariaDB [ayushdb]> select * from emp;
+----+--------+----------+------+------------+
| ID | FN     | LN       | AGE  | ZONE       |
+----+--------+----------+------+------------+
|  1 | Ayush  | Sharma   |   28 | North      |
|  2 | Priya  | Verma    |   34 | East       |
|  3 | Rohan  | Mehta    |   41 | West       |
|  4 | Sneha  | Patel    |   25 | South      |
|  5 | Karan  | Singh    |   30 | Central    |
|  6 | Neha   | Jain     |   29 | North-East |
|  7 | Arjun  | Reddy    |   38 | South-West |
|  8 | Divya  | Kapoor   |   33 | North-West |
|  9 | Vikram | Joshi    |   45 | East       |
| 10 | Meera  | Nair     |   27 | South-East |
| 11 | Tanvi  | Chopra   |   26 | North      |
| 12 | Aman   | Gill     |   32 | West       |
| 13 | Ritika | Malhotra |   24 | South-East |
| 14 | Harsh  | Thakur   |   37 | Central    |
| 15 | Simran | Kaur     |   31 | North-East |
| 16 | Rajeev | Bansal   |   40 | South-West |
| 17 | Isha   | Arora    |   28 | East       |
| 18 | Nikhil | Dey      |   35 | North-West |
| 19 | Tanya  | Mishra   |   30 | South      |
| 20 | Yuvraj | Chandel  |   42 | West       |
+----+--------+----------+------+------------+
20 rows in set (0.001 sec)

MariaDB [ayushdb]> select fn,ln,age,
    -> case
    -> when age > 25 then 'EMPLOYEE WITH EXPRIWNCE.'
    -> when age = 25 then 'EMP is mid-experieanced level'
    -> else 'freshers... new to company'
    -> end as eligibility
    -> from emp;
+--------+----------+------+-------------------------------+
| fn     | ln       | age  | eligibility                   |
+--------+----------+------+-------------------------------+
| Ayush  | Sharma   |   28 | EMPLOYEE WITH EXPRIWNCE.      |
| Priya  | Verma    |   34 | EMPLOYEE WITH EXPRIWNCE.      |
| Rohan  | Mehta    |   41 | EMPLOYEE WITH EXPRIWNCE.      |
| Sneha  | Patel    |   25 | EMP is mid-experieanced level |
| Karan  | Singh    |   30 | EMPLOYEE WITH EXPRIWNCE.      |
| Neha   | Jain     |   29 | EMPLOYEE WITH EXPRIWNCE.      |
| Arjun  | Reddy    |   38 | EMPLOYEE WITH EXPRIWNCE.      |
| Divya  | Kapoor   |   33 | EMPLOYEE WITH EXPRIWNCE.      |
| Vikram | Joshi    |   45 | EMPLOYEE WITH EXPRIWNCE.      |
| Meera  | Nair     |   27 | EMPLOYEE WITH EXPRIWNCE.      |
| Tanvi  | Chopra   |   26 | EMPLOYEE WITH EXPRIWNCE.      |
| Aman   | Gill     |   32 | EMPLOYEE WITH EXPRIWNCE.      |
| Ritika | Malhotra |   24 | freshers... new to company    |
| Harsh  | Thakur   |   37 | EMPLOYEE WITH EXPRIWNCE.      |
| Simran | Kaur     |   31 | EMPLOYEE WITH EXPRIWNCE.      |
| Rajeev | Bansal   |   40 | EMPLOYEE WITH EXPRIWNCE.      |
| Isha   | Arora    |   28 | EMPLOYEE WITH EXPRIWNCE.      |
| Nikhil | Dey      |   35 | EMPLOYEE WITH EXPRIWNCE.      |
| Tanya  | Mishra   |   30 | EMPLOYEE WITH EXPRIWNCE.      |
| Yuvraj | Chandel  |   42 | EMPLOYEE WITH EXPRIWNCE.      |
+--------+----------+------+-------------------------------+
20 rows in set (0.001 sec)

```

**comment**

```
MariaDB [ayushdb]> select * from emp; # featch all record from table emp
+----+--------+----------+------+------------+
| ID | FN     | LN       | AGE  | ZONE       |
+----+--------+----------+------+------------+
|  1 | Ayush  | Sharma   |   28 | North      |
|  2 | Priya  | Verma    |   34 | East       |
|  3 | Rohan  | Mehta    |   41 | West       |
|  4 | Sneha  | Patel    |   25 | South      |
|  5 | Karan  | Singh    |   30 | Central    |
|  6 | Neha   | Jain     |   29 | North-East |
|  7 | Arjun  | Reddy    |   38 | South-West |
|  8 | Divya  | Kapoor   |   33 | North-West |
|  9 | Vikram | Joshi    |   45 | East       |
| 10 | Meera  | Nair     |   27 | South-East |
| 11 | Tanvi  | Chopra   |   26 | North      |
| 12 | Aman   | Gill     |   32 | West       |
| 13 | Ritika | Malhotra |   24 | South-East |
| 14 | Harsh  | Thakur   |   37 | Central    |
| 15 | Simran | Kaur     |   31 | North-East |
| 16 | Rajeev | Bansal   |   40 | South-West |
| 17 | Isha   | Arora    |   28 | East       |
| 18 | Nikhil | Dey      |   35 | North-West |
| 19 | Tanya  | Mishra   |   30 | South      |
| 20 | Yuvraj | Chandel  |   42 | West       |
+----+--------+----------+------+------------+
20 rows in set (0.001 sec)

MariaDB [ayushdb]> select * from emp; -- featch all record from table emp
+----+--------+----------+------+------------+
| ID | FN     | LN       | AGE  | ZONE       |
+----+--------+----------+------+------------+
|  1 | Ayush  | Sharma   |   28 | North      |
|  2 | Priya  | Verma    |   34 | East       |
|  3 | Rohan  | Mehta    |   41 | West       |
|  4 | Sneha  | Patel    |   25 | South      |
|  5 | Karan  | Singh    |   30 | Central    |
|  6 | Neha   | Jain     |   29 | North-East |
|  7 | Arjun  | Reddy    |   38 | South-West |
|  8 | Divya  | Kapoor   |   33 | North-West |
|  9 | Vikram | Joshi    |   45 | East       |
| 10 | Meera  | Nair     |   27 | South-East |
| 11 | Tanvi  | Chopra   |   26 | North      |
| 12 | Aman   | Gill     |   32 | West       |
| 13 | Ritika | Malhotra |   24 | South-East |
| 14 | Harsh  | Thakur   |   37 | Central    |
| 15 | Simran | Kaur     |   31 | North-East |
| 16 | Rajeev | Bansal   |   40 | South-West |
| 17 | Isha   | Arora    |   28 | East       |
| 18 | Nikhil | Dey      |   35 | North-West |
| 19 | Tanya  | Mishra   |   30 | South      |
| 20 | Yuvraj | Chandel  |   42 | West       |
+----+--------+----------+------+------------+
20 rows in set (0.001 sec)

MariaDB [ayushdb]> select *
    -> /*
   /*> retrive
   /*> all data
   /*> from the table emp
   /*> */
    -> from emp;
+----+--------+----------+------+------------+
| ID | FN     | LN       | AGE  | ZONE       |
+----+--------+----------+------+------------+
|  1 | Ayush  | Sharma   |   28 | North      |
|  2 | Priya  | Verma    |   34 | East       |
|  3 | Rohan  | Mehta    |   41 | West       |
|  4 | Sneha  | Patel    |   25 | South      |
|  5 | Karan  | Singh    |   30 | Central    |
|  6 | Neha   | Jain     |   29 | North-East |
|  7 | Arjun  | Reddy    |   38 | South-West |
|  8 | Divya  | Kapoor   |   33 | North-West |
|  9 | Vikram | Joshi    |   45 | East       |
| 10 | Meera  | Nair     |   27 | South-East |
| 11 | Tanvi  | Chopra   |   26 | North      |
| 12 | Aman   | Gill     |   32 | West       |
| 13 | Ritika | Malhotra |   24 | South-East |
| 14 | Harsh  | Thakur   |   37 | Central    |
| 15 | Simran | Kaur     |   31 | North-East |
| 16 | Rajeev | Bansal   |   40 | South-West |
| 17 | Isha   | Arora    |   28 | East       |
| 18 | Nikhil | Dey      |   35 | North-West |
| 19 | Tanya  | Mishra   |   30 | South      |
| 20 | Yuvraj | Chandel  |   42 | West       |
+----+--------+----------+------+------------+
20 rows in set (0.001 sec)
```

**SUM()**

```
MariaDB [ayushdb]> select sum(age) from emp;
+----------+
| sum(age) |
+----------+
|      655 |
+----------+
1 row in set (0.001 sec)

MariaDB [ayushdb]> select sum(age) as result from emp;
+--------+
| result |
+--------+
|    655 |
+--------+
1 row in set (0.001 sec)
```

**AVG()**
```
MariaDB [ayushdb]> select avg(age) from emp;
+----------+
| avg(age) |
+----------+
|  32.7500 |
+----------+
1 row in set (0.002 sec)
```

**count()**
```
MariaDB [ayushdb]> select * from emp;
+----+--------+----------+------+------------+
| ID | FN     | LN       | AGE  | ZONE       |
+----+--------+----------+------+------------+
|  1 | Ayush  | Sharma   |   28 | North      |
|  2 | Priya  | Verma    |   34 | East       |
|  3 | Rohan  | Mehta    |   41 | West       |
|  4 | Sneha  | Patel    |   25 | South      |
|  5 | Karan  | Singh    |   30 | Central    |
|  6 | Neha   | Jain     |   29 | North-East |
|  7 | Arjun  | Reddy    |   38 | South-West |
|  8 | Divya  | Kapoor   |   33 | North-West |
|  9 | Vikram | Joshi    |   45 | East       |
| 10 | Meera  | Nair     |   27 | South-East |
| 11 | Tanvi  | Chopra   |   26 | North      |
| 12 | Aman   | Gill     |   32 | West       |
| 13 | Ritika | Malhotra |   24 | South-East |
| 14 | Harsh  | Thakur   |   37 | Central    |
| 15 | Simran | Kaur     |   31 | North-East |
| 16 | Rajeev | Bansal   |   40 | South-West |
| 17 | Isha   | Arora    |   28 | East       |
| 18 | Nikhil | Dey      |   35 | North-West |
| 19 | Tanya  | Mishra   |   30 | South      |
| 20 | Yuvraj | Chandel  |   42 | West       |
+----+--------+----------+------+------------+
20 rows in set (0.076 sec)

MariaDB [ayushdb]> select count(age) from emp where age=30;
+------------+
| count(age) |
+------------+
|          2 |
+------------+
1 row in set (0.001 sec)

MariaDB [ayushdb]> select count(*) from emp;
+----------+
| count(*) |
+----------+
|       20 |
+----------+
1 row in set (0.001 sec)

MariaDB [ayushdb]> select count(age) from emp;
+------------+
| count(age) |
+------------+
|         20 |
+------------+
1 row in set (0.001 sec)
```
**MAX()**
```
MariaDB [ayushdb]> select max(age) from emp;
+----------+
| max(age) |
+----------+
|       45 |
+----------+
1 row in set (0.001 sec)
```
**min()**
```
MariaDB [ayushdb]> select min(age) from emp;
+----------+
| min(age) |
+----------+
|       24 |
+----------+
1 row in set (0.001 sec)
```

### **UPDATE**

**Single Record**
```
MariaDB [ayushdb]> update emp
    -> set age=18 where id=14;
Query OK, 1 row affected (0.006 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [ayushdb]> select * from emp;
+----+--------+----------+------+------------+
| ID | FN     | LN       | AGE  | ZONE       |
+----+--------+----------+------+------------+
|  1 | Ayush  | Sharma   |   28 | North      |
|  2 | Priya  | Verma    |   34 | East       |
|  3 | Rohan  | Mehta    |   41 | West       |
|  4 | Sneha  | Patel    |   25 | South      |
|  5 | Karan  | Singh    |   30 | Central    |
|  6 | Neha   | Jain     |   29 | North-East |
|  7 | Arjun  | Reddy    |   38 | South-West |
|  8 | Divya  | Kapoor   |   33 | North-West |
|  9 | Vikram | Joshi    |   45 | East       |
| 10 | Meera  | Nair     |   27 | South-East |
| 11 | Tanvi  | Chopra   |   26 | North      |
| 12 | Aman   | Gill     |   32 | West       |
| 13 | Ritika | Malhotra |   24 | South-East |
| 14 | Harsh  | Thakur   |   18 | Central    |
| 15 | Simran | Kaur     |   31 | North-East |
| 16 | Rajeev | Bansal   |   40 | South-West |
| 17 | Isha   | Arora    |   28 | East       |
| 18 | Nikhil | Dey      |   35 | North-West |
| 19 | Tanya  | Mishra   |   30 | South      |
| 20 | Yuvraj | Chandel  |   42 | West       |
+----+--------+----------+------+------------+
20 rows in set (0.001 sec)

MariaDB [ayushdb]> update emp
    -> set age=26
    -> where fn="arjun";
No connection. Trying to reconnect...
Connection id:    8
Current database: ayushdb

Query OK, 1 row affected (0.037 sec)
Rows matched: 1  Changed: 1  Warnings: 0
```

### **Delete statement**

```
MariaDB [ayushdb]> select * from emp;
+----+--------+----------+------+------------+
| ID | FN     | LN       | AGE  | ZONE       |
+----+--------+----------+------+------------+
|  1 | Ayush  | Sharma   |   28 | North      |
|  2 | Priya  | Verma    |   34 | East       |
|  3 | Rohan  | Mehta    |   41 | West       |
|  4 | Sneha  | Patel    |   25 | South      |
|  5 | Karan  | Singh    |   30 | Central    |
|  6 | Neha   | Jain     |   29 | North-East |
|  7 | Arjun  | Reddy    |   26 | South-West |
|  8 | Divya  | Kapoor   |   33 | North-West |
|  9 | Vikram | Joshi    |   45 | East       |
| 10 | Meera  | Nair     |   27 | South-East |
| 11 | Tanvi  | Chopra   |   26 | North      |
| 12 | Aman   | Gill     |   32 | West       |
| 13 | Ritika | Malhotra |   24 | South-East |
| 14 | Harsh  | Thakur   |   18 | Central    |
| 15 | Simran | Kaur     |   31 | North-East |
| 16 | Rajeev | Bansal   |   40 | South-West |
| 17 | Isha   | Arora    |   28 | East       |
| 18 | Nikhil | Dey      |   35 | North-West |
| 19 | Tanya  | Mishra   |   30 | South      |
| 20 | Yuvraj | Chandel  |   42 | West       |
+----+--------+----------+------+------------+
20 rows in set (0.001 sec)

MariaDB [ayushdb]> delete from emp
    -> where fn='arjun';
Query OK, 1 row affected (0.034 sec)

MariaDB [ayushdb]> select * from emp;
+----+--------+----------+------+------------+
| ID | FN     | LN       | AGE  | ZONE       |
+----+--------+----------+------+------------+
|  1 | Ayush  | Sharma   |   28 | North      |
|  2 | Priya  | Verma    |   34 | East       |
|  3 | Rohan  | Mehta    |   41 | West       |
|  4 | Sneha  | Patel    |   25 | South      |
|  5 | Karan  | Singh    |   30 | Central    |
|  6 | Neha   | Jain     |   29 | North-East |
|  8 | Divya  | Kapoor   |   33 | North-West |
|  9 | Vikram | Joshi    |   45 | East       |
| 10 | Meera  | Nair     |   27 | South-East |
| 11 | Tanvi  | Chopra   |   26 | North      |
| 12 | Aman   | Gill     |   32 | West       |
| 13 | Ritika | Malhotra |   24 | South-East |
| 14 | Harsh  | Thakur   |   18 | Central    |
| 15 | Simran | Kaur     |   31 | North-East |
| 16 | Rajeev | Bansal   |   40 | South-West |
| 17 | Isha   | Arora    |   28 | East       |
| 18 | Nikhil | Dey      |   35 | North-West |
| 19 | Tanya  | Mishra   |   30 | South      |
| 20 | Yuvraj | Chandel  |   42 | West       |
+----+--------+----------+------+------------+
19 rows in set (0.001 sec)

```