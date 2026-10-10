# 🔐 Cybersecurity Incident Analytics using MySQL

## 📌 Project Overview

Cybersecurity incidents can affect an organization's systems, employees, and data. This project uses **MySQL** to organize and analyze simulated cybersecurity incident data and explore patterns in incident severity, attack types, affected systems, and security response performance.

The goal is to demonstrate relational database design and SQL-based analysis for security-related decision-making.

## 🎯 Project Objectives

- Analyze incidents by severity and status.
- Identify common cybersecurity attack types.
- Examine incidents associated with employees and systems.
- Analyze security team response times.
- Classify incidents into risk levels using SQL `CASE` statements.
- Track incident resolution and security actions.

## 🗄️ Database Design

The project contains six related tables:

| Table | Description |
|---|---|
| `EMPLOYEE` | Employee details, departments, roles, and locations |
| `ATTACK_TYPES` | Attack names, categories, and descriptions |
| `SYSTEMS` | Systems affected by incidents and their criticality |
| `INCIDENTS` | Incident dates, severity, status, and related records |
| `INCIDENT_RESPONSE` | Detection methods, response times, and resolution dates |
| `SECURITY_ACTIONS` | Actions taken and their completion status |

Primary keys and foreign keys connect the tables and support relational analysis.

## 🛠️ Tools & Technologies

- **Database:** MySQL
- **Query Language:** SQL
- **Environment:** MySQL Workbench
- **Version Control:** GitHub

## 💻 SQL Concepts Practiced

- Database and table creation
- Primary key and foreign key constraints
- `SELECT`, `WHERE`, `ORDER BY`
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`
- `GROUP BY` and `HAVING`
- `INNER JOIN` across multiple tables
- Subqueries
- Conditional logic using `CASE`
- Date-based analysis
- Incident response performance analysis

## 📊 Key Analysis Areas

### 1. Incident Severity Analysis
Explore the distribution of incidents across Low, Medium, High, and Critical severity levels.

### 2. Attack Type Analysis
Identify which attack types occur most frequently in the sample dataset.

### 3. Employee and Department Analysis
Connect employee information with incident records to examine incidents across departments.

### 4. System Impact Analysis
Analyze incidents involving different systems and their criticality levels.

### 5. Security Response Analysis
Compare response times across security teams and examine incidents that have not yet been resolved.

### 6. Risk Classification
Use SQL `CASE` statements to classify incidents into risk categories based on their severity.

## 📁 Repository Contents

- `cybersecurity_incident_analytics.sql` — SQL script containing the database schema, sample data, and analysis queries.
- `README.md` — Project documentation.

## 🚀 How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Download or clone this repository.
3. Open the `.sql` script in MySQL Workbench.
4. Review the database and table definitions.
5. Execute the script in order to create the tables, insert sample data, and run the analysis queries.

**Note:** If the database already exists, review the creation statements before running the script again.

## 📚 Learning Outcomes

Through this project, I practiced relational database design, SQL joins, aggregation, subqueries, conditional logic, and analysis of security incident response data.

## 📌 Dataset Note

This project uses sample data created for educational and SQL practice purposes. It does not represent real organizational security incidents.

## 👨‍💻 Author

**Lokesh Girase**

Aspiring Data Analyst | SQL | MySQL | Data Analytics

---

⭐ If you find this project useful, feel free to explore the repository and share feedback.
