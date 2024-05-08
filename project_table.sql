create table courseregistrations
(usernumber number not null,
id varchar2(10) not null,
name varchar2(10) not null,
password varchar2(15) not null,
phone varchar2(13),
email varchar2(25),
constraint courseregistrations_pk primary key (id)
);

create sequence courseregistrations_seq
INCREMENT by 1
start WITH 1
MINVALUE 1
MAXVALUE 1000;

insert into courseregistrations values(courseregistrations_seq.nextval,
'123456', 'ȫ�浿', '1234', '010-1234-5678', 'hgd@itwill.com');
commit;



 