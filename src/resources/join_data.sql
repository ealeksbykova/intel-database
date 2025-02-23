--liquibase formatted sql
--changeset employment_office_mmicheli:select_data

select * from hirer, vacancy;

select hirer.h_id, hirer.h_phone_number, vacancy.v_qualification from hirer
    join vacancy on hirer.h_id = vacancy.v_hirer_id;

select cooperation_document.*, employee.e_surname, employee.e_profession from cooperation_document
    left join employee on cooperation_document.cd_employee_id = employee.e_id;

select cooperation_document.*, employee.e_surname, employee.e_profession from employee
    left join cooperation_document on employee.e_id = cooperation_document.cd_employee_id;

select employee.e_surname, cooperation_document.cd_position, cooperation_document.cd_commission, hirer.h_name from employee
    left join cooperation_document on employee.e_id = cooperation_document.cd_employee_id
    right join hirer on cooperation_document.cd_hirer_id = hirer.h_id;

select * from cooperation_document where cooperation_document.cd_employee_id in (
    select e_id from employee where employee.e_qualification = 'бакалавр' and employee.e_surname like '%ко'
);

select * from cooperation_document where cd_commission = (
    select max(cd_commission) from cooperation_document
);