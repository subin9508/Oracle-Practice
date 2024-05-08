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

insert into courses values ('한국사', '강석화', '100호');
insert into courses values ('음악사', '이정빈', '101호');
insert into courses values ('미술사', '김재운', '102호');
insert into courses values ('체육학', '강미선', '103호');
insert into courses values ('사회학', '송현순', '104호');
insert into courses values ('영문학', '김수진', '105호');
insert into courses values ('교육학', '성민창', '106호');
insert into courses values ('경영학', '김진석', '107호');
insert into courses values ('세계사', '정혜온', '108호');
insert into courses values ('문화사', '이아현', '109호');
insert into courses values ('경제학', '김수정', '110호');
insert into courses values ('행정학', '강태웅', '111호');
insert into courses values ('영상학', '이현선', '112호');

delete from courses;
commit;

