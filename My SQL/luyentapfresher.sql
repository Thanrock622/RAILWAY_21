-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu --
DROP DATABASE IF EXISTS Fresher;
CREATE DATABASE 		Fresher;
USE						Fresher;
-- TAO BANG Trainee --	
DROP DATABASE IF EXISTS	Trainee;
CREATE TABLE			Trainee(
TraineeID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Full_Name NVARCHAR(50) NOT NULL,
Birth_Date	DATETIME DEFAULT NOW(),
Gender		ENUM('MALE','FEMALE','UNKNOWN') NOT NULL,
ET_IQ	TINYINT UNSIGNED NOT NULL CHECK (ET_IQ<=20),
ET_Gmath TINYINT UNSIGNED NOT NULL CHECK (ET_Gmath <=20),
ET_English  TINYINT UNSIGNED NOT NULL CHECK (ET_English <=50),
Training_Class	NVARCHAR(50) NOT NULL UNIQUE KEY,
Evaluation_Notes	NVARCHAR(100) NOT NULL
);
	-- Question 2: Thêm ít nhất 10 bản ghi vào table
INSERT INTO trainee(Full_Name,		Birth_Date,		Gender,		ET_IQ,ET_Gmath,	ET_English,	Training_Class,	Evaluation_Notes)
VALUES				('NGUYEN VAN A','1999-1-1',		'MALE',		'20',	'20',		'10',		'VTV1',			'DH NHATRANG'),
					('NGUYEN VAN B','2000-10-1',	'FEMALE',	'10',	'20',		'20',		'VTV2',			'DH NTA'),
                    ('NGUYEN VAN C','1992-10-2',	'MALE',		'11',	'10',		'30',		'VTV3',			'DH CANTHO'),
                    ('NGUYEN VAN E','1993-10-13',	'FEMALE',	'15',	'0',		'40',		'VTV4',			'DH MU'),
                    ('NGUYEN VAN F','1999-10-15',	'FEMALE',	'9',	'12',		'50',		'VTV5',			'DH BACSA'),
                    ('NGUYEN VAN G','1994-11-9'	,	'FEMALE',	'20',	'15',		'50',		'VTV6',			'DH REAL'),
                    ('NGUYEN VAN H','1990-2-22',	'MALE',		'10',	'18',		'0',		'HTV',			'DH DIUVEN'),
                    ('NGUYEN VAN TH','1995-7-7',		'UNKNOWN',	'15',	'20',		'49',		'BIBI',			'DH HOCHIMINH'),
                    ('NGUYEN VAN Y','1995-11-4',	'MALE',		'17',	'17',		'50',		'VINHLONG1',	'DH HANOI'),
                    ('NGUYEN VAN U','1996-3-1',		'MALE',		'7',	'19',		'50',		'KHANHHOA',		'DH VUNGTAU');
-- Question 3: Insert 1 bản ghi mà có điểm ET_IQ =30. Sau đó xem kết quả
INSERT INTO trainee(Full_Name,		Birth_Date,		Gender,		ET_IQ,ET_Gmath,	ET_English,	Training_Class,	Evaluation_Notes)
VALUES	('NGUYEN VAN A1','1999-1-1',		'MALE',		'20',	'30',		'10',		'VTV',			'DH NHATRANG');

-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào,và sắp xếp theo ngày sinh. Điểm ET_IQ >=12, ET_Gmath>=12, ET_English>=20
SELECT *
FROM trainee
WHERE ET_IQ >=12 AND ET_Gmath>=12 AND ET_English>=20
ORDER BY Birth_Date;
 -- Question 5: Viết lệnh để lấy ra thông tin thực tập sinh có tên bắt đầu bằng chữ N và kết thúc  bằng chữ C
 SELECT *
 FROM trainee
 WHERE Full_Name LIKE 'N%C';
 -- Question 6: Viết lệnh để lấy ra thông tin thực tập sinh mà tên có ký thự thứ 2 là chữ G
SELECT *
 FROM trainee
 WHERE Full_Name LIKE '_G%';
 -- Question 7: Viết lệnh để lấy ra thông tin thực tập sinh mà tên có 10 ký tự và ký tự cuối cùng là C
 -- có 10 ký tụ (length =10)
 -- ký tự cuối = c
SELECT * 
FROM trainee
WHERE Full_Name LIKE '%c'
	AND length(Full_Name) = 10;
-- Question 8: Viết lệnh để lấy ra Fullname của các thực tập sinh trong lớp, lọc bỏ các tên trùng nhau.
 SELECT DISTINCT Full_Name
 FROM trainee;
 -- Question 9: Viết lệnh để lấy ra Fullname của các thực tập sinh trong lớp, sắp xếp các tên này theo thứ tự từ A-Z.
 SELECT Full_Name
  FROM trainee
  ORDER BY Full_Name ASC;
  -- Question 10: Viết lệnh để lấy ra thông tin thực tập sinh có tên dài nhất
