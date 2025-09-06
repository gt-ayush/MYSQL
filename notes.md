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







