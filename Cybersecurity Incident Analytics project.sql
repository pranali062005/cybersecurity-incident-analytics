CREATE DATABASE Cybersecurity_Incident_Analytics;

USE Cybersecurity_Incident_Analytics;

CREATE TABLE EMPLOYEE(
EMPLOYEE_ID INT PRIMARY KEY,
EMPLOYEE_NAME VARCHAR(20),
DEPARTMENT VARCHAR(50),
JOB_ROLE VARCHAR(20),
LOCATION VARCHAR(20));

CREATE TABLE ATTACK_TYPES (
ATTACK_TYPE_ID INT PRIMARY KEY,
ATTACK_NAME VARCHAR(50),
ATTACK_CATEGORY VARCHAR(50),
DESCRIPTION VARCHAR(200)
);

CREATE TABLE SYSTEMS (
SYSTEM_ID INT PRIMARY KEY,
SYSTEM_NAME VARCHAR(50),
SYSTEM_TYPE VARCHAR(50),
CRITICALITY VARCHAR(20)
);

CREATE TABLE INCIDENTS(
INCIDENT_ID INT PRIMARY KEY,
EMPLOYEE_ID INT ,
ATTACK_TYPE_ID INT,
SYSTEM_ID INT,
INCIDENT_DATE DATE,
SEVERITY VARCHAR(20),
STATUS VARCHAR(30),
FINANCIAL_LOSS DECIMAL(12,2),

FOREIGN KEY (EMPLOYEE_ID)
REFERENCES EMPLOYEE(EMPLOYEE_ID),

FOREIGN KEY (ATTACK_TYPE_ID)
REFERENCES ATTACK_TYPES(ATTACK_TYPE_ID),

FOREIGN KEY (SYSTEM_ID)
REFERENCES SYSTEMS(SYSTEM_ID)
);

CREATE TABLE INCIDENT_RESPONSE (
    RESPONSE_ID INT PRIMARY KEY,
    INCIDENT_ID INT,
    SECURITY_TEAM VARCHAR(100),
    DETECTION_METHOD VARCHAR(100),
    RESPONSE_DATE DATE,
    RESOLUTION_DATE DATE,
    RESPONSE_TIME_HOURS DECIMAL(8,2),

    FOREIGN KEY (INCIDENT_ID)
    REFERENCES INCIDENTS(INCIDENT_ID)
);

CREATE TABLE SECURITY_ACTIONS(
ACTION_ID INT PRIMARY KEY,
INCIDENT_ID INT,
ACTION_TAKEN VARCHAR(100),
ACTION_STATUS VARCHAR(40),

FOREIGN KEY (INCIDENT_ID)
REFERENCES INCIDENTS(INCIDENT_ID)
);

INSERT INTO EMPLOYEE VALUES 
(101,"Amit Sharma",'Finance','Accountant','Pune'),
(102, 'Priya Patil','HR','HR Executive','Mumbai'),
(103,'Rahul Joshi','IT','Developer','Nashik'),
(104,'Sneha Kulkarni','Sales','Sales Executive','Pune'),
(105,'Rohit Deshmukh','Finance','Manager','Mumbai'),
(106,'Neha Shah','Marketing','Marketing Executive','Nagpur'),
(107,'Akash More','IT','System Admin','Pune'),
(108,'Pooja Jain','Operations','Operations Executive','Delhi'),
(109,'Karan Mehta','IT','Developer','Mumbai'),
(110,'Riya Desai','HR','HR Manager','Pune');

INSERT INTO ATTACK_TYPES VALUES
(1,'Phishing','Social Engineering','Fraudulent message attempting to obtain information'),
(2,'Malware','Malicious Software','Malicious software detected on a system'),
(3,'Ransomware','Malicious Software','Data encrypted by malicious software'),
(4,'Brute Force','Authentication Attack','Repeated attempts to guess credentials'),
(5,'DDoS','Network Attack','Large volume of traffic targeting a service'),
(6,'Unauthorized Access','Access Violation','Access without proper authorization'),
(7,'Data Leakage','Data Security','Sensitive information exposed'),
(8,'Insider Threat','Internal Threat','Security incident involving an internal user');

INSERT INTO SYSTEMS VALUES 
(201,'Email Server','Communication','High'),
(202,'HR Portal','Web Application','Medium'),
(203,'Finance Database','Database','Critical'),
(204,'Customer Portal','Web Application','Critical'),
(205,'Employee Laptop','Endpoint','Medium'),
(206,'Cloud Storage','Cloud','High'),
(207,'Payment Server','Server','Critical'),
(208,'Internal Network','Network','High');

INSERT INTO INCIDENTS VALUES
(1001,101,1,201,'2026-01-05','Medium','Resolved',5000),
(1002,102,2,205,'2026-01-12','High','Resolved',15000),
(1003,103,4,204,'2026-01-18','High','Investigating',8000),
(1004,104,1,201,'2026-02-03','Low','Resolved',2000),
(1005,105,3,203,'2026-02-10','Critical','Resolved',75000),
(1006,106,7,206,'2026-02-21','High','Investigating',25000),
(1007,107,6,208,'2026-03-02','Critical','Resolved',30000),
(1008,108,5,204,'2026-03-15','High','Resolved',12000),
(1009,101,2,205,'2026-03-22','Medium','Resolved',7000),
(1010,103,4,207,'2026-04-01','High','Investigating',18000),
(1011,104,1,201,'2026-04-10','Medium','Resolved',4000),
(1012,105,8,203,'2026-04-15','Critical','Under Review',45000);

