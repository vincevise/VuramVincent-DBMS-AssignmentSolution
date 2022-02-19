create database TravelOnTheGo;
use TravelOnTheGo;
-- 1) You are required to create two tables PASSENGER and PRICE with the following attributes and properties
create table passenger(
	Passenger_name varchar(20) not null primary key,
	Category varchar(20),
	Gender char,
	Boarding_City varchar(20),
	Destination_City varchar(20),
	Distance int,
	Bus_Type varchar(20),
      FOREIGN KEY (Bus_type) REFERENCES Price(Bus_type),
      FOREIGN KEY (Distance) REFERENCES Price(Distance)
);
create table PRICE
(
 Bus_Type varchar(20) ,
 Distance int ,
 Price int,
 CONSTRAINT PK_price PRIMARY KEY (Bus_type,Distance)
 );

-- 2) Insert the following data in the tables
insert into passenger values ('Sejal','AC', 'F', 'Bengaluru', 'Chennai', 350 ,'Sleeper');
insert into passenger values ('Anmol', 'Non-AC' ,'M' ,'Mumbai', 'Hyderabad', 700, 'Sitting');
insert into passenger values ('Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper');
insert into passenger values ('Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500 ,'Sleeper');
insert into passenger values ('Udit', 'Non-AC', 'M', 'Trivandrum', 'panaji', 1000, 'Sleeper');
insert into passenger values ('Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500,'Sitting');
insert into passenger values ('Hemant', 'Non-AC', 'M', 'panaji', 'Mumbai', 700, 'Sleeper');
insert into passenger values ('Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', '500', 'Sitting');
insert into passenger values ('Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');

insert into price values ('Sleeper',350 ,770);
insert into price values ('Sleeper', 500, 1100);
insert into price values ('Sleeper' ,600 ,1320);
insert into price values ('Sleeper', 700, 1540);
insert into price values ('Sleeper', 1000, 2200);
insert into price values ('Sleeper' ,1200 ,2640);
insert into price values ('Sleeper' ,1500, 2700);
insert into price values ('Sitting', 500, 620);
insert into price values ('Sitting', 600, 744);
insert into price values ('Sitting', 700, 868);
insert into price values ('Sitting', 1000, 1240);
insert into price values ('Sitting', 1200, 1488);
insert into price values ('Sitting', 1500, 1860);

-- 3) How many females and how many male passengers travelled for a minimum distance of 600 KM s?
select gender,count(gender) from passenger,price where passenger.distance >= 600 and passenger.distance = price.distance  group by gender;


-- 4) Find the minimum ticket price for Sleeper Bus. 
select min(Price) from Price where Bus_Type = 'sleeper';
 

-- 5) Select passenger names whose names start with character 'S'
select passenger_name from passenger where passenger_name like 's%';
 

-- 6) Calculate price charged for each passenger displaying Passenger name, Boarding City,
-- Destination City, Bus_Type, Price in the output
select  pa.passenger_name,pa.boarding_city,pa.Destination_city,pa.bus_type,pr.price 
from passenger as pa
left join price as pr
on  pr.distance = pa.distance and pr.bus_type = pa.bus_type ;

-- 7) What are the passenger name/s and his/her ticket price who travelled in the Sitting bus
-- for a distance of 1000 KM s 
select passenger.passenger_name,price.price from passenger,price where passenger.distance >=1000 and passenger.distance = price.distance and passenger.bus_type = price.bus_type;
 

-- 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select bus_type,price from price where distance = 600; 

-- 9) List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order
select passenger_name,distance from passenger group by distance order by distance desc;

-- 10) Display the passenger name and percentage of distance travelled by that passenger
-- from the total distance travelled by all passengers without using user variables
select passenger_name,distance * 100 /(select sum(distance) from passenger) as percentage from passenger;

-- 11) Display the distance, price in three categories in table Price
-- a) Expensive if the cost is more than 1000
-- b) Average Cost if the cost is less than 1000 and greater than 500
-- c) Cheap otherwise

select distance,price,
CASE 
	 WHEN  price > 1000  THEN 'Expensive'
	 WHEN  price > 500 THEN 'Average Cost'
	 ELSE 'Cheap'
END AS categories
from price ;
 
