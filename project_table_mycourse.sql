create table Mycourses
(id varchar2(10) not null,
name varchar2(10) not null,
coursetitle varchar2(10) not null,
coursenumber number(6),
teacher varchar2(10) not null,
classroom varchar2(10) not null,
constraint Mycourses_pk primary key (coursenumber)
);
select * from Mycourses;


insert into Mycourses values ('123456', 'ȫ�浿', '�ѱ���', '0', '����ȭ', '100ȣ');
commit;