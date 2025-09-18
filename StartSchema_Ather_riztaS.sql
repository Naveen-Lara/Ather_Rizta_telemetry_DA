Create database ather_rizta_s;
Use  ather_rizta_s;

create table dim_psi(
	psi_id   INT Primary KEY,
   	recommended_psi FLOAT,
    psi_description VARCHAR(50)
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

drop table if exists day_rideid;
CREATE TABLE day_rideid (
    day_id INT PRIMARY KEY,
    day_id_ride VARCHAR(50)
);


drop table if exists dim_date;
CREATE TABLE dim_date (
    event_time DATETIME PRIMARY KEY,
    day_id INT,
    FOREIGN KEY (day_id) REFERENCES day_rideid(day_id)
);


Drop table if exists Rizta_tele;
CREATE TABLE Rizta_tele (
  	RID VARCHAR(50) PRIMARY KEY,
    event_time DATETIME,
    front_psi_id INT,
    front_psi FLOAT,
    Rear_psi_id INT,
    Rear_psi FLOAT,
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
    FOREIGN KEY (front_psi_id) REFERENCES dim_psi(psi_id),
    FOREIGN KEY (Rear_psi_id) REFERENCES dim_psi(psi_id),
    FOREIGN KEY (ridemode_id) REFERENCES dim_ridemode(ridemode_id),
    FOREIGN KEY (regen_id) REFERENCES dim_regenstatus(regen_id),
    FOREIGN KEY (event_time) REFERENCES dim_date(event_time)
);

--creating index to make queries run faster
CREATE INDEX idx_event_time ON rizta_tele(event_time);
CREATE INDEX idx_ridemode ON rizta_tele(ridemode_id);
CREATE INDEX idx_regen ON rizta_tele(regen_id);
CREATE INDEX idx_frontpsi ON rizta_tele(front_psi_id);
CREATE INDEX idx_rearpsi ON rizta_tele(rear_psi_id);






