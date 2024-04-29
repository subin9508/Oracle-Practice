create table blogs (
    id      number(6) generated always as identity,
    title   varchar2(100 char) not null,
    content varchar2(1000 char) not null,
    writer  varchar2(100 char) not null,
    created_time    timestamp default systimestamp,
    modified_time   timestamp default systimestamp,
    constraint blogs_pk primary key (id)
);

insert into blogs (title, content, writer)
values ('test', '두번째 블로그 테스트', 'guest');

select * from blogs order by id;
commit;