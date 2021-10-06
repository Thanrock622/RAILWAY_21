USE testingsystem3;
-- Question 2:Lay tat ca cac phong ban --
SELECT *
FROM Department;
-- Question 3:lay id phong ban sale
SELECT DepartmentID
FROM department
WHERE DepartmentName = 'Sale'
;
-- Question 4: lấy ra thông tin account có full name dài nhất --
SELECT * 
FROM `account`
WHERE length(Full_Name)=(SELECT max(length(Full_Name)) FROM `account`)
ORDER BY Full_Name DESC;
-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3--
SELECT AccountID,Username,FullName,DepartmentID
FROM `account`
WHERE DepartmentID =3 AND length(FullName)= ( SELECT max(length(FullName))
											FROM 	`account`
											WHERE DepartmentID=3);
-- Question 6:Lấy ra tên group đã tham gia trước ngày 20/12/2019 --
SELECT GroupName
FROM `group`
WHERE CreateDate < '2019-12-20';
-- Question 7: Lấy ra ID của question có >= 4 câu trả lời --
SELECT AnswerID
FROM answer;
SELECT QuestionID,COUNT(QuestionID) AS IDCAUHOI
FROM answer 
GROUP BY QuestionID HAVING COUNT(QuestionID)>=4;
-- Question 8:Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày  20/12/2019 --
SELECT `code`
FROM exam
WHERE Duration >= 60 AND CreateDate < '2019-12-20';
-- Question 9:Lấy ra 5 group được tạo gần đây nhất
SELECT *
FROM `group`
ORDER BY  CreateDate DESC LIMIT 5;
-- Question 10: Đếm số nhân viên thuộc department có id = 2 ==
SELECT DepartmentID, COUNT(DepartmentID) AS TONG_SO_NHAN_VIEN
FROM `account`
WHERE DepartmentID=2 ;
-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT FullName
FROM `account`
WHERE FullName LIKE 'D%O';
-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE
FROM exam  
WHERE  CreateDate < '2019-12-20'   ;
-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE
FROM question
WHERE Content LIKE  'câu hỏi%';

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn --
UPDATE `ACCOUNT`
SET FullName = 'Nguyễn Bá Lộc',
	email = 'loc.nguyenba@vti.com.vn'	
	WHERE accountID=5;
  --  Question 15: update account có id = 5 sẽ thuộc group có id = 4 --
  UPDATE `groupaccount`
  SET groupID=4
  WHERE accountID=5;
    









