Create database ather_rizta_s;
Use  ather_rizta_s;

create table dim_psi(
	psi_id   INT Primary KEY,
    recommended_Front_PSI  float,
    recommended_Rear_PSI  float
    );
    
create table dim_ridemode(
	ridemode_id int Primary key,
    ride_mode varchar(50)
);


drop table if exists dim_regenstatus;
create table dim_regenstatus(
	regen_id Int Primary Key,
    regen_status Varchar(50)
);

drop table if exists dim_date;
Create table dim_date(
	timestamp datetime primary Key
    );
Drop table if exists Rizta_tele;
CREATE TABLE Rizta_tele (
    ride_id INT PRIMARY KEY ,
    timestamp datetime,
    psi_id INT,
    front_psi Float,
     Rear_psi float,
    ridemode_id INT,
    regen_id INT,
    motor_current FLOAT,
    motor_temp FLOAT,
    battery_voltage FLOAT,
    discharge_current FLOAT,
    battery_temp FLOAT,
    speed FLOAT,
    efficiency FLOAT,
    estimated_soc FLOAT,
    estimated_range_km FLOAT,
    acceleration FLOAT,
    FOREIGN KEY (timestamp) REFERENCES dim_date(timestamp),
    FOREIGN KEY (psi_id) REFERENCES dim_psi(psi_id),
    FOREIGN KEY (ridemode_id) REFERENCES dim_ridemode(ridemode_id),
    FOREIGN KEY (regen_id) REFERENCES dim_regenstatus(regen_id)
);







