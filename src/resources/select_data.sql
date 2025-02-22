--liquibase formatted sql
--changeset employment_office_mmicheli:select_data

select * from hirer;

select h_name, h_address, h_phone_number from hirer;

select * from employee where e_qualification = 'бакалавр';

select * from employee where e_qualification <> 'бакалавр';

select * from cooperation_document where cd_commission > '15000.00';

mysql> select e_id, e_qualification, e_profession from employee where  e_profession = 'разнорабочий';

select e_id, e_qualification, e_profession from employee where e_qualification = 'без специализации' and e_profession = 'разнорабочий';

select h_id, h_address, h_phone_number from hirer where h_address like '%Москва%';

select distinct v_qualification from vacancy order by v_qualification asc;

select e_id, e_surname, e_name, e_patronymic from employee limit 3;

select e_id, e_surname, e_name, e_patronymic from employee limit 3, 7;

select h_work_type_id, count(*) as hirers_count from hirer group by h_work_type_id;

select h_work_type_id, count(*) as hirers_count from hirer group by h_work_type_id having count(*) > 2;
