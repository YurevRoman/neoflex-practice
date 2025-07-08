CREATE DATABASE event_calendar_star;

USE event_calendar_star;

CREATE TABLE Room (
    Room_ID INT,
    Room_number STRING,
    Room_capacity INT
)
comment 'Dimension table for room details'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE Event (
    Event_ID INT,
    Event_name STRING,
    Event_start TIMESTAMP,
    Event_end TIMESTAMP
)
comment 'Dimension table for event details'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE Attendance_status (
    Attendance_status_ID INT,
    Attendance_status_name STRING
)
comment 'Dimension table for attendance status variants'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE Employee (
    Employee_ID INT,
    Employee_surname STRING,
    Employee_name STRING,
    Employee_patronym STRING,
    Department_name STRING,
    Position STRING
)
comment 'Dimension table for employee details with denormalized department'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE Attendance (
    Event_ID INT,
    Room_ID INT,
    Attendance_status_ID INT,
    Employee_ID INT,
    Visited BOOLEAN
)
comment 'Fact table for attendance details'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;