INSERT INTO INCIDENT_RESPONSE VALUES
(1,1001,'SOC Team','Email Monitoring','2026-01-05','2026-01-06',5.5),
(2,1002,'Security Team','Antivirus','2026-01-12','2026-01-14',12.0),
(3,1003,'SOC Team','Login Monitoring','2026-01-18',NULL,8.5),
(4,1004,'SOC Team','Email Monitoring','2026-02-03','2026-02-03',2.0),
(5,1005,'Security Team','Threat Detection','2026-02-10','2026-02-13',24.5),
(6,1006,'Data Security Team','DLP System','2026-02-21',NULL,15.0),
(7,1007,'Network Security','Access Monitoring','2026-03-02','2026-03-04',18.0),
(8,1008,'Network Security','Traffic Monitoring','2026-03-15','2026-03-16',10.0),
(9,1009,'Security Team','Antivirus','2026-03-22','2026-03-23',6.0),
(10,1010,'SOC Team','Login Monitoring','2026-04-01',NULL,11.5),
(11,1011,'SOC Team','Email Monitoring','2026-04-10','2026-04-10',3.0),
(12,1012,'Security Team','Employee Report','2026-04-15',NULL,20.0);

INSERT INTO SECURITY_ACTIONS VALUES 
(1,1001,'Blocked suspicious email','Completed'),
(2,1002,'Isolated infected laptop','Completed'),
(3,1003,'Blocked suspicious login attempts','Completed'),
(4,1004,'Blocked malicious sender','Completed'),
(5,1005,'Restored encrypted database','Completed'),
(6,1006,'Restricted cloud access','In Progress'),
(7,1007,'Disabled unauthorized account','Completed'),
(8,1008,'Blocked suspicious traffic','Completed'),
(9,1009,'Removed malware','Completed'),
(10,1010,'Blocked suspicious account','In Progress'),
(11,1011,'Blocked phishing domain','Completed'),
(12,1012,'Restricted employee access','In Progress');

SELECT * FROM EMPLOYEE;
SELECT * FROM ATTACK_TYPES;
SELECT * FROM SYSTEMS;
SELECT * FROM INCIDENTS;
SELECT * FROM INCIDENT_RESPONSE;
SELECT * FROM SECURITY_ACTIONS;

SHOW TABLES;
-- 1. Display all records from INCIDENTS.
   SELECT * FROM INCIDENTS;

-- Display only the incidents where the severity is Critical.
   SELECT * FROM INCIDENTS
   WHERE SEVERITY = 'CRITICAL';
   
-- Display only INCIDENT_ID, SEVERITY, and STATUS
  SELECT INCIDENT_ID, SEVERITY, STATUS 
  FROM INCIDENTS;
  
-- Display incidents where FINANCIAL_LOSS > 20000.
   SELECT * FROM INCIDENTS
   WHERE FINANCIAL_LOSS > 20000;
   
-- Display incidents reported by employee 101.
   SELECT * FROM INCIDENTS
   WHERE EMPLOYEE_ID  = 101;
   
  -- Display incidents with STATUS = 'Investigating'.
  SELECT * FROM INCIDENTS
  WHERE STATUS = 'Investigating';
  
  -- Display all incidents ordered by FINANCIAL_LOSS from highest to lowest.
  SELECT * FROM INCIDENTS
  ORDER BY FINANCIAL_LOSS ASC; 
  
  -- Display the incident with the highest financial loss.
SELECT * FROM INCIDENTS
WHERE FINANCIAL_LOSS = ( SELECT MAX(FINANCIAL_LOSS) FROM INCIDENTS);
SELECT * FROM INCIDENTS
WHERE FINANCIAL_LOSS = (SELECT MIN(FINANCIAL_LOSS) FROM INCIDENTS);

  -- Find the total number of incidents.
  SELECT COUNT(FINANCIAL_LOSS) FROM INCIDENTS;
  
--  Count the number of incidents for each SEVERITY.
    SELECT COUNT(SEVERITY)FROM INCIDENTS;
    
--  Count the number of incidents for each STATUS.
    SELECT COUNT(STATUS) FROM INCIDENTS
    GROUP BY SEVERITY;
    
-- Find the total financial loss for each SEVERITY.
    SELECT SEVERITY, SUM(FINANCIAL_LOSS ) AS FINANCELOSS FROM INCIDENTS
    GROUP BY SEVERITY;
    
-- Find the average financial loss for each SEVERITY.
   SELECT SEVERITY, AVG(FINANCIAL_LOSS) AS AVGLOSS FROM INCIDENTS
   GROUP BY SEVERITY;

