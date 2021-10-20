-- CAU SU DUNG JOIN 2 LAN
SELECT 		D.DepartmentID, D.DepartmentName, COUNT(P.PositionID) AS 'SO LUONG'
FROM		Position P INNER JOIN `Account` A 
ON			P.PositionID = A.PositionID
INNER JOIN	Department D
ON			A.DepartmentID = D.DepartmentID
GROUP BY	A.DepartmentID
ORDER BY	A.DepartmentID ASC;
-- Tao bang 8: Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
    QuestionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content					NVARCHAR(50) NOT NULL,
    CategoryID				TINYINT UNSIGNED NOT NULL,
    TypeID					TINYINT UNSIGNED NOT NULL,
    CreatorID				TINYINT UNSIGNED NOT NULL UNIQUE KEY,
    CreateDate				DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY(CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) 	REFERENCES TypeQuestion(TypeID)
);
--  chay cte ddon gian
WITH MIN_StandardCost AS(
	SELECT 	MIN(StandardCost)
	FROM 	Product
	WHERE 	ProductSubcategoryID = 3
)
SELECT 	`Name`
FROM 	Product
WHERE	StandardCost = (SELECT * FROM MIN_StandardCost);
-- CHẠY CTE phuc tap 
WITH MAX_COUNT_ACCOUNTID AS(
	SELECT 		COUNT(GA.AccountID) 
	FROM		`Account` A INNER JOIN GroupAccount GA
	ON			A.AccountID = GA.AccountID
	GROUP BY	A.AccountID
	ORDER BY	COUNT(GA.AccountID) DESC
	LIMIT		1
)
SELECT 		A.*, COUNT(GA.AccountID) AS 'SO LUONG'
FROM		`Account` A INNER JOIN GroupAccount GA
ON			A.AccountID = GA.AccountID
GROUP BY	A.AccountID
HAVING		COUNT(GA.AccountID) = (SELECT * FROM MAX_COUNT_ACCOUNTID);-- Question 14: lấy ra group không có account nào
SELECT		*
FROM		`Group` 
WHERE		GroupID  NOT IN
					(SELECT		GroupID
					FROM		GroupAccount);


-- Question 16: lấy ra question không có answer nào 
SELECT		*
FROM		Question
WHERE		QuestionID NOT IN
						(SELECT		QuestionID
                        From		Answer);
