-- auto-generated definition
create table admin
(
    id             int         not null
        primary key,
    admin_name     varchar(36) null,
    admin_password varchar(36) null,
    constraint admin_id_uindex
        unique (id)
);

-- auto-generated definition
create table book
(
    isbn   int         not null
        primary key,
    name   varchar(36) null,
    price  float       null,
    num    int         null,
    writer varchar(36) null,
    constraint book_isbn_uindex
        unique (isbn)
);

-- auto-generated definition
create table history_book
(
    reader_id int         not null,
    name      varchar(36) null,
    price     float       null,
    num       int         null,
    writer    varchar(36) null,
    time      varchar(36) null,
    isbn      int         null
);

-- auto-generated definition
create table reader
(
    id       int         not null
        primary key,
    name     varchar(36) null,
    password varchar(36) null,
    constraint reader_id_uindex
        unique (id)
);

-- auto-generated definition
create table reader_book
(
    id        int not null
        primary key,
    reader_id int not null,
    book_isbn int null,
    constraint reader_book_id_uindex
        unique (id)
);

