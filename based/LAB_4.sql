create table AUDITORIUM_TYPE 
(    AUDITORIUM_TYPE  char(10) constraint AUDITORIUM_TYPE_PK  primary key,  
      AUDITORIUM_TYPENAME  varchar(30)       
 )
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )        values ('��',            '����������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )         values ('��-�',          '������������ �����');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME )         values ('��-�',          '���������� � ���. ����������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )          values  ('��-X',          '���������� �����������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME )        values  ('��-��',   '����. ������������ �����');


  create table AUDITORIUM 
(   AUDITORIUM   char(20)  constraint AUDITORIUM_PK  primary key,              
    AUDITORIUM_TYPE     char(10) constraint  AUDITORIUM_AUDITORIUM_TYPE_FK foreign key         
                      references AUDITORIUM_TYPE(AUDITORIUM_TYPE), 
   AUDITORIUM_CAPACITY  integer constraint  AUDITORIUM_CAPACITY_CHECK default 1  check (AUDITORIUM_CAPACITY between 1 and 300),  -- ����������� 
   AUDITORIUM_NAME      varchar(50)                                     
)
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME,  
 AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
values  ('206-1', '206-1','��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) 
values  ('301-1',   '301-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )   
values  ('236-1',   '236-1', '��',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )  
values  ('313-1',   '313-1', '��-�',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )  
values  ('324-1',   '324-1', '��-�',   50);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )   
 values  ('413-1',   '413-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY ) 
values  ('423-1',   '423-1', '��-�', 90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )     
values  ('408-2',   '408-2', '��',  90);

  ------�������� � ���������� ������� FACULTY
  create table FACULTY
  (    FACULTY      char(10)   constraint  FACULTY_PK primary key,
       FACULTY_NAME  varchar(50) default '???'
  );
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('����',   '���������� ���������� � �������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '����������������� ���������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '���������-������������� ���������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('����',    '���������� � ������� ������ ��������������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '���������� ������������ �������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('��',     '��������� �������������� ����������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('����',     '������������ ���� � ���������������');
------�������� � ���������� ������� PROFESSION
   create table PROFESSION
  (   PROFESSION   char(20) constraint PROFESSION_PK  primary key,
       FACULTY    char(10) constraint PROFESSION_FACULTY_FK foreign key 
                            references FACULTY(FACULTY),
       PROFESSION_NAME varchar(100),    QUALIFICATION   varchar(50)  
  );  
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)    values    ('��',  '1-40 01 02',   '�������������� ������� � �����-�����', '�������-�����������-�������������' );
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)    values    ('��',  '1-47 01 01', '������������ ����', '��������-��������' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)    values    ('��',  '1-36 06 01',  '��������������� ������������ � ������� ��������� ����������', '�������-��������������' );                     
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)  values    ('����',  '1-36 01 08',    '��������������� � ������������ ������� �� �������������� ����������', '�������-�������' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)      values    ('����',  '1-36 07 01',  '������ � �������� ���������� ����������� � ����������� ������������ ����������', '�������-�������' );
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)  values    ('���',  '1-75 01 01',      '������ ���������', '������� ���-���� ���������' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)   values    ('���',  '1-75 02 01',   '������-�������� �������������', '������� ������-��������� �������������' );
 insert into PROFESSION(FACULTY, PROFESSION,     PROFESSION_NAME, QUALIFICATION)   values    ('���',  '1-89 02 02',     '������ � ���������������-���', '���������� � ����� �������' );
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)  values    ('���',  '1-25 01 07',  '��������� � ���������� �� ����-�������', '���������-��������' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)      values    ('���',  '1-25 01 08',    '������������� ����, ������ � �����', '���������' );                      
 insert into PROFESSION(FACULTY, PROFESSION,     PROFESSION_NAME, QUALIFICATION)  values    ('����',  '1-36 05 01',   '������ � ������������ ������� ���������', '�������-�������' );
 insert into PROFESSION(FACULTY, PROFESSION,   PROFESSION_NAME, QUALIFICATION)   values    ('����',  '1-46 01 01',      '�������������� ����', '�������-��������' );
 insert into PROFESSION(FACULTY, PROFESSION,     PROFESSION_NAME, QUALIFICATION)      values    ('���',  '1-48 01 02',  '���������� ���������� ��-���������� �������, ���������� � �������', '�������-�����-��������' );                
 insert into PROFESSION(FACULTY, PROFESSION,   PROFESSION_NAME, QUALIFICATION)    values    ('���',  '1-48 01 05',    '���������� ���������� ��-��������� ���������', '�������-�����-��������' ); 
 insert into PROFESSION(FACULTY, PROFESSION,    PROFESSION_NAME, QUALIFICATION)  values    ('���',  '1-54 01 03',   '������-���������� ������ � ������� �������� �������� ���������', '������� �� ������������' ); 

