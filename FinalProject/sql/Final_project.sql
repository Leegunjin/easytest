drop table person;
drop table contents;
drop table board;
drop table reply;
drop sequence contents_seq;
drop sequence board_seq;
drop sequence reply_seq;

create table person(
    id varchar2(30) primary key
    ,name varchar2(30) not null
    ,password varchar2(30) not null
    ,email varchar2(30) not null
    ,admin_Flag varchar2(20) not null
    ,grade number default 1
    ,delete_Flag number default 0
    ,delete_Date date
);

create table contents(
    chapterNo number not null
    ,id varchar2(30) not null
    ,pass_Flag number default 0
    ,wrong_Flag number default 0
    ,wrong_Contents varchar2(500)
    ,pass_Date date
);

create sequence contents_seq;

create table board(
    b_num number primary key
    ,b_id varchar2(30) not null
    ,b_title varchar2(200) not null
    ,b_contents varchar2(2000) not null
    ,hits number default 0
    ,b_date date default sysdate
    ,b_uptDate date
    ,hashTag varchar2(200)
    ,warn_Count number default 0
    ,delete_Flag number default 0
    ,delete_Date date
    ,originalFileName varchar2(100)
    ,savedFileName varchar2(100)
);

create sequence board_seq;

create table reply(
    r_num number primary key
    ,b_num number
    ,r_id varchar2(30)
    ,r_contents varchar2(1000)
    ,r_date date default sysdate
    ,r_uptDate date
    ,delete_Flag number default 0
    ,delete_Date date
    ,constraint reply_fk foreign key(b_num) 
    references board(b_num) on delete cascade
);

create sequence reply_seq;