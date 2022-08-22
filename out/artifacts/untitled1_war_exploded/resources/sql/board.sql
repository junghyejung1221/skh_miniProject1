create table board
(
    num        int auto_increment
        primary key,
    u_id       varchar(20)            not null,
    u_name     varchar(20)            not null,
    subject    varchar(100)           not null,
    content    text                   not null,
    regist_day date default curdate() null,
    hit        int  default 0         null,
    ip         varchar(50)            not null
);

