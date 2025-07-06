create database event_calendar;

use event_calendar;

create table Room
(
    Room_ID int,
    Room_number varchar(10),
    Room_capacity int
)
comment 'Room details'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

create table Event 
(
	Event_ID int,
	Event_name varchar(255),
	Event_start datetime,
	Event_end datetime,
	constraint chack_datetime check (Event_start <= Event_end)
)
comment 'Event details'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

create table Event_room
(
	Event_ID int not null,
	Room_ID int not null
)
comment 'Event-room relation table'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

create table Department
(
	Department_ID int,
	Department_name varchar(255)
)
comment 'Department details'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

create table Attendance_status
(
	Attendance_status_ID int,
	Attendance_status_name varchar(20)
)
comment 'Attendance status variants'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

create table Employee
(
	Employee_ID int primary key auto_increment,
	Employee_surname varchar(50),
	Employee_name varchar(50) not null,
	Employee_patronym varchar(50)
)
comment 'Employee details'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

create table Attendance
(
	Attendance_ID int,
	Event_ID int,
	Attendance_status_ID int,
	Employer_ID int,
	Vitited bool
)
comment 'Attendance details'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

create table Employee_department
(
	Employee_ID int,
	Department_ID int not null,
	Position varchar(50),
)
comment 'Employee-department relation table'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

