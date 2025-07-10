CREATE DATABASE event_calendar_data_vault;

USE event_calendar_data_vault;

-- Hub Tables
CREATE TABLE Hub_Room (
    Hash_Room_ID STRING,
    Room_ID INT,
    Load_DTS TIMESTAMP,
    Record_Source STRING
) COMMENT 'Hub for room business keys';

CREATE TABLE Hub_Event (
    Hash_Event_ID STRING,
    Event_ID INT,
    Load_DTS TIMESTAMP,
    Record_Source STRING
) COMMENT 'Hub for event business keys';

CREATE TABLE Hub_Department (
    Hash_Department_ID STRING,
    Department_ID INT,
    Load_DTS TIMESTAMP,
    Record_Source STRING
) COMMENT 'Hub for department business keys';

CREATE TABLE Hub_Attendance_status (
    Hash_Attendance_status_ID STRING,
    Attendance_status_ID INT,
    Load_DTS TIMESTAMP,
    Record_Source STRING
) COMMENT 'Hub for attendance status business keys';

CREATE TABLE Hub_Employee (
    Hash_Employee_ID STRING,
    Employee_ID INT,
    Load_DTS TIMESTAMP,
    Record_Source STRING
) COMMENT 'Hub for employee business keys';

CREATE TABLE Hub_Attendance (
    Hash_Attendance_ID STRING,
    Attendance_ID INT,
    Load_DTS TIMESTAMP,
    Record_Source STRING
) COMMENT 'Hub for attendance business keys';

-- Link Tables
CREATE TABLE Link_Event_Room (
    Hash_Link_ID STRING,
    Hash_Event_ID STRING,
    Hash_Room_ID STRING,
    Load_DTS TIMESTAMP,
    Record_Source STRING
) COMMENT 'Link for event-room relationship';

CREATE TABLE Link_Employee_Department (
    Hash_Link_ID STRING,
    Hash_Employee_ID STRING,
    Hash_Department_ID STRING,
    Load_DTS TIMESTAMP,
    Record_Source STRING
) COMMENT 'Link for employee-department relationship';

CREATE TABLE Link_Attendance (
    Hash_Link_ID STRING,
    Hash_Attendance_ID STRING,
    Hash_Event_ID STRING,
    Hash_Attendance_status_ID STRING,
    Hash_Employee_ID STRING,
    Load_DTS TIMESTAMP,
    Record_Source STRING
) COMMENT 'Link for attendance relationships';

-- Satellite Tables
CREATE TABLE Sat_Room (
    Hash_Room_ID STRING,
    Load_DTS TIMESTAMP,
    Record_Source STRING,
    Room_number STRING,
    Room_capacity INT
) COMMENT 'Satellite for room attributes';

CREATE TABLE Sat_Event (
    Hash_Event_ID STRING,
    Load_DTS TIMESTAMP,
    Record_Source STRING,
    Event_name STRING,
    Event_start TIMESTAMP,
    Event_end TIMESTAMP
) COMMENT 'Satellite for event attributes';

CREATE TABLE Sat_Department (
    Hash_Department_ID STRING,
    Load_DTS TIMESTAMP,
    Record_Source STRING,
    Department_name STRING
) COMMENT 'Satellite for department attributes';

CREATE TABLE Sat_Attendance_status (
    Hash_Attendance_status_ID STRING,
    Load_DTS TIMESTAMP,
    Record_Source STRING,
    Attendance_status_name STRING
) COMMENT 'Satellite for attendance status attributes';

CREATE TABLE Sat_Employee (
    Hash_Employee_ID STRING,
    Load_DTS TIMESTAMP,
    Record_Source STRING,
    Employee_surname STRING,
    Employee_name STRING,
    Employee_patronym STRING
) COMMENT 'Satellite for employee attributes';

CREATE TABLE Sat_Employee_Department (
    Hash_Link_ID STRING,
    Load_DTS TIMESTAMP,
    Record_Source STRING,
    Position STRING
) COMMENT 'Satellite for employee-department attributes';

CREATE TABLE Sat_Attendance (
    Hash_Attendance_ID STRING,
    Load_DTS TIMESTAMP,
    Record_Source STRING,
    Visited BOOLEAN
) COMMENT 'Satellite for attendance attributes';