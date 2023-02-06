---№1
USE UNIVER;
go
CREATE VIEW [Преподаватель]
	as select TEACHER [Код],
			  TEACHER_NAME[Имя преподавателя],
			  GENDER [Пол],
			  PULPIT [Кафедра] 
		FROM TEACHER
go
SELECT * FROM Преподаватель

DROP VIEW [Преподаватель]

---№2
USE UNIVER;
go
CREATE VIEW [Количество кафедр]
	as select FACULTY.FACULTY_NAME [Факультет],
			  count(*) [Количество кафедр]
			  FROM FACULTY Inner Join PULPIT
			  ON FACULTY.FACULTY = PULPIT.FACULTY
			  GROUP BY FACULTY.FACULTY_NAME
go
SELECT * FROM [Количество кафедр]

DROP VIEW [Количество кафедр];

---№3
go
CREATE VIEW [Аудитории] ([Код аудитории], [Тип аудитории])
	as select AUDITORIUM.AUDITORIUM,
			  AUDITORIUM.AUDITORIUM_TYPE		
	FROM AUDITORIUM
	WHERE AUDITORIUM.AUDITORIUM_TYPE like('ЛК%')
go
SELECT * FROM [Аудитории]


INSERT INTO [Аудитории] ([Код аудитории], [Тип аудитории]) values ('138-4', 'ЛК');
SELECT * FROM [Аудитории] WHERE [Код аудитории] = '138-4'


DROP VIEW [Аудитории]

---№4
USE UNIVER;
------Выполнение INSERT и UPDATE допускается, но с учетом ограничения, задаваемого опцией WITH CHECK OPTION
go
CREATE VIEW [Лекционные аудитории]([Код аудитории], [Тип аудитории])
	as select AUDITORIUM.AUDITORIUM [Код аудитории],
			  AUDITORIUM.AUDITORIUM_TYPE [Тип аудитории]
	FROM AUDITORIUM
	WHERE AUDITORIUM.AUDITORIUM_TYPE like('ЛК%') WITH CHECK OPTION
go
SELECT * FROM [Лекционные аудитории]

INSERT INTO [Лекционные аудитории]([Код аудитории], [Тип аудитории]) values ('140-1', 'ЛК-К');
SELECT * FROM [Лекционные аудитории] WHERE [Код аудитории] = '140-1'



DROP VIEW [Лекционные аудитории]


------представление из 3 задания, где допускается выполнение оператора INSERT, UPDATE и DELETE
go
CREATE VIEW [Аудитории] ([Код аудитории], [Наименование аудитории])
	as select AUDITORIUM.AUDITORIUM,
			  AUDITORIUM.AUDITORIUM_TYPE
	FROM AUDITORIUM
	WHERE AUDITORIUM.AUDITORIUM_TYPE like('ЛК%') 
go
SELECT * FROM [Аудитории]

DROP VIEW [Аудитории]

---№5
USE UNIVER;
go
CREATE VIEW [Дисциплины]
	as select TOP 15  SUBJECT.SUBJECT[Код дисциплины],
					  SUBJECT.SUBJECT_NAME [Наименование дисциплины],
					  SUBJECT.PULPIT [Код кафедры]
	FROM SUBJECT
	ORDER BY SUBJECT.SUBJECT_NAME
go
SELECT * FROM [Дисциплины] 

DROP VIEW [Дисциплины] 

---№6
USE UNIVER;
go
CREATE VIEW [Количество кафедр]
	as select FACULTY.FACULTY_NAME [Факультет],
			  count(*) [Количество кафедр]
			  FROM FACULTY Inner Join PULPIT
			  ON FACULTY.FACULTY = PULPIT.FACULTY
			  GROUP BY FACULTY.FACULTY_NAME
go
SELECT * FROM [Количество кафедр]

go
ALTER VIEW [Количество кафедр] WITH SCHEMABINDING
	as select FACULTY.FACULTY_NAME [Факультет],
			  count(*) [Количество кафедр]
			  FROM dbo.FACULTY Inner Join dbo.PULPIT
			  ON FACULTY.FACULTY = PULPIT.FACULTY
			  GROUP BY FACULTY.FACULTY_NAME
go

SELECT * FROM [Количество кафедр]

DROP VIEW [Количество кафедр];