SELECT * 
FROM trainee
WHERE length(Full_Name)=(SELECT max(length(Full_Name)) FROM trainee)
ORDER BY Full_Name DESC;
-- Question 11: Viết lệnh để lấy ra ID, Fullname và Ngày sinh thực tập sinh có tên dài nhất
SELECT TraineeID,Full_Name,Birth_Date
FROM trainee
WHERE length(Full_Name)=(SELECT max(length(Full_Name)) FROM trainee)
ORDER BY Full_Name DESC;
-- Question 12: Viết lệnh để lấy ra Tên, và điểm IQ, Gmath, English thực tập sinh có tên dài nhất

SELECT Full_Name,ET_IQ,ET_Gmath,ET_English
FROM trainee
WHERE length(Full_Name)=(	SELECT max(length(Full_Name)) 
							FROM trainee)
ORDER BY Full_Name DESC;

-- Question 13 Lấy ra 5 thực tập sinh có tuổi nhỏ nhất
SELECT *
FROM trainee
ORDER BY Birth_Date DESC LIMIT 5  ;
-- Question 14: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là những người thỏa mãn số điểm
-- • ET_IQ + ET_Gmath>=20 
-- • ET_IQ>=8 
-- • ET_Gmath>=8 
-- • ET_English>=18
SELECT *
FROM trainee
WHERE ET_IQ+ET_Gmath>=20 
	AND ET_IQ>=8 
    AND ET_Gmath>=8
    AND ET_English>=18 ;

-- Question 15: Xóa thực tập sinh có TraineeID = 5
DELETE 
FROM trainee
WHERE TraineeID= 5;
-- Question 16: Xóa thực tập sinh có tổng điểm ET_IQ, ET_Gmath <=15
-- Tắt safe updates
SET SQL_SAFE_UPDATES = 0;
DELETE
FROM trainee 
WHERE ET_IQ+ET_Gmath<=15;

-- Question 17: Xóa thực tập sinh quá 30 tuổi.
DELETE
FROM trainee 
WHERE  year(NOW())-year(Birth_Date)>30;

-- Question 18: Thực tập sinh TraineeID = 3 được chuyển sang lớp " VTI003". Hãy cập nhật thông tin vào database.
UPDATE trainee
SET Training_Class = 'VTV1'
WHERE TraineeID = 3;
-- Question 19: Do có sự nhầm lẫn khi nhập liệu nên thông tin của học sinh số 10 đang bị sai, hãy cập nhật lại tên thành “LeVanA”, điểm ET_IQ =10, điểm ET_Gmath =15, điểm ET_English = 30.
UPDATE trainee
SET Full_Name='LeVanA',ET_IQ=10,ET_Gmath =15,ET_English = 30
WHERE TraineeID=10;

-- Question 20: Đếm xem trong lớp VTI001 có bao nhiêu thực tập sinh.
SELECT Training_Class, count(*) AS 'So thuc tap sinh'
FROM trainee
WHERE Training_Class = 'VTV1';
-- Question 22: Đếm tổng số thực tập sinh trong lớp VTI001 và VTI003 có bao nhiêu thực tập sinh.
SELECT count(*) AS 'So thuc tap sinh'
FROM trainee
WHERE Training_Class = 'VTV1' 
	or Training_Class = 'VTV3';
-- Question 23: Lấy ra số lượng các thực tập sinh theo giới tính: Male, Female, Unknown.
SELECT Gender, count(TraineeID) AS 'So thuc tap sinh'
FROM trainee
GROUP BY Gender;
-- Question 24: Lấy ra lớp có lớn hơn 5 thực tập viên

SELECT Training_Class, count(*) AS 'SO thuc tap sinh'
FROM trainee
GROUP BY Training_Class 
HAVING count(Training_Class)>5;

-- Question 26: Lấy ra trường có ít hơn 4 thực tập viên tham gia khóa học
SELECT Evaluation_Notes, count(*) AS 'SO thuc tap sinh'
FROM trainee
GROUP BY Evaluation_Notes
HAVING count(Evaluation_Notes)<4;
-- Question 27: Bước 1: Lấy ra danh sách thông tin ID, Fullname, lớp thực tập viên có lớp 'VTI001'
SELECT TraineeID,Full_Name,Training_Class
FROM trainee
WHERE Training_Class = 'VTV1'; 
-- Bước 2: Lấy ra danh sách thông tin ID, Fullname, lớp thực tập viên có lớp 'VTI002'
SELECT TraineeID,Full_Name,Training_Class
FROM trainee
WHERE Training_Class = 'VTV2'; 
-- Bước 3: Sử dụng UNION để nối 2 kết quả ở bước 1 và 2
SELECT TraineeID,Full_Name,Training_Class
FROM trainee
WHERE Training_Class = 'VTV1'
UNION
SELECT TraineeID,Full_Name,Training_Class
FROM trainee
WHERE Training_Class = 'VTV2';





