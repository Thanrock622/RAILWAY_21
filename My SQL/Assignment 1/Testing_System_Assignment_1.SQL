DROP DATABASE IF EXISTS	Testing_System_Assignment_1;
CREATE DATABASE 		Testing_System_Assignment_1;
USE						Testing_System_Assignment_1;
DROP TABLE IF EXISTS	Department;
CREATE TABLE			Department(
DepartmentID 			INT(10),
DepartmentName			VARCHAR(50)
);
DROP TABLE IF EXISTS	Position;
CREATE TABLE			Position (
PositionID				INT(10),
PositionName			VARCHAR(50)
);
DROP TABLE IF EXISTS	`Account`;
CREATE TABLE			`Account` (
AccountID				INT(10),
Email					VARCHAR(50),
Username				VARCHAR(50),
FullName				VARCHAR(50),
DepartmentID			INT(10),
PositionID				INT(10),
CreateDate				DATE
);
DROP TABLE IF EXISTS	`Group`;
CREATE TABLE			`Group`(
GroupID					INT(10),
GroupName				VARCHAR(50),
CreatorID				INT(10),
CreateDate				DATE
);
DROP TABLE IF EXISTS	GroupAccount;
CREATE TABLE			GroupAccount(
GroupID					INT(10),
AccountID				INT(10),
JoinDate				DATE
);
DROP TABLE IF EXISTS	Typequestion;
CREATE TABLE 			Typequestion(
TypeID					INT(10),
TypeName				VARCHAR(50)
);
DROP TABLE IF EXISTS	CategoryQuestion;
CREATE TABLE			CategoryQuestion(
CategoryID				INT(10),
CategoryName			VARCHAR(50)
);
DROP TABLE IF EXISTS	Question;
CREATE TABLE			Question(
QuestionID				INT(10),
Content					VARCHAR(50),
CategoryID				INT(10),
TypeID					INT(10),
CreatorID				INT(10),
CreateDate				DATE
);
DROP TABLE IF EXISTS	Answer;
CREATE TABLE			Answer(
AnswerID				INT(10),
Content					VARCHAR(50),
QuestionID				INT(10),
IsCorrect				ENUM ('True', 'False') 
);
DROP TABLE IF EXISTS	Exam;
CREATE TABLE			Exam(
ExamID					INT(10),
`Code`					VARCHAR(50),
Title					VARCHAR(50),
CategoryID				INT(10),
Duration				INT(90),
CreatorID				INT(10),
CreateDate				DATE
);
DROP TABLE IF EXISTS	ExamQuestion;
CREATE TABLE			ExamQuestion(
ExamID					INT(10),
QuestionID				INT(10)
);


