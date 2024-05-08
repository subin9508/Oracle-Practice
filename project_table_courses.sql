create table courses
(coursenumber number not null,
coursetitle varchar2(10) not null,
teacher varchar2(10) not null,
classroom varchar2(10) not null,
constraint courses_pk primary key (coursetitle)
);

create sequence courses_seq
INCREMENT by 1
start WITH 1
MINVALUE 1
MAXVALUE 1000;

insert into courses values (courses_seq.nextval,'�ѱ���', '����ȭ', '100ȣ');
select * from courses;
insert into courses values (courses_seq.nextval,'���ǻ�', '������', '101ȣ');
insert into courses values (courses_seq.nextval, '�̼���', '�����', '102ȣ');
insert into courses values (courses_seq.nextval, 'ü����', '���̼�', '103ȣ');
insert into courses values (courses_seq.nextval, '��ȸ��', '������', '104ȣ');
insert into courses values (courses_seq.nextval, '������', '�����', '105ȣ');
insert into courses values (courses_seq.nextval, '������', '����â', '106ȣ');
insert into courses values (courses_seq.nextval, '�濵��', '������', '107ȣ');
insert into courses values (courses_seq.nextval, '�����', '������', '108ȣ');
insert into courses values (courses_seq.nextval, '��ȭ��', '�̾���', '109ȣ');
insert into courses values (courses_seq.nextval, '������', '�����', '110ȣ');
insert into courses values (courses_seq.nextval, '������', '���¿�', '111ȣ');
insert into courses values (courses_seq.nextval, '������', '������', '112ȣ');
insert into courses values (courses_seq.nextval, '�߹���', '��浿', '113ȣ');

commit;