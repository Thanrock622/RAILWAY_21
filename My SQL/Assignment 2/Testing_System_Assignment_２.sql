DROP DATABASE IF EXISTS 	testing_system_assignment_2;
CREATE DATABASE 			testing_system_assignment_2;
USE 						testing_system_assignment_2;
-- create table: Department --phong ban
DROP TABLE IF EXISTS 		Department;
CREATE TABLE 				Department(
DepartmentID 				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName 				NVARCHAR(50) NOT NULL UNIQUE KEY
);
-- create table 2: Position -- chuc vu
DROP TABLE IF EXISTS 		`Position`;
CREATE TABLE 				`Position` (
PositionID 					SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
PositionName 				ENUM('DEV','TEST','SCRUM_MASTER','PM') NOT NULL UNIQUE KEY
);
-- create table 3: 			`Account` -- tai khoan
DROP TABLE IF EXISTS 		`Account`;
CREATE TABLE 				`Account`(
AccountID 					SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Email 						NVARCHAR(50) NOT NULL UNIQUE KEY,
Username 					NVARCHAR(50) NOT NULL UNIQUE KEY,
FullName					NVARCHAR(50) NOT NULL,
DepartmentID 				SMALLINT UNSIGNED NOT NULL,
PositionID 					SMALLINT UNSIGNED NOT NULL,
CreateDate 					DATETIME DEFAULT NOW(),
FOREIGN KEY(DepartmentID)	REFERENCES Department(DepartmentID),
FOREIGN KEY(PositionID)		REFERENCES `Position`(PositionID)

-- create table 4: 		Group -- nhom
);
DROP TABLE IF EXISTS 		`Group`;
CREATE TABLE 				`Group`(
GroupID 					SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
GroupName 					NVARCHAR(50) NOT NULL UNIQUE KEY,
CreatorID 					SMALLINT UNSIGNED,
CreateDate 					DATETIME DEFAULT NOW(),
FOREIGN KEY(CreatorID)		REFERENCES `Account`(AccountId)
);
-- create table 5 : GroupAccount nhom tai khoan
DROP TABLE IF EXISTS 		GroupAccount;
CREATE TABLE 				GroupAccount(
GroupID						SMALLINT UNSIGNED NOT NULL,
AccountID 					SMALLINT UNSIGNED NOT NULL,
JoinDate 					DATETIME DEFAULT NOW(),
PRIMARY KEY (GroupID,AccountID),
FOREIGN KEY(GroupID) 		REFERENCES `Group`(GroupID)
);
-- create table 6: TypeQuestion-- kieu cau hoi
DROP TABLE IF EXISTS 		TypeQuestion;
CREATE TABLE 				TypeQuestion (
TypeID 						SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
TypeName 					ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);
-- create table 7: CategoryQuestion -- loai cau hoi
DROP TABLE IF EXISTS 		CategoryQuestion;
CREATE TABLE 				CategoryQuestion(
CategoryID 					SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CategoryName 				NVARCHAR(50) NOT NULL UNIQUE KEY
);
-- create table 8: Question -- cau hoi
DROP TABLE IF EXISTS 		Question;
CREATE TABLE 				Question(
QuestionID 					SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content 					NVARCHAR(50) NOT NULL,
CategoryID 					SMALLINT UNSIGNED NOT NULL,
TypeID 						SMALLINT UNSIGNED NOT NULL,
CreatorID 					SMALLINT UNSIGNED NOT NULL,
CreateDate 					DATETIME DEFAULT NOW(),
FOREIGN KEY(CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(TypeID) 		REFERENCES TypeQuestion(TypeID),
FOREIGN KEY(CreatorID) 		REFERENCES `Account`(AccountId)
);
-- create table 9: Answer -- dap an
DROP TABLE IF EXISTS 		Answer;
CREATE TABLE 				Answer(
AnswerID 					SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content						NVARCHAR(50) NOT NULL,
QuestionID 					SMALLINT UNSIGNED,
isCorrect 					BIT,
FOREIGN KEY(QuestionID) 	REFERENCES Question(QuestionID)
);
-- create table 10: Exam -- thi
DROP TABLE IF EXISTS 		Exam;
CREATE TABLE 				Exam(
ExamID 						SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`Code` 						NVARCHAR(50) NOT NULL,
Title 						NVARCHAR(50) NOT NULL,
CategoryID 					SMALLINT UNSIGNED NOT NULL,
Duration 					SMALLINT UNSIGNED NOT NULL,
CreatorID 					SMALLINT UNSIGNED NOT NULL,
CreateDate 					DATETIME DEFAULT NOW(),
FOREIGN KEY(CategoryID)		REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(CreatorID) 		REFERENCES `Account`(AccountId)
);
-- create table 11: ExamQuestion -- cau hoi tra loi
DROP TABLE IF EXISTS 		ExamQuestion;
CREATE TABLE 				ExamQuestion(
ExamID 						SMALLINT UNSIGNED NOT NULL,
QuestionID 					SMALLINT UNSIGNED NOT NULL,
PRIMARY KEY 				(ExamID,QuestionID),
FOREIGN KEY(QuestionID) 	REFERENCES Question(QuestionID),
FOREIGN KEY(ExamID) 		REFERENCES Exam(ExamID)
);