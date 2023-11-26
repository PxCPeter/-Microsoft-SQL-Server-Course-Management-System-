CREATE DATABASE CMS_FPT
USE CMS_FPT
create table CourseCategories
(
	CourseCategoriesID varchar(50) primary key,
	[Name] varchar(50),
	Descibe varchar(500)
)
create table Major
(
	MajorID varchar(50) primary key,
	[Name] varchar(50),
	Descibe varchar(500),
	CourseCategoriesID varchar(50) foreign key references CourseCategories(CourseCategoriesID)
)

create table Courses
(
	CourseID varchar(10) primary key,
	[Name] varchar(50)not null,
	[Subject] varchar(100)not null,
	MajorID varchar(50) foreign key references Major(MajorID)
)

create table Campus
(
	CampusID int primary key,
	[Name] varchar(50)not null,
	Descibe varchar(500)not null
)
create table Students
(
	StudentID varchar(10) ,
	StudentEmail varchar(50) unique ,
	FirstName varchar(50)not null,
	LastName varchar(10)not null,
	K int not null,
	DOB date not null,
	Gender varchar(10) check(Gender ='Male' or Gender ='Female')
	primary key (StudentID)
)


create table Teachers
(
	TeacherID varchar(10),
	TeacherEmail varchar(50) unique,
	FirstName varchar(50) not null,
	LastName varchar(10)not null,
	DOB date not null,
	Gender varchar(10) check(Gender ='Male' or Gender ='Female')
	primary key (TeacherID)
)


Create table Account
(
	AccountID varchar(10) ,
	Email varchar(50),
	primary key (AccountID,Email),
	CampusID int foreign key references Campus(CampusID),
	foreign key(Email) references Students(StudentEmail),
	foreign key(Email) references Teachers(TeacherEmail)
)


create table Students_Courses
(
	StudentID varchar(10) foreign key references Students(StudentID),
	CourseID varchar(10) foreign key references Courses(CourseID),
	Semester varchar(10)not null,
	Result float not null,
	primary key(StudentID,CourseID)
)

create table Teachers_Courses
(
	TeacherID varchar(10) foreign key references Teachers(TeacherID),
	CourseID varchar(10) foreign key references Courses(CourseID),
	Semester varchar(10) not null,
	Documents varchar(50)not null,
	primary key(TeacherID,CourseID)
)

INSERT INTO Campus
values (1,'Ha Noi','This is the campus with the largest concentration of students from the north and north central part of Vietnam'),
(2,'Da Nang','This is a campus with many students from central Vietnam'),
(3,'Ho Chi Minh','This is the campus with many students from the south of Vietnam'),
(4,'Quy Nhon','This is the campus with a lot of students majoring in AI')

INSERT INTO CourseCategories
values ('FM','Fundamental','including foundation subjects such as math, foreign languages, physical education'),
('IT','Information Technology','includes subjects related to the information technology industry and its narrow specializations'),
('BA','Business Administration','includes subjects related to economics and its narrow specialization')

INSERT INTO Major
values('SE','Software Engineering','Training Information Technology (IT)/Software Engineering (SE) specialty engineers with personality and capacity to meet the needs of society, mastering professional knowledge and practice','IT'),
('AI','Artificial Intelligence','Training Information Technology (IT)/Artificial Intelligence (AI) specialty engineers with qualities and capacities to meet the needs of society, mastering professional knowledge and practice','IT'),
('VOV','Vovinam','Training Vovinam as a physical education','FM'),
('TRS','English Prepare','Training enghlish for students before join their major','FM'),
('FAE','Finance, Accounting, Economics and Banking','Training about Finance, Accounting, Economics and Banking for students','BA')

INSERT INTO Courses
values('CSD201','Data Structures and Algorithms with Java','Data Structures and Algorithms','SE'),
('CSD203','Data Structures and Algorithms with Python','Data Structures and Algorithms','AI'),
('TRS601','English 6','English','TRS'),
('VOV101','Vovinam 1','Vovinam','VOV'),
('MAS','Applied Statistics for Business','Math','FAE'),
('MAD','Discrete Mathematics','Math','SE')

INSERT INTO Students
values ('ST01','thienst01@fpt.edu.vn','Pham','Thien',15,'2001/01/04','Male'),
('ST02','hoangst02@fpt.edu.vn','Nguyen','Hoang',16,'2002/10/14','Female'),
('ST03','minhst03@fpt.edu.vn','Do','Minh',15,'2001/11/20','Female'),
('ST04','trist04@fpt.edu.vn','Nguyen','Tri',17,'2003/02/15','Male'),
('ST05','dest05@fpt.edu.vn','Tran','De',17,'2003/05/23','Male'),
('ST06','nhatst06@fpt.edu.vn','Ha','Nhat',16,'2002/08/02','Male'),
('ST07','thienst07@fpt.edu.vn','Pham','Thien',16,'2002/01/17','Male'),
('ST08','hast08@fpt.edu.vn','Nguyen','Ha',16,'2002/04/04','Female')

INSERT INTO Teachers
values ('TC01','hoitc01@fpt.edu.vn','Pham','Hoi','1985/11/04','Male'),
('TC02','nhatc02@fpt.edu.vn','Ha','Nhat','1980/02/14','Male'),
('TC03','giaotc03@fpt.edu.vn','Nguyen','Giao','1975/10/20','Female')

INSERT INTO Account
values('ThienST01','thienst01@fpt.edu.vn',1),
('HoangST02','hoangst02@fpt.edu.vn',3),
('MinhST03','minhst03@fpt.edu.vn',3),
('TriST04','trist04@fpt.edu.vn',2),
('DeST05','dest05@fpt.edu.vn',1),
('NhatST06','nhatst06@fpt.edu.vn',1),
('ThienST07','thienst07@fpt.edu.vn',2),
('HaST08','hast08@fpt.edu.vn',1),
('HoiTC01','hoitc01@fpt.edu.vn',3),
('NhaTC02','nhatc02@fpt.edu.vn',2),
('GiaoTC03','giaotc03@fpt.edu.vn',1)

INSERT INTO Students_Courses
values ('ST01','CSD203','FA22',7.1),
('ST02','CSD203','FA22',4.5),
('ST03','CSD201','SU22',9.0),
('ST04','TRS601','FA22',3.0),
('ST05','TRS601','FA22',7.0),
('ST06','TRS601','FA22',4.5),
('ST01','VOV101','SP22',8.0),
('ST02','VOV101','FA22',7.5),
('ST03','VOV101','SP22',4.0),
('ST04','VOV101','SP22',7.0),
('ST04','MAS','SU22',7.5),
('ST07','MAS','SU22',8.8),
('ST08','MAD','FA22',7.0)

INSERT INTO Teachers_Courses
values ('TC01','CSD201','FA22','Data Structures and Algorithms with java'),
('TC01','CSD203','SU22','Data Structures and Algorithms with Python'),
('TC01','MAD','FA22','Discrete Mathematics'),
('TC02','TRS601','FA22','English lv6'),
('TC02','MAS','SU22','Applied Statistics for Business'),
('TC01','VOV101','FA22','Vovinam'),
('TC03','VOV101','SP22','Vovinam')


