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
	-- TAO BANG GHI --
INSERT INTO trainee(Full_Name,		Birth_Date,		Gender,		ET_IQ,ET_Gmath,	ET_English,	Training_Class,	Evaluation_Notes)
VALUES				('NGUYEN VAN A','1999-1-1',		'MALE',		'20',	'20',		'10',		'VTV1',			'DH NHATRANG'),
					('NGUYEN VAN B','2000-10-1',	'FEMALE',	'10',	'20',		'20',		'VTV2',			'DH NTA'),
                    ('NGUYEN VAN C','1992-10-2',	'MALE',		'11',	'10',		'30',		'VTV3',			'DH CANTHO'),
                    ('NGUYEN VAN E','1993-10-13',	'FEMALE',	'15',	'0',		'40',		'VTV4',			'DH MU'),
                    ('NGUYEN VAN F','1999-10-15',	'FEMALE',	'9',	'12',		'50',		'VTV5',			'DH BACSA'),
                    ('NGUYEN VAN G','1994-11-9'	,	'FEMALE',	'20',	'15',		'50',		'VTV6',			'DH REAL'),
                    ('NGUYEN VAN H','1990-2-22',	'MALE',		'10',	'18',		'0',		'HTV',			'DH DIUVEN'),
                    ('NGUYEN VAN T','1995-7-7',		'UNKNOWN',	'0',	'20',		'49',		'BIBI',			'DH HOCHIMINH'),
                    ('NGUYEN VAN Y','1995-11-4',	'MALE',		'11',	'17',		'50',		'VINHLONG1',	'DH HANOI'),
                    ('NGUYEN VAN U','1996-3-1',		'MALE',		'7',	'19',		'50',		'KHANHHOA',		'DH VUNGTAU');


