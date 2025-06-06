create table health
(
person_id int PRIMARY KEY,
gender varchar(8),
age int, 
occupation varchar(20),
sleep_duration float,
quality_of_sleep int,
physical_activity_level int,
stress_level int,
bmi_category varchar (15),
blood_pressure varchar(30),
health_rate int,
daily_steps int,
sleep_disorder varchar (25)
);

drop table health;
show variables like 'secure_file_priv';

show variables like 'local_infile';
set global local_infile = 1;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Sleep_health_and_lifestyle_dataset.csv'
into table  health
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from health ; 

 -- --- 1 which gender has a higher average daily steps 
 
 select gender ,
 avg (daily_steps ) as avg_steps
 from health 
 group by gender;


-- 2. find the top 3 occupations with the highest average stress level 

select occupation ,
avg (stress_level ) as avg_stress 
from health 
group by occupation 
order by avg_stress DESC 
limit 3 ; 


-- 3 what is the average health rate for each bmi category 

select bmi_category ,
avg (health_rate) as avg_heart_rate 
from health
group by bmi_category;



-- 4 what is the average number of daily steps for each category of quality of sleep

select quality_of_sleep,
avg (daily_steps) as avg_daily_steps
from health
group by quality_of_sleep
order by quality_of_sleep desc ;


-- 5 what is the average age of all individual 

select avg (age) as average_age
from health; 


-- 6 what is the average sleep duration for each gender

select gender ,
avg (sleep_duration) as avg_sleep
from health
group by gender;

-- 7 find all people with a sleep duration less than 7 hours

select * from health 
where sleep_duration < 7;


-- 8 list the top 5 people who take the most daily steps

select person_id ,daily_steps
from health 
order by daily_steps desc
limit 5; 


-- 9 how many people have a sleep disorder

select count(*) sleep_disorder
 from health
 where sleep_disorder is not null ; 

   select * from health;
   
   
   
   -- --- INSIGHTS 
   
   
      ->   On average , one gender takes more daily steps than the other .
      ->  The top 3 most stressful jobs have the highest average stress level . 
      ->  Heart rate varies by BMI category ,showing links between weight and hearth health . 
      -> Better sleep quality is generally associated with more daily steps. 
	  -> Many people sleep less than 7 hours or have sleep disorders .
	   -> A few individual take significantly more steps daily , showing high activity levels.