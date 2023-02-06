
---№1

DECLARE 
--инициализация в операторе объявления
@h char = 'P',
@v varchar(4) = 'BSTU',
@datet date,
@dtime time,
@i int = 18,
@si smallint,
@ti tinyint,
@num numeric(12,5); 

--с помощью SET
SET @datet = '2022-03-31'
SET	@dtime = '20:20'
SELECT @i = 100, @v = '5'
PRINT @h 
PRINT @v 
PRINT @datet
PRINT @dtime
SELECT @i intv, @si smallintv, @ti tinyintv


---№2

USE UNIVER;
DECLARE @capacity int = (SELECT SUM(AUDITORIUM.AUDITORIUM_CAPACITY) FROM AUDITORIUM),
		@numOfAud int = (SELECT COUNT(*) FROM AUDITORIUM),
		@avgCapac int = (SELECT AVG(AUDITORIUM.AUDITORIUM_CAPACITY) FROM AUDITORIUM),
		@numLessAvg int,
		@proc numeric(8,3);
IF @capacity > 200
begin
	PRINT 'Полная вместимость аудиторий: ' + cast(@capacity as varchar(10));
	PRINT 'Количество аудиторий: ' + cast(@numOfAud as varchar(10));
	PRINT 'Средняя вместимость аудиторий: ' + cast(@avgCapac as varchar(10));
	SET @numLessAVG = (SELECT count(*) 
							FROM AUDITORIUM
							WHERE AUDITORIUM_CAPACITY < @avgCapac)
	PRINT 'Количество аудиторий, вместимость которых менее средней: ' + cast(@numLessAVG as varchar(10));
	SET @proc = ((cast(@numLessAvg as numeric(8,3)) *100) / cast(@numOfAud as numeric(8,3)));
	PRINT 'Процент аудиторий, вместимость которых менее средней: ' + cast(@proc as varchar(10));
end
ELSE IF @capacity = 200 PRINT 'Общая вместительность равна 200'
ELSE IF @capacity < 200 PRINT 'Общая вместительность меньше 200'

---№3

PRINT 'Число обработанных строк: ' + cast(@@ROWCOUNT as varchar(10))
PRINT 'Версия SQL Server: ' + cast(@@VERSION as varchar(10))
PRINT 'Системный идентификатор процесса, назначенный сервером текущему подключению: ' + cast(@@SPID as varchar(10))
PRINT 'Код последней ошибки: ' + cast(@@ERROR as varchar(10))
PRINT 'Имя сервера: ' + cast(@@SERVERNAME as varchar(10))
PRINT 'Возвращает уровень вложенности транзакции: ' + cast(@@TRANCOUNT as varchar(10));
PRINT 'Проверка результата считывания строк результирующего набора: ' + cast(@@FETCH_STATUS as varchar(10))
PRINT 'Уровень вложенности текущей процедуры: ' + cast(@@NESTLEVEL as varchar(10))

---№4

DECLARE @z float, @x int = 2, @t int = 1
if		@t > @x
	SET @z = power(sin(@t),2);
else if @t < @x
	SET @z = 4 * (@t + @x);
else
	SET @z = (1 - exp(@x - 2))
PRINT 'z= ' + cast(@z as varchar(10))

----------------------------------------------
DECLARE @result nvarchar(10);
DECLARE @fullname TABLE 
			(
				surname nvarchar(10) default 'Самсоник',
				name nvarchar(10) default 'Анастасия',
				secondname nvarchar(10) default 'Ивановна'
			);
INSERT @fullname default values;
SELECT * FROM @fullname;
SET @result = (SELECT CONCAT(surname, ' ', left(name, 1), ' ' , left(secondname, 1)) [ФИО]
					FROM @fullname)

PRINT @result
SELECT @result result
----------------------------------------------
USE UNIVER;
SELECT STUDENT.NAME [Имя студента],
	   STUDENT.BDAY [День рождения],
	   DATEDIFF(YEAR, STUDENT.BDAY, SYSDATETIME()) AS [Количество полных лет]
