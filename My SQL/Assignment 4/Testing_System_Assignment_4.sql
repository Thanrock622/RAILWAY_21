use `testingsystem3`;
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT 
A.AccountID,
A.Email,
A.Username,
A.FullName,
A.DepartmentID,
A.PositionID,
A.CreateDate,
D.DepartmentName
from `account` A
LEFT JOIN department D
ON A.DepartmentID=D.DepartmentID;

-- Question 2: Viết lệnh để lấy ra thông tin các account, chuc danh được tạo sau ngày 20/12/2010
SELECT 
A.AccountID,
A.Email,
A.Username,
A.FullName,
A.DepartmentID,
A.CreateDate,
P.PositionID,
P.PositionName
FROM account A 
LEFT JOIN position P
ON A.PositionID=P.PositionID
WHERE A.CreateDate>2010-12-20;
-- Question 3: Viết lệnh để lấy ra tất cả các chuc danh(Position) la  developer 
SELECT 
A.AccountID,
A.Email,
A.Username,
A.FullName,
P.PositionID,
P.PositionName
FROM `account` A
LEFT JOIN position P
ON A.PositionID=P.PositionID
WHERE P.PositionName='DEV';
-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT 
A.DepartmentID,
D.DepartmentName,
count(D.DepartmentID) AS SONHANVIEN
FROM department D 
INNER JOIN `account` A
ON A.DepartmentID=D.DepartmentID
GROUP BY A.DepartmentID 
HAVING count(D.DepartmentID)>3;
-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT EQ.QuestionID,
E.Content,
E.CategoryID,
E.TypeID,
 COUNT(EQ.ExamID) AS SOLUONG
FROM examquestion EQ
INNER JOIN question E
ON EQ.QuestionID=E.QuestionID
GROUP BY EQ.QuestionID
HAVING COUNT(EQ.ExamID)= (SELECT MAX(S)
						FROM (		SELECT
									 COUNT(EQ.ExamID) AS S
									FROM examquestion EQ
									INNER JOIN question E
									ON EQ.QuestionID=E.QuestionID
									GROUP BY EQ.QuestionID) AS L)

;



-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT CQ.CategoryID,
CQ.CategoryName,
count(Q.CategoryID) AS SOCAUHOI
FROM categoryquestion CQ
LEFT JOIN question Q
ON	CQ.CategoryID=Q.CategoryID
GROUP BY CQ.CategoryID
;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT Q.QuestionID, 
Q.Content,
COUNT(EQ.ExamID)
FROM question Q
LEFT JOIN examquestion EQ
ON EQ.QuestionID=Q.QuestionID
GROUP BY Q.Content
;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT a.QuestionID,a. Content,
count(a.QuestionID)
FROM answer a INNER JOIN question b
on a.QuestionID=b.QuestionID
GROUP BY a.QuestionID
having count(a.QuestionID) ;
-- Question 9: Thống kê số lượng account trong mỗi group
SELECT G.GroupID,
G.GroupName,count(GA.AccountID) AS SOLUONGACCOUNT
FROM `group` G
INNER JOIN groupaccount GA
ON G.GroupID=GA.GroupID
GROUP BY G.GroupID
;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT P.PositionID,
P.PositionName, count(A.AccountID) AS SONGUOI
FROM Position P
INNER JOIN `Account` A
ON P.PositionID= A.PositionID
GROUP BY P.PositionID
ORDER BY count(A.AccountID) LIMIT 1
;

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT 
    D.DepartmentID,
    D.DepartmentName,
    P.PositionName,
    COUNT(A.PositionID) AS SOLUONG
FROM
    department D
        INNER JOIN
    `Account` A ON D.DepartmentID = A.DepartmentID
        INNER JOIN
    position P ON P.PositionID = A.PositionID
GROUP BY D.DepartmentID
;
-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …
SELECT 
Q.QuestionID,
Q.Content AS CAUHOI,
TQ.TypeName AS LOAICAUHOI,
A.Content AS CAUTRALOI,
Q.CreatorID AS IDNGUOITAO
FROM question Q
INNER JOIN typequestion TQ
ON Q.TypeID=TQ.TypeID
INNER JOIN answer A
ON A.QuestionID=Q.QuestionID
;
-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT Q.QuestionID,
TQ.TypeName,
count(QuestionID) AS SOLUONGCAUHOI
FROM question Q
INNER JOIN typequestion TQ
ON Q.TypeID=TQ.TypeID
GROUP BY TQ.TypeID
;

-- Question 14:Lấy ra group không có account nào
SELECT *
FROM `group` 
WHERE GroupID NOT IN 	(SELECT GroupID
						FROM  groupaccount);

-- Question 16: Lấy ra question không có answer nào
SELECT *
FROM question
WHERE questionID NOT IN (SELECT questionID
						FROM  answer);
-- Exercise 2: Union
-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
SELECT 
a.Email,
a.Username,
b.AccountID,
b.GroupID
FROM `account` a LEFT JOIN groupaccount b
ON a.AccountID= b.AccountID
WHERE b.GroupID=1;
-- b) Lấy các account thuộc nhóm thứ 2
SELECT 
a.Email,
a.Username,
b.AccountID,
b.GroupID
FROM `account` a LEFT JOIN groupaccount b
ON a.AccountID= b.AccountID
WHERE b.GroupID=2;
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT 
a.Email,
a.Username,
b.AccountID,
b.GroupID
FROM `account` a LEFT JOIN groupaccount b
ON a.AccountID= b.AccountID
WHERE b.GroupID=1
UNION
SELECT 
a.Email,
a.Username,
b.AccountID,
b.GroupID
FROM `account` a LEFT JOIN groupaccount b
ON a.AccountID= b.AccountID
WHERE b.GroupID=2;

-- Question 18:
-- a) Lấy các group có lớn hơn 5 thành viên
SELECT 
b.GroupID,
b.GroupName,
count(a.AccountID)
FROM groupaccount a LEFT JOIN `group` b
ON a.GroupID= b.GroupID
GROUP BY b.GroupID HAVING count(a.AccountID)>=5
;

-- b) Lấy các group có nhỏ hơn 7 thành viên
SELECT 
b.GroupID,
b.GroupName,
count(a.AccountID)
FROM groupaccount a LEFT JOIN `group` b
ON a.GroupID= b.GroupID
GROUP BY b.GroupID HAVING count(a.AccountID)<7
;
-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT 
b.GroupID,
b.GroupName,
count(a.AccountID)
FROM groupaccount a LEFT JOIN `group` b
ON a.GroupID= b.GroupID
GROUP BY b.GroupID HAVING count(a.AccountID)>=5
UNION
SELECT 
b.GroupID,
b.GroupName,
count(a.AccountID)
FROM groupaccount a LEFT JOIN `group` b
ON a.GroupID= b.GroupID
GROUP BY b.GroupID HAVING count(a.AccountID)<7
;