------�������� � ���������� ������� PULPIT
  create table  PULPIT 
(   PULPIT   char(20)  constraint PULPIT_PK  primary key,
    PULPIT_NAME  varchar(100), 
    FACULTY   char(10)   constraint PULPIT_FACULTY_FK foreign key 
                         references FACULTY(FACULTY) 
);  
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY )
  values  ('����', '�������������� ������ � ���������� ','��'  )
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
    values  ('��', '�����������','���')          
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('��', '��������������','���')           
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
  values  ('�����', '���������� � ����������������','���')                
insert into PULPIT   (PULPIT,  PULPIT_NAME, FACULTY)
   values  ('����', '������ ������� � ������������','���') 
insert into PULPIT   (PULPIT,  PULPIT_NAME, FACULTY)
   values  ('���', '������� � ������������������','���')              
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('������','������������ �������������� � ������-��������� �����-��������','���')          
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('��', '���������� ����', '����')                          
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('�����','������ ����� � ���������� �������������','����')  
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('���','���������� �������������������� �����������', '����')   
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
values  ('�����','���������� � ������� ������� �� ���������','����')    
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
values  ('��', '������������ �����','���') 
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
 values  ('���','���������� ����������� ���������','���')             
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
 values  ('�������','���������� �������������� ������� � ����� ���������� ���������� ','����') 
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
    values  ('�����','��������� � ��������� ���������� �����������','����')                                               
insert into PULPIT   (PULPIT,    PULPIT_NAME, FACULTY)
values  ('����',    '������������� ������ � ����������','���')   
insert into PULPIT   (PULPIT,    PULPIT_NAME, FACULTY)
  values  ('����',   '����������� � ��������� ������������������','���')   
insert into PULPIT   (PULPIT,    PULPIT_NAME, FACULTY)
   values  ('������', '����������, �������������� �����, ������� � ������', '���')     
