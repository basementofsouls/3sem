----�1
USE UNIVER
DROP PROCEDURE PSUBJECT
go
CREATE PROCEDURE PSUBJECT
as
begin
	declare @k int = (select count (*) from SUBJECT);
	select SUBJECT.SUBJECT [���], SUBJECT.SUBJECT_NAME [����������], SUBJECT.PULPIT [�������] from SUBJECT;
	return @k;	--���������� �������� � ����� ������, ������ ������ ���������� ��������� 
end;
go

declare @k int = 0;
EXEC @k = PSUBJECT;
print '���-�� ��������� = ' + cast(@k as varchar(3));



----�2
USE [UNIVER]
GO

/****** Object:  StoredProcedure [dbo].[PSUBJECT]    Script Date: 19.05.2022 11:07:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
--@p - ��� �������, @c - ���-�� �����
ALTER PROCEDURE [dbo].[PSUBJECT] @p varchar(20) = null, @c int output
as
begin
	declare @k int = (select count (*) from SUBJECT);
	set @c = (select count(*) from SUBJECT where SUBJECT.PULPIT = @p)
	select SUBJECT.SUBJECT [���], SUBJECT.SUBJECT_NAME [����������], SUBJECT.PULPIT [�������] from SUBJECT
																				where SUBJECT.PULPIT = @p;
	return @k;		--���������� �������� � ����� ������, ������ ������ ���������� ��������� 
end;
GO

declare @k int, @rez int = 0
exec @k = PSUBJECT @p = '����', @c = @rez output
print @k
print @rez


----�3
USE UNIVER;
go
CREATE TABLE #SUBJECT
(
	SUBJECT char(10) primary key,
	SUBJECT_NAME varchar(100),
	PULPIT char(20)
)
--------------------------------------------------------
go
--@p - ��� �������, @c - ���-�� �����
ALTER PROCEDURE [dbo].[PSUBJECT] @p varchar(20) = null
as
begin
	declare @k int = (select count (*) from SUBJECT);
	select SUBJECT.SUBJECT [���], SUBJECT.SUBJECT_NAME [����������], SUBJECT.PULPIT [�������] from SUBJECT
																				where SUBJECT.PULPIT = @p;
end;
go
-------------------------------------------------------
INSERT #SUBJECT exec PSUBJECT @p = '����'

SELECT * FROM #SUBJECT
DROP TABLE #SUBJECT



----�4
USE UNIVER
DROP PROCEDURE PAUDITORIUM_INSERT

go
CREATE PROCEDURE PAUDITORIUM_INSERT @a char(20), @n varchar(50), @c int = 0, @t char(10)
as 
begin try
	insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
		values(@a, @n, @c, @t)
	return 1
end try
begin catch
	print '����� ������: ' + cast (error_number() as varchar(6));
	print '���������:    ' + error_message();
	print '�������:      ' + cast (error_severity() as varchar(6));
	print '�����:        ' + cast (error_state() as varchar(8));
	print '����� ������: ' + cast (error_line() as varchar(8));
	if ERROR_PROCEDURE() is not null
	print '��� ���������: ' + cast (error_procedure() as varchar(8)); 
		return -1
end catch
go


------------------------------------------------------------------------
declare @rez int;


begin tran

exec @rez = PAUDITORIUM_INSERT @a= '207-1', @n = '207-1', @c = 15, @t = '��-�'
print @rez
if @rez = 1
	select * from AUDITORIUM

rollback


-------------------------------------------------------------------------
declare @rez int;


begin tran

exec @rez = PAUDITORIUM_INSERT @a= '206-1', @n = '207-1', @c = 15, @t = '��-�'
print @rez
if @rez = 1
	select * from AUDITORIUM

rollback


----�5
USE UNIVER
DROP PROCEDURE SUBJECT_REPORT

go
CREATE PROCEDURE SUBJECT_REPORT @p char(10)
as declare @rc int = 0
begin try
	declare @subjectName nvarchar(15), @subjectline nvarchar(150) = ''
	
	declare Subj CURSOR for
	select SUBJECT.SUBJECT from SUBJECT
									where SUBJECT.PULPIT = @p;
	
	if not exists(select SUBJECT.SUBJECT from SUBJECT
												where SUBJECT.PULPIT = @p)
		begin
			raiserror('������ � ����������', 11, 1)
			return 0
		end
	else
		open Subj;
		fetch Subj into @subjectName;
		print '���������� � ���������� �������';
		while @@FETCH_STATUS = 0
			begin
				set @subjectline = rtrim(@subjectName) + ', ' + @subjectline;
				set @rc = @rc + 1;
				fetch Subj into @subjectName;
			end;
			print @subjectline;
			close Subj;
			return @rc;
end try
begin catch
	print '������ � ����������'
	if ERROR_PROCEDURE() is not null
		print '��� ���������: ' + cast (error_procedure() as varchar(8)); 
		return @rc;
end catch;
go
------------------------------------------------------------------------------

declare @rc int;
exec @rc = SUBJECT_REPORT @p = '����';
print '���������� ��������� = ' + cast(@rc as varchar(3));


----�6
USE UNIVER
----��������� ������ � ������� AUDITORIUM � � AUDITORIUM_TYPENAME

DROP PROCEDURE PAUDITORIUM_INSERTX

go
CREATE PROCEDURE PAUDITORIUM_INSERTX @a char(20), 
									 @n varchar(50), 
									 @c int = 0, 
									 @t char(10), 
									 @tn varchar(50) --AUDITORIUM_TYPE.AUDITORIUM_TYPENAME 
as 
begin try
	declare @rc int = 1;
	set transaction isolation level SERIALIZABLE;
		begin tran
		insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
			values (@t, @tn)
		exec @rc = PAUDITORIUM_INSERT @a, @n, @c, @t;
		commit tran;
	return @rc;
end try
begin catch
	print '����� ������: ' + cast (error_number() as varchar(6));
	print '���������:    ' + error_message();
	print '�������:      ' + cast (error_severity() as varchar(6));
	print '�����:        ' + cast (error_state() as varchar(8));
	print '����� ������: ' + cast (error_line() as varchar(8));
	if ERROR_PROCEDURE() is not null
	print '��� ���������: ' + cast (error_procedure() as varchar(8)); 
	if @@TRANCOUNT > 0 rollback tran;
	return -1;
end catch;
go
--------------------------------------------------

declare @rc int;

begin tran
exec @rc = PAUDITORIUM_INSERTX @a= '208-1', @n = '208-1', @c = 15, @t = '��2', @tn = '��� ��������� 2'
print @rc
if @rc = 1
	select * from AUDITORIUM
	select * from AUDITORIUM_TYPE
rollback
go 
