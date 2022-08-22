-- auto-generated definition
create table user
(
    u_id      varchar(20)            not null
        primary key,
    u_pw      varchar(20)            not null,
    u_name    varchar(20)            null,
    u_email   varchar(50)            null,
    zip_code  varchar(7)             null,
    u_address varchar(100)           null,
    u_phone   varchar(15)            null,
    u_useyn   char default '1'       null,
    u_regdate date default curdate() null
);

