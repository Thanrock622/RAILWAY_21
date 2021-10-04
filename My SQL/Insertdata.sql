use TestingSystem3;
	-- nhap du lieu department --
INSERT INTO department(DepartmentName)
 VALUES 	('Sale'),
			('Marketing'),
			('Develop'),
			('QA');
-- nhap du lieu `Position` --
INSERT INTO `Position` (PositionName) 
VALUES 		('DEV'),
			('TEST'),
			('SCRUM_MASTER'),
			('PM');
-- nhap du lieu `Account` --
INSERT INTO `Account`	(Email,Username, FullName, DepartmentID, PositionID)
VALUES 					('luongnx@gmail.com','luongnx','Nguyen Xuan Luong', 1, 1),
						('thachtma@gmail.com','thanrock622','Tran Ngoc Thach', 2, 2),
                        ('ngocvinh@gmail.com','vinhtran','Tran Ngoc Vinh', 3, 3),
						('ngoctrinh23@gmail.com','trinhtran','Tran Thi Trinh', 4, 4),
						('hohuong86@gmail.com','huongho','Ho Thi Luong', 1, 2),
						('Kieudinhthithu','Thukieu','Dinh Thi THu Kieu ', 1, 3),
						('luongnx1@gmail.com','luongnx1','Nguyen Xuan Luong', 2, 1),
						('luongnx2@gmail.com','luongnx2','Nguyen Xuan Luong', 2, 3);
                        -- nhap du lieu Group --
INSERT INTO `Group`		(GroupName,CreatorID,CreateDate)
VALUES					('NHOM1','1','2021-10-1'),
						('NHOM2','2','2021-10-2'),
						('NHOM3','3','2021-10-3'),
						('NHOM4','4','2021-10-4'),
						('NHOM5','5','2021-10-5'),
						('NHOM6','6','2021-10-6'),
						('NHOM7','7','2021-10-7'),
                        ('NHOM8','8','2021-10-1');
                        -- nhap du lieu `GroupAccount` --
INSERT INTO `GroupAccount`(GroupID,AccountID,JoinDate)
VALUES					('1','1','2021-1-1'),
						('2','1','2021-2-1'),
                        ('4','2','2021-3-1'),
                        ('3','6','2021-4-1'),
                        ('1','3','2021-5-1'),
                        ('6','1','2021-6-1'),
                        ('2','5','2021-7-1'),
                        ('1','4','2021-8-1'),
                        ('7','1','2021-9-1');
                        -- nhap du lieu TypeQuestion --
INSERT INTO TypeQuestion(TypeName)
VALUES					('Essay'),
						('Multiple-Choice');
                        -- nhap du lieu Categoryquestion --
INSERT INTO Categoryquestion(CategoryName)
VALUES						('Java'		),
							('SQL'		),
							('Postman'	),
                            ('ASP.NET'	),
							('Ruby'		),
							('Python'	),
							('C++'		);
                            -- nhap du lieu Question --
INSERT INTO Question	(Content,CategoryID,TypeID,CreatorID,CreateDate)
VALUES					('hoi ve Java'		,'1','1','1','2021-1-1' ),
						('hoi ve SQL'		,'2','2','2','2021-2-1' ),
                        ('hoi ve Postman'	,'3','1','3','2021-3-1' ),
                        ('hoi ve ASP'		,'4','1','5','2021-4-1' ),
                        ('hoi ve Ruby'		,'5','2','4','2021-5-1' ),
                        ('hoi ve Python'	,'6','2','7','2021-7-1' ),
                        ('hoi ve C++'		,'7','1','6','2021-6-1' );
                        -- nhap du lieu Answer --
INSERT INTO Answer		(Content,QuestionID,isCorrect)
VALUES					('tra loi 1','2',0),
						('tra loi 2','1',1),
                        ('tra loi 3','2',0),
                        ('tra loi 4','5',0),
                        ('tra loi 5','6',1),
                        ('tra loi 6','4',1),
                        ('tra loi 7','3',0);
                        -- nhap du lieu exam --
INSERT INTO exam		(`Code`,Title,CategoryID,Duration,CreatorID,CreateDate)	
VALUES					('M1','Thi Java','1','60','1','2021-6-2'),
						('M2','Thi SQL','2','90','1','2021-6-6'),
                        ('M3','Thi Postman','3','60','4','2021-6-7'),
                        ('M4','Thi ASP','4','90','6','2021-6-8'),
                        ('M5','Thi Ruby','5','60','7','2021-6-9'),
                        ('M6','Thi Python','6','60','2','2021-6-21'),
                        ('M7','Thi C++','7','90','2','2021-6-22');
                        -- nhap du lieu examquestion --
INSERT INTO examquestion(ExamID,QuestionID)
VALUES					('1','1'),
						('2','1'),
                        ('3','2'),
                        ('4','5'),
                        ('5','6'),
                        ('6','7'),
                        ('7','4');
		
							

