create sequence courses_seq
INCREMENT by 1
start WITH 1
MINVALUE 1
MAXVALUE 1000;




create table courses
(coursenumber number not null,
coursetitle varchar2(10) not null,
teacher varchar2(10) not null,
classroom varchar2(10) not null,
constraint courses_pk primary key (coursetitle)
);
select * from courses;

insert into courses values ('�ѱ���', '����ȭ', '100ȣ');
insert into courses values ('���ǻ�', '������', '101ȣ');
insert into courses values ('�̼���', '�����', '102ȣ');
insert into courses values ('ü����', '���̼�', '103ȣ');
insert into courses values ('��ȸ��', '������', '104ȣ');
insert into courses values ('������', '�����', '105ȣ');
insert into courses values ('������', '����â', '106ȣ');
insert into courses values ('�濵��', '������', '107ȣ');
insert into courses values ('�����', '������', '108ȣ');
insert into courses values ('��ȭ��', '�̾���', '109ȣ');
insert into courses values ('������', '�����', '110ȣ');
insert into courses values ('������', '���¿�', '111ȣ');
insert into courses values ('������', '������', '112ȣ');

delete from courses;
commit;

