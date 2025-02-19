--liquibase formatted sql
--changeset employment_office_mmicheli:update_data

create database experimental_db;

rename database experimental_db to experimental_db_renamed;

create table experimental_table(
    id bigint auto_increment not null primary key,
    name varchar(50)
);

insert into experimental_table (name)
values ('Саша'),
       ('Маша'),
       ('Даша'),
       ('Леша'),
       ('Миша');

drop table experimental_table;

alter table experimental_table add new_column varchar(100);

alter table experimental_table change new_column new_column_renamed varchar(50);

alter table experimental_table drop new_column_renamed;

update work_type set wt_type = 'Сотрудничество по договору с юридическим лицом (ОАО, ООО, ИП)'
    where wt_type = 'сотрудничество по договору с юридическим лицом (ОАО, ООО, ИП)';

insert into employee (e_surname, e_name, e_patronymic, e_qualification, e_profession, e_other_data)
values  ('Иванов', 'Антон', 'Алексеевич', 'бакалавр', 'сантехник', 'опыт работы 3 года'),
        ('Алексеев', 'Вениамин', 'Константинович', 'К.Э.Н.', 'сантехник', 'опыт 8 лет'),
        ('Эйлинен', 'Герман', null, 'бакалавр', 'сантехник', 'опыт 5 лет');

delete from employee where e_profession = 'сантехник';
