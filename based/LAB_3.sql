USE S_MyBase
CREATE TABLE ??????????
( ID int primary key,
  ?????????? nvarchar(50) unique,
  ??????? nvarchar(50),
  ????? nvarchar(50)	
);

CREATE TABLE ??????
( ?????_?????? int primary key,
  ????????????_?????? nvarchar(50),
  ????_?????? date,
  ??????????_????? int not null,
  ???????? int
);

CREATE TABLE ??????
( ???????????? nvarchar(50) primary key,
  ???? real,
  ?????????? int
);

ALTER TABLE ?????? ADD ???????? nvarchar(50);
ALTER TABLE ?????? ADD ?????_???????? nvarchar(50);

INSERT INTO ??????????(ID, ??????????, ???????, ?????)
			values (1, '???????', '+375447819283', '??????? ???.4'),
			(2, '??????', '+375295748291','??????????? 27'),
			(3, '????????', '+375339698694','??????? 16')

INSERT INTO ??????(????????????, ????, ??????????, ????????, ?????_????????)
			values('????', 400, 60, '???????????????', '????? 3'),
			('???????', 600, 50, '??????????', '????? 2'),
			('?????', 400, 60, '???????', '????? 1')

INSERT INTO ??????(?????_??????, ????????????_??????, ????_??????, ??????????_?????, ????????)
					values(1, '?????', '2021-01-12', 50,2),
					(2, '???????', '2021-01-15', 20,3),
					(3, '????', '2021-01-14', 200,1)

SELECT * FROM ??????;
SELECT count(*) FROM ??????;

SELECT ????????????[??????? ??????], ???? FROM ??????
		WHERE ????<500

SELECT Top(10) ????????????_??????  
				FROM ?????? Order by ?????_?????? Desc;

UPDATE ?????????? SET ?????????? = '????????' where ID = 2;
UPDATE ?????? SET ???? = 200 where ???????????? = '?????';

SELECT Distinct ????????????_??????, ????????, ????_?????? FROM ?????? 
			Where ????_?????? Between '2021-01-11' and '2021-01-14'

SELECT Distinct ????????????_??????, ????????, ????_?????? FROM ?????? 
			Where ????????????_?????? LIKE '?%'