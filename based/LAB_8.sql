
---�1

DECLARE 
--������������� � ��������� ����������
@h char = 'P',
@v varchar(4) = 'BSTU',
@datet date,
@dtime time,
@i int = 18,
@si smallint,
@ti tinyint,
@num numeric(12,5); 

--� ������� SET
SET @datet = '2022-03-31'
SET	@dtime = '20:20'
SELECT @i = 100, @v = '5'
PRINT @h 
PRINT @v 
PRINT @datet
PRINT @dtime
SELECT @i intv, @si smallintv, @ti tinyintv


---�2

USE UNIVER;
DECLARE @capacity int = (SELECT SUM(AUDITORIUM.AUDITORIUM_CAPACITY) FROM AUDITORIUM),
		@numOfAud int = (SELECT COUNT(*) FROM AUDITORIUM),
		@avgCapac int = (SELECT AVG(AUDITORIUM.AUDITORIUM_CAPACITY) FROM AUDITORIUM),
		@numLessAvg int,
		@proc numeric(8,3);
IF @capacity > 200
begin
	PRINT '������ ����������� ���������: ' + cast(@capacity as varchar(10));
	PRINT '���������� ���������: ' + cast(@numOfAud as varchar(10));
	PRINT '������� ����������� ���������: ' + cast(@avgCapac as varchar(10));
	SET @numLessAVG = (SELECT count(*) 
							FROM AUDITORIUM
							WHERE AUDITORIUM_CAPACITY < @avgCapac)
	PRINT '���������� ���������, ����������� ������� ����� �������: ' + cast(@numLessAVG as varchar(10));
	SET @proc = ((cast(@numLessAvg as numeric(8,3)) *100) / cast(@numOfAud as numeric(8,3)));
	PRINT '������� ���������, ����������� ������� ����� �������: ' + cast(@proc as varchar(10));
end
ELSE IF @capacity = 200 PRINT '����� ��������������� ����� 200'
ELSE IF @capacity < 200 PRINT '����� ��������������� ������ 200'

---�3

PRINT '����� ������������ �����: ' + cast(@@ROWCOUNT as varchar(10))
PRINT '������ SQL Server: ' + cast(@@VERSION as varchar(10))
PRINT '��������� ������������� ��������, ����������� �������� �������� �����������: ' + cast(@@SPID as varchar(10))
PRINT '��� ��������� ������: ' + cast(@@ERROR as varchar(10))
PRINT '��� �������: ' + cast(@@SERVERNAME as varchar(10))
PRINT '���������� ������� ����������� ����������: ' + cast(@@TRANCOUNT as varchar(10));
PRINT '�������� ���������� ���������� ����� ��������������� ������: ' + cast(@@FETCH_STATUS as varchar(10))
PRINT '������� ����������� ������� ���������: ' + cast(@@NESTLEVEL as varchar(10))

---�4

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
				surname nvarchar(10) default '��������',
				name nvarchar(10) default '���������',
				secondname nvarchar(10) default '��������'
			);
INSERT @fullname default values;
SELECT * FROM @fullname;
SET @result = (SELECT CONCAT(surname, ' ', left(name, 1), ' ' , left(secondname, 1)) [���]
					FROM @fullname)

PRINT @result
SELECT @result result
----------------------------------------------
USE UNIVER;
SELECT STUDENT.NAME [��� ��������],
	   STUDENT.BDAY [���� ��������],
	   DATEDIFF(YEAR, STUDENT.BDAY, SYSDATETIME()) AS [���������� ������ ���]
FROM STUDENT 
WHERE MONTH(STUDENT.BDAY) = MONTH(SYSDATETIME()) + 1		--��� �� ������
----------------------------------------------
USE UNIVER;
SELECT STUDENT.NAME [��� ��������],
	   STUDENT.BDAY [���� ��������],
	   DATEDIFF(YEAR, STUDENT.BDAY, SYSDATETIME()) AS [���������� ������ ���]
FROM STUDENT 
WHERE MONTH(STUDENT.BDAY) = MONTH(DATEADD(m, 1, SYSDATETIME()))
----------------------------------------------
DECLARE @testday date
SET @testday = (SELECT PROGRESS.PDATE 
				FROM PROGRESS Inner Join STUDENT ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
				WHERE PROGRESS.SUBJECT in('����') and STUDENT.IDSTUDENT in('1015'))
PRINT '���� ������, � ������� �������� ��������� ������ ������� ������� �� ����: ' + CONVERT (varchar(12), DATEPART(dw, @testday))

---�5

USE UNIVER;
DECLARE @capacity1 int = (select sum(AUDITORIUM.AUDITORIUM_CAPACITY) from AUDITORIUM)
IF (@capacity1 > 100)
begin 
PRINT '��������� ��������������� ��������� ������ 100';
PRINT '��������� ���������������: ' + cast(@capacity1 as varchar(10));
end;
ELSE
begin
PRINT '��������� ��������������� ��������� ������ ��� ����� 100';
PRINT '��������� ���������������: ' + cast(@capacity1 as varchar(10));
end;

---�6

USE UNIVER;
SELECT CASE 
		when (PROGRESS.NOTE = 5) then '����'
		when (PROGRESS.NOTE = 6) then '�����'
		when (PROGRESS.NOTE between 6 and 7) then '����'
		when (PROGRESS.NOTE between 7 and 8) then '������'
		else '������ �������'
		end [������],
		count(*) [���������� �������� � ������ ��������]
		FROM PROGRESS 
		Inner Join STUDENT ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		GROUP BY CASE 
			when (PROGRESS.NOTE = 5) then '����'
			when (PROGRESS.NOTE = 6) then '�����'
			when (PROGRESS.NOTE between 6 and 7) then '����'
			when (PROGRESS.NOTE between 7 and 8) then '������'
			else '������ �������'
			end
		ORDER BY [���������� �������� � ������ ��������]

---�7

CREATE TABLE #TEST 
(
	TIND int, 
	TFIELD varchar(100)
)
--SET nocount on --�� ������� ��������� � ����� ������
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

---�8

go
DECLARE @x int = 1
	print @x+1
	print @x+2
	RETURN
	print @x+3


go
print '�����1'
RETURN
print '�����2'


---�9

declare @x int = 3, @y int = 0, @z int;
begin TRY
	if @y = 0
		raiserror ('������� �� ����!!!!', 10, 1);
	else set @z = @x / @y;
end TRY
begin CATCH 
	print '����� ������ : ' + CAST(ERROR_NUMBER() as varchar(6));
	print '���������    : ' + ERROR_MESSAGE();
	print '����� ������ : ' + CAST(ERROR_LINE() as varchar(8));
	print '���������    : ' + CAST(ERROR_PROCEDURE() as varchar(6));
	print '�������      : ' + CAST(ERROR_SEVERITY() as varchar(6));
	print '����� ������ : ' + CAST(ERROR_STATE() as varchar(8));
end catch