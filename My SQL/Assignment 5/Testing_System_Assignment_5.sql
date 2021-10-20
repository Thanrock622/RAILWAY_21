use `testingsystem3`;
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE OR REPLACE VIEW vw_DSNV_Sale
AS
SELECT * 
FROM department D
INNER JOIN `Account` A
ON D.DepartmentID=A.DepartmentID
WHERE D.DepartmentID= (SELECT DepartmentID as DID
						FROM department
                        WHERE DepartmentName='Sale');
-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE VIEW account_group
AS
SELECT A.AccountID, COUNT(GA.AccountID) AS SOGROUP
FROM `account` A
INNER JOIN groupaccount GA
ON A.AccountID=GA.AccountID
GROUP BY A.AccountID
HAVING COUNT(GA.AccountID)= ( SELECT COUNT(GA.AccountID)
							FROM `account` A
							INNER JOIN groupaccount GA
							ON A.AccountID=GA.AccountID
							GROUP BY A.AccountID
                            ORDER BY COUNT(GA.AccountID) DESC LIMIT 1);
-- cte

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
USE `testingsystem3`;
CREATE VIEW conten123 as
SELECT Content, char_length(Content)
FROM question 
WHERE char_length(Content) > 300;
-- cte
WITH CONTEN_INFO AS (
SELECT Content, char_length(Content)
FROM question 
WHERE char_length(Content) > 300)
DELETE 
 FROM question
 WHERE QuestionID 
 IN ( SELECT QuestionID
		FROM CONTEN_INFO ) ;





-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE VIEW Department_max
AS
SELECT D.DepartmentID,
D.DepartmentName
,count(A.DepartmentID) AS SONHANVIEN
 FROM department D
 INNER JOIN `account` A
 ON D.DepartmentID=A.AccountID
 GROUP BY D.DepartmentID
 HAVING count(A.DepartmentID)=(SELECT count(A.DepartmentID)
								 FROM department D
								 INNER JOIN `account` A
								 ON D.DepartmentID=A.AccountID
								 GROUP BY D.DepartmentID
                                 ORDER BY count(A.DepartmentID) DESC LIMIT 1 )
;
-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
CREATE VIEW usernguyen
AS
SELECT A.AccountID,
A.FullName,
Content AS CAUHOI
FROM `account`A
INNER JOIN question Q
ON A.AccountID=Q.CreatorID
WHERE FullName LIKE 'Nguyễn%';
SELECT * from usernguyen

