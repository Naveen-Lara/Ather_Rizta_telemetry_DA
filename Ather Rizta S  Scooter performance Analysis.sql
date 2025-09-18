-- Ather rizta Scooter Performance analysis

Select * from Rizta_tele;
 --  dataset 1 Correlation & Distribution Analysis
 select 
	r.event_time,dr.day_id_ride as RideID,r.rear_psi,r.SEC,r.SOC,r.battery_voltage,r.battery_temp,r.Motor_temp,r.motor_current,
    (Case When r.Rear_PSI < (p.Recommended_psi - (0.05*p.recommended_psi)) Then "Under_Inflated"
    When  r.Rear_psi > p.Recommended_psi or  r.Rear_psi 
    between (p.Recommended_psi - (0.05*p.Recommended_psi)) and p.Recommended_psi  Then "Nominal" End) as PSI_Category
	,rm.ride_mode,r.ridemode_id,r.estimated_range_km
From 
	rizta_tele r
join
	dim_ridemode rm 
on
	rm.ridemode_id = r.ridemode_id
join 
	dim_psi p
on
	p.psi_id = r.rear_psi_id
Join 
	dim_date d
on 
	d.event_time = r.event_time
Join 
	day_rideid dr
on 	
	dr.day_id =d.day_id
Order by event_time;

-- dataset 2 Evolution and Performance Metrics

Select 
	  r.event_time,rm.ride_mode,r.speed,r.discharge_current,r.sec,
    r.estimated_range_km,r.battery_voltage,r.motor_temp,
    (Case When r.Rear_PSI < (p.Recommended_psi - (0.05*p.recommended_psi)) Then "Under_Inflated"
    When  r.Rear_psi > p.Recommended_psi or  r.Rear_psi 
    between (p.Recommended_psi - (0.05*p.Recommended_psi)) and p.Recommended_psi  Then "Nominal" End) as PSI_Category,
    coalesce((r.speed  - LAG(r.speed) OVER (ORDER BY r.event_time)) /
    TIMESTAMPDIFF(SECOND, LAG(r.event_time) OVER (ORDER BY r.event_time), r.event_time),0) AS Acceleration
from
	rizta_tele r
Join 
	dim_ridemode rm
on
	rm.ridemode_id = r.ridemode_id
join 
	dim_psi p
on 
	p.psi_id= r.rear_psi_id
order by 
  event_time;
 
 -- Kpi to calculate the range differences
SELECT 
   MAX(CASE WHEN ride_mode = 'Smart Eco' THEN avg_range END) -
   MAX(CASE WHEN ride_mode = 'Zip Mode' THEN avg_range END) AS range_difference
FROM (
    SELECT rm.ride_mode, AVG(r.estimated_range_km) AS avg_range
    FROM rizta_tele r
    JOIN dim_ridemode rm 
      ON rm.ridemode_id = r.ridemode_id
    WHERE rm.ride_mode IN ('Smart Eco','Zip Mode')
    GROUP BY rm.ride_mode
) t;


-- dataset 3 categorical analysis


select 
	r.event_time,dr.day_id_ride as Ride_ID,r.battery_voltage,r.distance_km,r.rear_psi,
	r.motor_current,r.discharge_current,r.SOC,
    r.battery_temp,rg.regen_status,
    rm.ride_mode,r.speed,r.estimated_range_km,
    r.SEC,
    (Case When r.Rear_PSI < (p.Recommended_psi - (0.05*p.recommended_psi)) Then "Under_Inflated"
    When  r.Rear_psi > p.Recommended_psi or  r.Rear_psi 
    between (p.Recommended_psi - (0.05*p.Recommended_psi)) and p.Recommended_psi  Then "Nominal" End) as PSI_Category
From 
	rizta_tele r
join 
	dim_regenstatus rg
on 
	rg.regen_id = r.regen_id
join
	dim_ridemode rm
on 
	rm.ridemode_id = r.ridemode_id
Join 
	dim_psi p
on 
	p.psi_id = r.rear_psi_id
JOIN 
	dim_date d
on 
	d.event_time = r.event_time
Join
	day_rideid dr
on 
	dr.day_id= d.day_id
Order by 
	event_time;
	
-- KPI: Average Ride Duration per ride

Select 
	dr.day_id_ride as Ride_ID,
    concat('Day-',(day(r.event_time))) as Days,
    (Case When r.Rear_PSI < (p.Recommended_psi - (0.05*p.recommended_psi)) Then "Under_Inflated"
    When  r.Rear_psi > p.Recommended_psi or  r.Rear_psi 
    between (p.Recommended_psi - (0.05*p.Recommended_psi)) and p.Recommended_psi  Then "Nominal" End) as PSI_Category
    
    
from 	
	rizta_tele r
JOIN 
	dim_date d
on 
	d.event_time = r.event_time
Join
	day_rideid dr
on 
	dr.day_id= d.day_id
Join 
	dim_psi p
on 
	p.psi_id = r.rear_psi_id;
    
    
    
    
	
