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


insert into Mycourses values ('123456', '홍길동', '한국사', '0', '강석화', '100호');
commit;