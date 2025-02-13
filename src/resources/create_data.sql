--liquibase formatted sql
--changeset employment_office_mmicheli:create_data

create database employment_office_mmicheli;

create table employee (
    e_id            bigint auto_increment not null primary key,
    e_surname       varchar(255) not null,
    e_name          varchar(255) not null,
    e_patronymic    varchar(255),
    e_qualification varchar(255) not null,
    e_profession    varchar(255) not null,
    e_other_data    varchar(255) not null
);

create table work_type (
    wt_id           bigint auto_increment not null primary key,
    wt_type         varchar(255) not null
);

create table hirer (
     h_id           bigint auto_increment not null primary key,
     h_name         varchar(255) not null,
     h_work_type_id bigint not null,
     h_address      varchar(255) not null,
     h_phone_number varchar(255) not null,

     FOREIGN KEY (h_work_type_id) REFERENCES work_type(wt_id) ON DELETE CASCADE ON UPDATE CASCADE
);

create table vacancy (
    v_id            bigint auto_increment not null primary key,
    v_qualification varchar(255) not null,
    v_profession    varchar(255) not null,
    v_hirer_id      bigint not null,

    FOREIGN KEY (v_hirer_id) REFERENCES employee(e_id) ON DELETE CASCADE ON UPDATE CASCADE
);

create table cooperation_document (
    cd_id           bigint auto_increment not null primary key,
    cd_employee_id  bigint not null,
    cd_hirer_id     bigint not null,
    cd_position     varchar(255) not null,
    cd_commission   varchar(255) not null,

    FOREIGN KEY (cd_employee_id) REFERENCES employee(e_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (cd_hirer_id) REFERENCES hirer(h_id) ON DELETE CASCADE ON UPDATE CASCADE
);
