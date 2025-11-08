CREATE database City_Hospital;
use City_Hospital;
create table Patients(
		Patient_ID INT auto_increment primary key ,
        Patient_Name VARCHAR(50),
        Age INT,
        Gender enum('M','F'),
        Admission_Date DATE
        );
alter table patients add Doctor_Assigned varchar(50);

alter table patients modify Patient_Name varchar(100);

rename table Patients to Patient_Info;

truncate table Patient_Info;
drop table Patient_Info;