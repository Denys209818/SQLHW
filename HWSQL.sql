CREATE DATABASE Academy

use Academy

CREATE TABLE Curators (
Id int NOT NULL IDENTITY PRIMARY KEY,
Name nvarchar(MAX) NOT NULL CHECK (LEN(Name) > 0),
Surname nvarchar(MAX) NOT NULL CHECK (LEN(Surname) > 0)
)

INSERT INTO Curators (Name, Surname) VALUES ('CuratorName1', 'CuratorSurname1')
INSERT INTO Curators (Name, Surname) VALUES ('CuratorName2', 'CuratorSurname2')
INSERT INTO Curators (Name, Surname) VALUES ('CuratorName3', 'CuratorSurname3')


CREATE TABLE Departmens (
Id int NOT NULL IDENTITY PRIMARY KEY,
Financing money NOT NULL CHECK (Financing >= 0) DEFAULT 0,
Name nvarchar(100) NOT NULL CHECK(LEN(Name) > 0) UNIQUE,
FacultyId int NOT NULL  -- Внешний ключ
)

INSERT INTO Departmens (Financing, Name, FacultyId) VALUES (1000, 'Departmens1', 12)
INSERT INTO Departmens (Financing, Name, FacultyId) VALUES (1500, 'Departmens2', 31)
INSERT INTO Departmens (Financing, Name, FacultyId) VALUES (2500, 'Departmens3', 42)



CREATE TABLE Faculties (
Id int IDENTITY NOT NULL PRIMARY KEY,
Financing money NOT NULL CHECK (Financing >= 0) DEFAULT 0,
Name nvarchar(100) NOT NULL CHECK (LEN(Name) > 0) UNIQUE
)

INSERT INTO Faculties (Financing, Name) VALUES (1000, 'Faculties1')
INSERT INTO Faculties (Financing, Name) VALUES (1500, 'Faculties2')
INSERT INTO Faculties (Financing, Name) VALUES (1700, 'Faculties3')


CREATE TABLE Groups (
Id int NOT NULL IDENTITY PRIMARY KEY,
Name nvarchar(10) NOT NULL CHECK (LEN(Name) > 0) UNIQUE,
Year int NOT NULL CHECK(Year >= 1 AND Year <= 5),
DepartmentId int NOT NULL -- Внешний ключ
)

INSERT INTO Groups (Name, Year, DepartmentId) VALUES ('Group1', 3, 43)
INSERT INTO Groups (Name, Year, DepartmentId) VALUES ('Group2', 5, 13)
INSERT INTO Groups (Name, Year, DepartmentId) VALUES ('Group3', 1, 33)



CREATE TABLE GroupsCurators (
Id int NOT NULL IDENTITY PRIMARY KEY,
CuratorId int NOT NULL, -- Внешний ключ
GroupId int NOT NULL -- Внешний ключ
)

INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (12,31)
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (31,11)
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (54, 9)



CREATE TABLE GroupsLectures (
Id int IDENTITY NOT NULL PRIMARY KEY,
GroupId int NOT NULL, -- Внешний ключ
LectureId int NOT NULL -- Внешний ключ
)

INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (12,31)
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (14,51)
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (17,11)



CREATE TABLE Lectures (
Id int IDENTITY NOT NULL PRIMARY KEY,
LectureRoom nvarchar(MAX) NOT NULL CHECK (LEN(LectureRoom) > 0),
SubjectId int NOT NULL, -- Внешний ключ
TeacherId int NOT NULL -- Внешний ключ
)

INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES ('LectureRoom1',31, 12)
INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES ('LectureRoom1',1, 2)
INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES ('LectureRoom1',2, 1)



CREATE TABLE Subjects (
Id int IDENTITY NOT NULL PRIMARY KEY,
Name nvarchar(100) NOT NULL CHECK (LEN(Name) > 0) UNIQUE
)

INSERT INTO Subjects (Name) VALUES ('Name1')
INSERT INTO Subjects (Name) VALUES ('Name2')
INSERT INTO Subjects (Name) VALUES ('Name3')



CREATE TABLE Teachers (
Id int NOT NULL IDENTITY PRIMARY KEY,
Name nvarchar(MAX) NOT NULL CHECK (LEN(Name) > 0),
Salary money NOT NULL CHECK (Salary > 0),
Surname nvarchar(MAX) NOT NULL CHECK(LEN(Surname) > 0)
)

INSERT INTO Teachers (Name, Salary, Surname) VALUES ('Teacher1', 1000, 'TeacherSurname1')
INSERT INTO Teachers (Name, Salary, Surname) VALUES ('Teacher2', 2000, 'TeacherSurname2')
INSERT INTO Teachers (Name, Salary, Surname) VALUES ('Teacher3', 3000, 'TeacherSurname3')
INSERT INTO Teachers (Name, Salary, Surname) VALUES ('Teacher4', 4000, 'TeacherSurname4')