-- Count how many incidents occurred for each ATTACK_TYPE_ID.
   SELECT COUNT(ATTACK_TYPE_ID) FROM INCIDENTS;
   
   SELECT ATTACK_TYPE_ID, COUNT(*) AS INCIDENTS_COUNT
   FROM INCIDENTS
   GROUP BY ATTACK_TYPE_ID;
   
-- Find the total financial loss for each ATTACK_TYPE_ID.
   SELECT ATTACK_TYPE_ID , COUNT(*) AS INCIDENTS_COUNT
   FROM INCIDENTS
   GROUP BY ATTACK_TYPE_ID;

--  Find the average RESPONSE_TIME_HOURS for each SECURITY_TEAM.
    SELECT SECURITY_TEAM,
       AVG(RESPONSE_TIME_HOURS) AS AVG_RESPONSE_TIME
FROM INCIDENT_RESPONSE
GROUP BY SECURITY_TEAM;
     
--  Display the number of incidents for each EMPLOYEE_ID.
   SELECT EMPLOYEE_ID FROM EMPLOYEE;
 
--  Find the maximum financial loss for each SEVERITY.
   SELECT SEVERITY, MAX(FINANCIAL_LOSS) FROM INCIDENTS
   GROUP BY SEVERITY;

-- Find the minimum financial loss for each SEVERITY. 
   SELECT SEVERITY, MIN(FINANCIAL_LOSS) AS MINLOSS FROM INCIDENTS
   GROUP BY SEVERITY;
   
-- EMPLOYEE + INCIDENTS
-- Display EMPLOYEE_NAME, DEPARTMENT, INCIDENT_ID, and SEVERITY.
   SELECT E.EMPLOYEE_NAME, E.DEPARTMENT, I.INCIDENT_ID, I.SEVERITY 
   FROM EMPLOYEE AS E
   INNER JOIN INCIDENTS AS I 
   ON E.EMPLOYEE_ID = I.EMPLOYEE_ID;
   
-- ATTACK_TYPES + INCIDENTS
-- Display INCIDENT_ID, ATTACK_NAME, ATTACK_CATEGORY, and SEVERITY. 
   SELECT 
    I.INCIDENT_ID,
    A.ATTACK_NAME,
    A.ATTACK_CATEGORY,
    I.SEVERITY
FROM ATTACK_TYPES AS A
INNER JOIN INCIDENTS AS I
    ON A.ATTACK_TYPE_ID = I.ATTACK_TYPE_ID;

-- JOIN  Practice  
-- EMPLOYEE + INCIDENTS
-- DISPLAY EMPLOYEE_NAME, DEPARTMENT, INCIDENTS_ID AND SEVERITY
SELECT 
    A.EMPLOYEE_NAME,
    A.DEPARTMENT,
    B.INCIDENT_ID,
    B.SEVERITY
FROM EMPLOYEE AS A
INNER JOIN INCIDENTS AS B
ON A.EMPLOYEE_ID = B.EMPLOYEE_ID;

-- ATTACK_TYPES + INCIDENTS
-- Display INCIDENT_ID, ATTACK_NAME, ATTACK_CATEGORY, and SEVERITY.
SELECT 
    I.INCIDENT_ID,
    A.ATTACK_NAME,
    A.ATTACK_CATEGORY,
    I.SEVERITY
FROM ATTACK_TYPES AS A
INNER JOIN INCIDENTS AS I
    ON A.ATTACK_TYPE_ID = I.ATTACK_TYPE_ID;
    
-- EMPLOYEE + INCIDENTS + ATTACK_TYPES
-- Display:

-- Employee name
-- Department
-- Incident ID
-- Attack name
-- Severity

SELECT A.EMPLOYEE_NAME , A.DEPARTMENT, B.INCIDENT_ID , C.ATTACK_NAME, B.SEVERITY
FROM EMPLOYEE AS A
INNER JOIN INCIDENTS AS B
ON A.EMPLOYEE_ID = B.EMPLOYEE_ID 
INNER JOIN ATTACK_TYPES AS C
ON B.ATTACK_TYPE_ID = C.ATTACK_TYPE_ID;


-- RISK SCORE CLASSIFIATION 
SELECT INCIDENT_ID, SEVERITY, STATUS,
CASE 
WHEN SEVERITY = 'Critical' AND FINANCIAL_LOSS >= 5000 THEN 'VERY HIGH RISK'
WHEN SEVERITY IN ('Critical','High') AND FINANCAIL_LOSS >= 2000 THEN 'HIGH RISK'
WHEN SEVERITY = 'Medium' THEN 'Medium Risk'
ELSE 'Low Risk'
END AS RISK_LEVEL
FROM INCIDENTS;

-- Response Performance Analysis
SELECT INCIDENT_ID, SECURITY_TEAM, RESPONSE_TIME_HOURS,
CASE 
WHEN RESPONSE_TIME_HOURS  <= 5 THEN 'FAST'
WHEN RESPONSE_TIME_HOURS <= 15 THEN 'Moderate'
ELSE 'SLOW'
END AS RESPONSE_CATEGORY
FROM INCIDENT_RESPONSE;