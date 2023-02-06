---№1
USE UNIVER 
exec SP_HELPINDEX'AUDITORIUM_TYPE'
CREATE table #TEST
(
	TIND int,
	TFIELD varchar(100)
);
SET nocount on;
DECLARE @i int = 0;
WHILE @i < 1000
	begin
		INSERT #TEST(TIND, TFIELD)
			values(floor(20000*RAND()),REPLICATE('text',3));
	IF(@i % 100 = 0) PRINT @i;
	SET @i = @i + 1;
	end;

SELECT * FROM #TEST where TIND between 1500 and 2500 order by TIND 

checkpoint;  --фиксация БД
DBCC DROPCLEANBUFFERS;  --очистить буферный кэш

CREATE clustered index #TEST_CL on #TEST(TIND asc)  --создаём кластеризованный индекс

SELECT * FROM #TEST where TIND between 1500 and 2500 order by TIND 


DROP index #TEST_CL ON #TEST
DROP TABLE #TEST

---№2
CREATE table #TEST2
(
	TKEY int,
	CC int identity(1,1),
	TF varchar(100)
);
SET nocount on;
DECLARE @i int = 0;
WHILE @i < 20000
	begin
		INSERT #TEST2(TKEY, TF)
			values(floor(20000*RAND()),REPLICATE('text',3));
	SET @i = @i + 1;
	end;

SELECT count(*)[количество строк] FROM #TEST2;
SELECT * FROM #TEST2

CREATE index #TEST2_NONCLU on #TEST2(TKEY, CC)					

SELECT * from  #TEST2 where  TKEY > 1500 and  CC < 4500;  
SELECT * from  #TEST2 order by  TKEY, CC

SELECT * from  #TEST2 where  TKEY = 556 and  CC > 3			

DROP index #TEST2_NONCLU on #TEST2
DROP TABLE #TEST2

---#3
CREATE table #TEST3
(
	TKEY int,
	CC int identity(1,1),
	TF varchar(100)
);
SET nocount on;
DECLARE @i int = 0;
WHILE @i < 20000
	begin
		INSERT #TEST3(TKEY, TF)
			values(floor(20000*RAND()),REPLICATE('text',3));
	SET @i = @i + 1;
	end;

SELECT CC from #TEST3 where TKEY>15000 
CREATE  index #TEST3_TKEY_X on #TEST3(TKEY) INCLUDE (CC)
SELECT CC from #TEST3 where TKEY>15000 

DROP index #TEST3_TKEY_X on #TEST3
DROP TABLE #TEST3

---#4
CREATE table #TEST4
(
	TKEY int,
	CC int identity(1,1),
	TF varchar(100)
);
SET nocount on;
DECLARE @i int = 0;
WHILE @i < 20000
	begin
		INSERT #TEST4(TKEY, TF)
			values(floor(20000*RAND()),REPLICATE('text',3));
	SET @i = @i + 1;
	end;

SELECT TKEY from  #TEST4 where TKEY between 5000 and 19999; 
SELECT TKEY from  #TEST4 where TKEY>15000 and  TKEY < 20000; 
SELECT TKEY from  #TEST4 where TKEY=17000;

CREATE  index #TEST4_WHERE on #TEST4(TKEY) where (TKEY>=15000 and TKEY < 20000);  

SELECT TKEY from  #TEST4 where TKEY > 5000 and TKEY <19999; 
SELECT TKEY from  #TEST4 where TKEY > 15000 and  TKEY < 20000;  
SELECT TKEY from  #TEST4 where TKEY = 17000;

DROP index #TEST4_WHERE on #TEST4
DROP TABLE #TEST4

---#5
CREATE table #TEST5
(
	TKEY int,
	CC int identity(1,1),
	TF varchar(100)
);
SET nocount on;
DECLARE @i int = 0;
WHILE @i < 20000
	begin
		INSERT #TEST5(TKEY, TF)
			values(floor(20000*RAND()),REPLICATE('text',3));
	SET @i = @i + 1;
	end;

CREATE index #TEST5_TKEY ON #TEST5(TKEY); 

 SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]			--степень фрагментации индекса
        FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), 
        OBJECT_ID(N'#TEST5'), NULL, NULL, NULL) ss
        JOIN sys.indexes ii 
		ON ss.object_id = ii.object_id and ss.index_id = ii.index_id 
		WHERE name is not null;

INSERT top(10000) #TEST5(TKEY, TF) select TKEY, TF from #TEST5;


ALTER index #TEST5_TKEY on #TEST5 reorganize --реорганизация (-фрагм на нижнем)

ALTER index #TEST5_TKEY on #TEST5 rebuild with (online = off) --(меняет ветки местами) проходит через все дерево => фрагм=0


DROP index #TEST5_TKEY on #TEST5
DROP TABLE #TEST5

---#6
CREATE table #TEST6
(
	TKEY int,
	CC int identity(1,1),
	TF varchar(100)
);
SET nocount on;
DECLARE @i int = 0;
WHILE @i < 20000
	begin
		INSERT #TEST6(TKEY, TF)
			values(floor(20000*RAND()),REPLICATE('text',3));
	SET @i = @i + 1;
	end;

CREATE index #TEST6_TKEY on #TEST6(TKEY) with (fillfactor = 65);

INSERT top(50) percent INTO #TEST6(TKEY, TF) 
                       SELECT TKEY, TF  FROM #TEST6;

SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
       FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),    
       OBJECT_ID(N'#EX'), NULL, NULL, NULL) ss  
	   JOIN sys.indexes ii 
       ON ss.object_id = ii.object_id and ss.index_id = ii.index_id  
                                    WHERE name is not null;