------�������� � ���������� ������� SUBJECT
create table SUBJECT
    (     SUBJECT  char(10) constraint SUBJECT_PK  primary key, 
           SUBJECT_NAME varchar(100) unique,
           PULPIT  char(20) constraint SUBJECT_PULPIT_FK foreign key 
                         references PULPIT(PULPIT)   
     )
 insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT )
                       values ('����',   '������� ���������� ������ ������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,  PULPIT)
                       values ('��',     '���� ������','����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,  PULPIT )
                       values ('���',    '�������������� ����������','����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,  PULPIT )
                       values ('����',  '������ �������������� � ����������������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,  PULPIT )
                       values ('��',     '������������� ������ � ������������ ��������', '��-��');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,  PULPIT )
                       values ('���',    '���������������� ������� ����������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,  PULPIT )
                       values ('����',  '������������� ������ ��������� ����������', '��-��');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,  PULPIT )
                       values ('���',     '�������������� �������������� ������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,  PULPIT )
                       values ('��',      '������������ ��������� ','����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,  PULPIT )
           values ('�����',   '��������. ������, �������� � �������� �����', '��-����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,  PULPIT )
                       values ('���',     '������������ �������������� �������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT )
                       values ('���',     '����������� ��������. ������������', '������');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT)
                       values ('��',   '���������� ����������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,PULPIT )
                      values ('��',   '�������������� ����������������','����');  
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT )
               values ('����', '���������� ������ ���',  '����');                   
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,PULPIT )
               values ('���',  '��������-��������������� ����������������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT )
                       values ('��', '��������� ������������������','����')
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT )
                       values ('��', '������������� ������','����')
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT )
                       values ('������OO','�������� ������ ������ � ���� � ���. ������.','��')
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT )
                       values ('�������','������ ������-��������� � ������������� �����-����',  '������')
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,PULPIT )
                       values ('��', '���������� �������� ','��')
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,PULPIT )
                       values ('��',    '�����������', '�����') 
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT )
                       values ('��',    '������������ �����', '��')   
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,PULPIT )
                       values ('���',    '���������� ��������� �������','��������') 
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT )
                       values ('���',    '������ ��������� ����','��')
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,PULPIT )
                       values ('����',   '���������� � ������������ �������������', '�����') 
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,PULPIT )
                       values ('����',   '���������� ���������� �������� ���������� ','�������')
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT )
                       values ('���',    '���������� ������������','��������')                                                                                                                                                           

 create table TEACHER
 (   TEACHER    char(10)  constraint TEACHER_PK  primary key,
     TEACHER_NAME  varchar(100), 
     GENDER     char(1) CHECK (GENDER in ('�', '�')),
     PULPIT   char(20) constraint TEACHER_PULPIT_FK foreign key 
                         references PULPIT(PULPIT) 
 );
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT )
                       values  ('����',    '������ �������� �������������', '�',  '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('�����',    '�������� ��������� ��������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('�����',    '���������� ������� ����������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('�����',    '�������� ������ ��������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',     '����� ��������� ����������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',     '��������� ����� ��������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                      values  ('���',     '����� ������� ��������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',     '����� ������� �������������',  '�', '����');                     
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',     '����� ����� �������������',  '�',   '����');                                                                                           
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
             values  ('������',   '���������� ��������� �������������', '�','������');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',     '��������� ������� �����������', '�', '������');                       
insert into  TEACHER    (TEACHER,  TEACHER_NAME,GENDER, PULPIT )
                       values  ('������',   '����������� ��������� ��������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('����',   '������� ��������� ����������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('����',   '������ ������ ��������', '�', '��');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('����', '������� ������ ����������',  '�',  '������');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',     '���������� ������� ��������', '�', '������');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',   '������ ������ ���������� ', '�', '��');                      
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('�����',   '��������� �������� ���������', '�', '�����'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('������',   '���������� �������� ����������', '�', '��'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('�����',   '�������� ������ ����������', '�', '��'); 
  
------�������� � ���������� ������� GROUPS
create table GROUPS 
(   IDGROUP  integer  identity(1,1) constraint GROUP_PK  primary key,              
    FACULTY   char(10) constraint  GROUPS_FACULTY_FK foreign key         
                                                         references FACULTY(FACULTY), 
     PROFESSION  char(20) constraint  GROUPS_PROFESSION_FK foreign key         
                                                         references PROFESSION(PROFESSION),
    YEAR_FIRST  smallint  check (YEAR_FIRST<=YEAR(GETDATE())),                  
  )
insert into GROUPS   (FACULTY,  PROFESSION, YEAR_FIRST )
         values ('����','1-40 01 02', 2013), --1
                ('����','1-40 01 02', 2012),
                ('����','1-40 01 02', 2011),
                ('����','1-40 01 02', 2010),
                ('����','1-47 01 01', 2013),---5 ��
                ('����','1-47 01 01', 2012),
                ('����','1-47 01 01', 2011),
                ('����','1-36 06 01', 2010),-----8 ��
                ('����','1-36 06 01', 2013),
                ('����','1-36 06 01', 2012),
                ('����','1-36 06 01', 2011),
                ('����','1-36 01 08', 2013),---12 ��                                                  
                ('����','1-36 01 08', 2012),
                ('����','1-36 07 01', 2011),
                ('����','1-36 07 01', 2010),
                ('���','1-48 01 02', 2012), ---16 �� 
                ('���','1-48 01 02', 2011),
                ('���','1-48 01 05', 2013),
                ('���','1-54 01 03', 2012),
                ('���','1-75 01 01', 2013),--20 ��      
                ('���','1-75 02 01', 2012),
                ('���','1-75 02 01', 2011),
                ('���','1-89 02 02', 2012),
                ('���','1-89 02 02', 2011),  
                ('����','1-36 05 01', 2013),
                ('����','1-36 05 01', 2012),
                ('����','1-46 01 01', 2012),--27 ��
                ('���','1-25 01 07', 2013), 
                ('���','1-25 01 07', 2012),     
                ('���','1-25 01 07', 2010),
                ('���','1-25 01 08', 2013),
                ('���','1-25 01 08', 2012) ---32 ��       
                          
------�������� � ���������� ������� STUDENT
create table STUDENT 
(    IDSTUDENT   integer  identity(1000,1) constraint STUDENT_PK  primary key,
      IDGROUP   integer  constraint STUDENT_GROUP_FK foreign key         
                      references GROUPS(IDGROUP),        
      NAME   nvarchar(100), 
      BDAY   date,

 ) 
insert into STUDENT (IDGROUP, NAME, BDAY)
    values (5, '����� ������� ��������',         '12.07.1994'),
           (5, '������� �������� ����������',    '06.03.1994'),
           (5, '�������� ����� �����������',     '09.11.1994'),
           (5, '������� ����� ���������',        '04.10.1994'),
           (5, '��������� ��������� ����������', '08.01.1994'),
           (6, '������� ������ ���������',       '02.08.1993'),
           (6, '������� ��� ����������',         '07.12.1993'),
           (6, '������� ����� �����������',      '02.12.1993'),
           (7, '������� ������ �����������',     '08.03.1992'),
           (7, '������� ����� �������������',    '02.06.1992'),
           (7, '�������� ����� �����������',     '11.12.1992'),
           (7, '�������� ������� �������������', '11.05.1992'),
           (7, '����������� ������� ��������',   '09.11.1992'),
           (7, '�������� ������� ����������',    '01.11.1992'),
           (8, '�������� ����� ������������',    '08.07.1995'),
           (8, '������ ������� ����������',      '02.11.1995'),
           (8, '������ ��������� �����������',   '07.05.1995'),
           (8, '����� ��������� ���������',      '04.08.1995'),
           (9, '���������� ����� ����������',    '08.11.1994'),
           (9, '�������� ������ ��������',       '02.03.1994'),
           (9, '���������� ����� ����������',    '04.06.1994'),
           (9, '��������� ���������� ���������', '09.11.1994'),
           (9, '����� ��������� �������',        '04.07.1994'),
           (9, '����������� ����� ������������', '03.01.1993'),
           (9, '������� ���� ��������',          '12.09.1993'),
           (9, '��������� ������ ��������',      '12.06.1993'),
           (9, '���������� ��������� ����������','09.02.1993'),
           (9, '������� ������ ���������',       '04.07.1993'),
           (10, '������ ������� ���������',       '08.01.1992'),
           (10, '��������� ����� ����������',     '12.05.1992'),
           (10, '�������� ����� ����������',      '08.11.1992'),
           (10, '������� ������� ���������',      '12.03.1992'),
           (11, '�������� ����� �������������',   '10.08.1995'),
           (11, '���������� ������ ��������',     '02.05.1995'),
           (11, '������ ������� �������������',   '08.01.1995'),
           (11, '��������� ��������� ��������',   '11.09.1995'),
           (12, '������ ������� ������������',   '08.01.1994'),
           (12, '������ ������ ����������',      '11.09.1994'),
           (12, '����� ���� �������������',      '06.04.1994'),
           (12, '������� ������ ����������',     '12.08.1994')
insert into STUDENT (IDGROUP,NAME, BDAY)
    values (13, '��������� ��������� ����������','07.11.1993'),
           (13, '������ ������� ����������',     '04.06.1993'),
           (13, '������� ����� ����������',      '10.12.1993'),
           (13, '������� ������ ����������',     '04.07.1993'),
           (14, '������� ����� ���������',       '08.01.1993'),
           (13, '����� ������� ����������',      '02.09.1993'),
           (13, '���� ������ �����������',       '11.12.1995'),
           (13, '������� ���� �������������',    '10.06.1995'),
           (14, '��������� ���� ���������',      '09.08.1995'),
           (14, '����� ����� ���������',         '04.07.1995'),
           (14, '��������� ������ ����������',   '08.03.1995'),
           (14, '����� ����� ��������',          '12.09.1995'),
           (15, '������ ����� ������������',     '08.10.1994'),
           (15, '���������� ����� ����������',   '10.02.1994'),
           (15, '�������� ������� �������������','11.11.1994'),
           (15, '���������� ����� ����������',   '10.02.1994'),
           (15, '����������� ����� ��������',    '12.01.1994'),
           (16, '�������� ������� �������������','11.09.1993'),
           (16, '������ �������� ����������',    '01.12.1993'),
           (16, '���� ������� ����������',       '09.06.1993'),
           (16, '�������� ���������� ����������','05.01.1993'),
           (16, '����������� ����� ����������',  '01.07.1993'),
           (17, '������� ��������� ���������',   '07.04.1992'),
           (17, '������ �������� ���������',     '10.12.1992'),
           (17, '��������� ����� ����������',    '05.05.1992'),
           (17, '���������� ����� ������������', '11.01.1992'),
           (17, '�������� ����� ����������',     '04.06.1992'),
           (18, '����� ����� ����������',        '08.01.1994'),
           (18, '��������� ��������� ���������', '07.02.1994'),
           (18, '������ ������ �����������',     '12.06.1994'),
           (18, '������� ����� ��������',        '03.07.1994'),
           (18, '������ ������ ���������',       '04.07.1994'),
           (19, '������� ��������� ����������',  '08.11.1993'),
           (19, '������ ����� ����������',       '02.04.1993'),
           (19, '������ ���� ��������',          '03.06.1993'),
           (19, '������� ������ ���������',      '05.11.1993'),
           (19, '������ ������ �������������',   '03.07.1993'),
           (20, '��������� ����� ��������',      '08.01.1995'),
           (20, '���������� ��������� ���������','06.09.1995'),
           (20, '�������� ��������� ����������', '08.03.1995'),
           (20, '��������� ����� ��������',      '07.08.1995')

------�������� � ���������� ������� PROGRESS
create table PROGRESS
 (  SUBJECT   char(10) constraint PROGRESS_SUBJECT_FK foreign key
                      references SUBJECT(SUBJECT),                
     IDSTUDENT integer  constraint PROGRESS_IDSTUDENT_FK foreign key         
                      references STUDENT(IDSTUDENT),        
     PDATE    date, 
     NOTE     integer check (NOTE between 1 and 10)
  )
insert into PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE)
    values  ('����', 1009,  '01.10.2013',8),
           ('����', 1010,  '01.10.2013',7),
           ('����', 1011,  '01.10.2013',5),
           ('����', 1013,  '01.10.2013',4)
insert into PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE)
    values   ('����', 1014,  '01.12.2013',5),
           ('����', 1015,  '01.12.2013',9),
           ('����', 1016,  '01.12.2013',5),
           ('����', 1017,  '01.12.2013',4)
insert into PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE)
    values ('��',   1018,  '06.5.2013',4),
           ('��',   1019,  '06.05.2013',7),
           ('��',   1020,  '06.05.2013',7),
           ('��',   1021,  '06.05.2013',9),
           ('��',   1022,  '06.05.2013',5),
           ('��',   1023,  '06.05.2013',6)


---������� 1
SELECT AUDITORIUM, AUDITORIUM_TYPENAME
From AUDITORIUM Inner Join AUDITORIUM_TYPE
On AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE

---������� 2
SELECT AUDITORIUM, AUDITORIUM_TYPENAME
From AUDITORIUM Inner Join AUDITORIUM_TYPE
On AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE and
									AUDITORIUM_TYPE.AUDITORIUM_TYPENAME like '%���������%'
---������� 3
SELECT AUDITORIUM, AUDITORIUM_TYPENAME
From AUDITORIUM, AUDITORIUM_TYPE
Where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE

SELECT AUDITORIUM, AUDITORIUM_TYPENAME
From AUDITORIUM, AUDITORIUM_TYPE
Where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE and
									AUDITORIUM_TYPE.AUDITORIUM_TYPENAME like '%���������%'

---������� 4
SELECT  FACULTY.FACULTY[���������], PULPIT.PULPIT[�������], STUDENT.NAME[��� ��������], GROUPS.PROFESSION[�������������], SUBJECT.SUBJECT[����������],
		CASE 
		when (PROGRESS.NOTE = 6) then '�����'
		when (PROGRESS.NOTE between 6 and 7) then '����'
		when (PROGRESS.NOTE between 7 and 8) then '������'
		else '������ �������'
		end [������]
		FROM PROGRESS 
		Inner Join STUDENT ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		Inner Join GROUPS ON STUDENT.IDGROUP = GROUPS.IDGROUP
		Inner Join SUBJECT ON PROGRESS.SUBJECT = SUBJECT.SUBJECT
		Inner Join FACULTY ON GROUPS.FACULTY = FACULTY.FACULTY
		Inner Join PULPIT ON SUBJECT.PULPIT = PULPIT.PULPIT
			ORDER BY PROGRESS.NOTE desc, FACULTY.FACULTY asc, PULPIT.PULPIT asc, GROUPS.PROFESSION asc, STUDENT.NAME asc

---������� 5
SELECT  FACULTY.FACULTY[���������], PULPIT.PULPIT[�������], STUDENT.NAME[��� ��������], GROUPS.PROFESSION[�������������], SUBJECT.SUBJECT[����������],
		CASE 
		when (PROGRESS.NOTE = 6) then '�����'
		when (PROGRESS.NOTE between 6 and 7) then '����'
		when (PROGRESS.NOTE between 7 and 8) then '������'
		else '������ �������'
		end [������]
		FROM PROGRESS 
		Inner Join STUDENT ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		Inner Join GROUPS ON STUDENT.IDGROUP = GROUPS.IDGROUP
		Inner Join SUBJECT ON PROGRESS.SUBJECT = SUBJECT.SUBJECT
		Inner Join FACULTY ON GROUPS.FACULTY = FACULTY.FACULTY
		Inner Join PULPIT ON SUBJECT.PULPIT = PULPIT.PULPIT
			ORDER BY 
			(CASE
					when (PROGRESS.NOTE between 6 and 7) then 1
					when (PROGRESS.NOTE between 7 and 8) then 2
					when (PROGRESS.NOTE = 6) then 3
					else 4
				end
			)
---������� 6
SELECT PULPIT.PULPIT_NAME[�������], isnull (TEACHER.TEACHER_NAME, '***')[�������������]
	FROM PULPIT Left Outer Join TEACHER
		ON PULPIT.PULPIT = TEACHER.PULPIT

---������� 7
SELECT PULPIT.PULPIT_NAME[�������], isnull (TEACHER.TEACHER_NAME, '***')[�������������]
	FROM TEACHER Left Outer Join PULPIT
		ON PULPIT.PULPIT = TEACHER.PULPIT

--����������� ���������, �� ����������� ���������� ������ RIGHT OUTER JOIN
SELECT PULPIT.PULPIT_NAME[�������], isnull (TEACHER.TEACHER_NAME, '***')[�������������]
	FROM PULPIT Right Outer Join TEACHER
		ON PULPIT.PULPIT = TEACHER.PULPIT

---������� 8
USE �������;

SELECT * 
	FROM ������ a Inner Join ������ b
	ON a.������������_������ = b.������������
	ORDER BY a.������������_������, b.������������
SELECT * 
	FROM ������ a FULL Outer Join ������ b
	ON a.������������_������ = b.������������
	ORDER BY a.������������_������, b.������������
SELECT * 
	FROM ������ b FULL Outer Join ������ a
	ON a.������������_������ = b.������������
	ORDER BY a.������������_������, b.������������
SELECT * 
	FROM ������ b Right Outer Join ������ a
	ON a.������������_������ = b.������������
	ORDER BY a.������������_������, b.������������
SELECT * 
	FROM ������ b Left Outer Join ������ a
	ON a.������������_������ = b.������������
	ORDER BY a.������������_������, b.������������


SELECT * 
	FROM ������ a FULL Outer Join ������ b
	ON b.������������_������ = a.������������
	ORDER BY b.������������_������, a.������������

-- ������, ��������� �������� �������� ������ ����� (� �������� FULL OUTER JOIN) ������� � �� �������� ������ ������; 
SELECT *
	FROM ������ a Left Outer Join ������ b
	ON a.������������ = b.������������_������
	WHERE b.������������_������ IS NULL

-- ������, ��������� �������� �������� ������ ������ ������� � �� ���������� ������ �����; 
SELECT *
	FROM ������ a Right Outer Join ������ b
	ON a.������������ = b.������������_������
	WHERE a.������������ IS NULL AND b.������������_������ IS NOT NULL

-- ������, ��������� �������� �������� ������ ������ ������� � ����� ������;
SELECT * 
	FROM ������ a FULL Outer Join ������ b
	ON b.������������_������ = a.������������
	WHERE a.������������ IS NULL OR b.������������_������ IS NULL

---������� 9
SELECT AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
		FROM AUDITORIUM Cross Join AUDITORIUM_TYPE
		WHERE AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE;


---������� 10
USE S_MyBase;
SELECT * 
	FROM ���������� a FULL Outer Join ������ b
	ON a.ID = b.��������

SELECT * 
	FROM ���������� a FULL Outer Join ������ b
	ON a.ID = b.��������
	WHERE a.ID IS NULL OR b.������������_������ IS NULL

SELECT * 
	FROM ���������� a Inner Join ������ b
	ON a.ID = b.��������

SELECT * 
	FROM ���������� a Left Outer Join ������ b
	ON a.ID = b.��������

SELECT * 
	FROM ���������� a Left Outer Join ������ b
	ON a.ID = b.��������
	WHERE b.������������_������ IS NULL

SELECT * 
	FROM ���������� a Right Outer Join ������ b
	ON a.ID = b.��������

SELECT * 
	FROM ���������� a Right Outer Join ������ b
	ON a.ID = b.��������
	WHERE a.ID IS NULL