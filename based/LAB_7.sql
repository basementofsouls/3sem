---�1
USE UNIVER;
go
CREATE VIEW [�������������]
	as select TEACHER [���],
			  TEACHER_NAME[��� �������������],
			  GENDER [���],
			  PULPIT [�������] 
		FROM TEACHER
go
SELECT * FROM �������������

DROP VIEW [�������������]

---�2
USE UNIVER;
go
CREATE VIEW [���������� ������]
	as select FACULTY.FACULTY_NAME [���������],
			  count(*) [���������� ������]
			  FROM FACULTY Inner Join PULPIT
			  ON FACULTY.FACULTY = PULPIT.FACULTY
			  GROUP BY FACULTY.FACULTY_NAME
go
SELECT * FROM [���������� ������]

DROP VIEW [���������� ������];

---�3
go
CREATE VIEW [���������] ([��� ���������], [��� ���������])
	as select AUDITORIUM.AUDITORIUM,
			  AUDITORIUM.AUDITORIUM_TYPE		
	FROM AUDITORIUM
	WHERE AUDITORIUM.AUDITORIUM_TYPE like('��%')
go
SELECT * FROM [���������]


INSERT INTO [���������] ([��� ���������], [��� ���������]) values ('138-4', '��');
SELECT * FROM [���������] WHERE [��� ���������] = '138-4'


DROP VIEW [���������]

---�4
USE UNIVER;
------���������� INSERT � UPDATE �����������, �� � ������ �����������, ����������� ������ WITH CHECK OPTION
go
CREATE VIEW [���������� ���������]([��� ���������], [��� ���������])
	as select AUDITORIUM.AUDITORIUM [��� ���������],
			  AUDITORIUM.AUDITORIUM_TYPE [��� ���������]
	FROM AUDITORIUM
	WHERE AUDITORIUM.AUDITORIUM_TYPE like('��%') WITH CHECK OPTION
go
SELECT * FROM [���������� ���������]

INSERT INTO [���������� ���������]([��� ���������], [��� ���������]) values ('140-1', '��-�');
SELECT * FROM [���������� ���������] WHERE [��� ���������] = '140-1'



DROP VIEW [���������� ���������]


------������������� �� 3 �������, ��� ����������� ���������� ��������� INSERT, UPDATE � DELETE
go
CREATE VIEW [���������] ([��� ���������], [������������ ���������])
	as select AUDITORIUM.AUDITORIUM,
			  AUDITORIUM.AUDITORIUM_TYPE
	FROM AUDITORIUM
	WHERE AUDITORIUM.AUDITORIUM_TYPE like('��%') 
go
SELECT * FROM [���������]

DROP VIEW [���������]

---�5
USE UNIVER;
go
CREATE VIEW [����������]
	as select TOP 15  SUBJECT.SUBJECT[��� ����������],
					  SUBJECT.SUBJECT_NAME [������������ ����������],
					  SUBJECT.PULPIT [��� �������]
	FROM SUBJECT
	ORDER BY SUBJECT.SUBJECT_NAME
go
SELECT * FROM [����������] 

DROP VIEW [����������] 

---�6
USE UNIVER;
go
CREATE VIEW [���������� ������]
	as select FACULTY.FACULTY_NAME [���������],
			  count(*) [���������� ������]
			  FROM FACULTY Inner Join PULPIT
			  ON FACULTY.FACULTY = PULPIT.FACULTY
			  GROUP BY FACULTY.FACULTY_NAME
go
SELECT * FROM [���������� ������]

go
ALTER VIEW [���������� ������] WITH SCHEMABINDING
	as select FACULTY.FACULTY_NAME [���������],
			  count(*) [���������� ������]
			  FROM dbo.FACULTY Inner Join dbo.PULPIT
			  ON FACULTY.FACULTY = PULPIT.FACULTY
			  GROUP BY FACULTY.FACULTY_NAME
go

SELECT * FROM [���������� ������]

DROP VIEW [���������� ������];