FROM STUDENT 
WHERE MONTH(STUDENT.BDAY) = MONTH(SYSDATETIME()) + 1		--так не делать
----------------------------------------------
USE UNIVER;
SELECT STUDENT.NAME [Имя студента],
	   STUDENT.BDAY [День рождения],
	   DATEDIFF(YEAR, STUDENT.BDAY, SYSDATETIME()) AS [Количество полных лет]
FROM STUDENT 
WHERE MONTH(STUDENT.BDAY) = MONTH(DATEADD(m, 1, SYSDATETIME()))
----------------------------------------------
DECLARE @testday date
SET @testday = (SELECT PROGRESS.PDATE 
				FROM PROGRESS Inner Join STUDENT ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
				WHERE PROGRESS.SUBJECT in('СУБД') and STUDENT.IDSTUDENT in('1015'))
PRINT 'День недели, в который студенты некоторой группы сдавали экзамен по СУБД: ' + CONVERT (varchar(12), DATEPART(dw, @testday))

---№5

USE UNIVER;
DECLARE @capacity1 int = (select sum(AUDITORIUM.AUDITORIUM_CAPACITY) from AUDITORIUM)
IF (@capacity1 > 100)
begin 
PRINT 'Суммарная вместительность аудиторий больше 100';
PRINT 'Суммарная вместительность: ' + cast(@capacity1 as varchar(10));
end;
ELSE
begin
PRINT 'Суммарная вместительность аудиторий меньше или равна 100';
PRINT 'Суммарная вместительность: ' + cast(@capacity1 as varchar(10));
end;

---№6

USE UNIVER;
SELECT CASE 
		when (PROGRESS.NOTE = 5) then 'пять'
		when (PROGRESS.NOTE = 6) then 'шесть'
		when (PROGRESS.NOTE between 6 and 7) then 'семь'
		when (PROGRESS.NOTE between 7 and 8) then 'восемь'
		else 'другая отметка'
		end [Оценка],
		count(*) [Количество учеников с данной отметкой]
		FROM PROGRESS 
		Inner Join STUDENT ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		GROUP BY CASE 
			when (PROGRESS.NOTE = 5) then 'пять'
			when (PROGRESS.NOTE = 6) then 'шесть'
			when (PROGRESS.NOTE between 6 and 7) then 'семь'
			when (PROGRESS.NOTE between 7 and 8) then 'восемь'
			else 'другая отметка'
			end
		ORDER BY [Количество учеников с данной отметкой]

---№7

CREATE TABLE #TEST 
(
	TIND int, 
	TFIELD varchar(100)
)
--SET nocount on --не выводит сообщения о вводе строки
DECLARE @i1 int = 0
WHILE @i1 < 1000
	begin
		insert #TEST(TIND, TFIELD) 
			values (floor(30000*rand()), replicate('test_text', 2))
		if (@i1 % 100 = 0) 
			print @i;
		set @i1 = @i1 + 1
	end
SELECT * FROM #TEST
DROP TABLE #TEST

---№8

go
DECLARE @x int = 1
	print @x+1
	print @x+2
	RETURN
	print @x+3


go
print 'Метка1'
RETURN
print 'Метка2'


---№9

declare @x int = 3, @y int = 0, @z int;
begin TRY
	if @y = 0
		raiserror ('Деление на ноль!!!!', 10, 1);
	else set @z = @x / @y;
end TRY
begin CATCH 
	print 'Номер ошибки : ' + CAST(ERROR_NUMBER() as varchar(6));
	print 'Сообщение    : ' + ERROR_MESSAGE();
	print 'Номер строки : ' + CAST(ERROR_LINE() as varchar(8));
	print 'Процедура    : ' + CAST(ERROR_PROCEDURE() as varchar(6));
	print 'Уровень      : ' + CAST(ERROR_SEVERITY() as varchar(6));
	print 'Метка ошибки : ' + CAST(ERROR_STATE() as varchar(8));
end catch