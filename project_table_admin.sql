create table admin
(id varchar2(10) not null,
password varchar2(15) not null,
constraint admin_pk primary key (id)
);
select * from admin;

insert into admin values (999999, 1010);
insert into admin values (777777, 1011);