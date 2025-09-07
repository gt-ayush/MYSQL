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






