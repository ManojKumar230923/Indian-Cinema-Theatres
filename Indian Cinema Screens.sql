use cinemascreens;
SELECT * FROM cinemascreens.`indian cinema screens`;
select distinct(City) from cinemascreens.`indian cinema screens`;
#1.City With More Number of Screens
select (City),sum(`Number of Screens`) from cinemascreens.`indian cinema screens` group by City;
#2. Number Of Single screens in each city
select City,count(Type) from cinemascreens.`indian cinema screens`  group by City with rollup;
select City,count(Type) from cinemascreens.`indian cinema screens`  where Type='single screen' group by City with rollup;
#NOTE : with rollup can give totsl of count type
#3.
select City,Type,`Number of screens` from cinemascreens.`indian cinema screens` having `Number of Screens`=5;
#4.
SELECT City, SUM(`Number of Screens`) AS Total_Screens FROM cinemascreens.`indian cinema screens` GROUP BY City 
ORDER BY Total_Screens DESC
LIMIT 5;
#5.
WITH CityTotals AS (SELECT City, SUM(`Number of Screens`) AS Total_Screens FROM cinemascreens.`indian cinema screens`GROUP BY City)
SELECT City, Total_Screens FROM CityTotals WHERE Total_Screens > 50 ORDER BY Total_Screens DESC;
#6
SELECT City, SUM(`Number of Screens`) AS Total_Screens
FROM cinemascreens.`indian cinema screens`
GROUP BY City
HAVING Total_Screens > 50
ORDER BY Total_Screens DESC;
#6.
select city , `Theatre Chain` from cinemascreens.`indian cinema screens` ;
#7.
WITH CityTotals AS (
SELECT City, SUM(`Number of Screens`) AS Total_Screens FROM cinemascreens.`indian cinema screens` GROUP BY City)
SELECT City, Total_Screens, RANK() OVER (ORDER BY Total_Screens DESC) AS RankNo FROM CityTotals;
#8.
select City ,sum(`Calculated Seats`) as SeatCapacity from cinemascreens.`indian cinema screens` group by City order by SeatCapacity desc;
#9. 
select City ,avg(`Average Ticket Price`) as Ticketprice from cinemascreens.`indian cinema screens` group by City order by Ticketprice desc;
#10.
select `Theatre Name`, (`Average Ticket Price`) as Ticketprice from cinemascreens.`indian cinema screens` ;
select City,`Theatre Chain` from cinemascreens.`indian cinema screens`;
SELECT City,
       GROUP_CONCAT(DISTINCT `Theatre Chain` ORDER BY `Theatre Chain` SEPARATOR ', ') AS TheatreChains
FROM cinemascreens.`indian cinema screens`
GROUP BY City;
#11.
select * from cinemascreens.`indian cinema screens` where City='Bangalore' and `Average Ticket Price` = 150;
#12.
select * from cinemascreens.`indian cinema screens` where `Theatre Chain` like "PV%";
#13.
select `Calculated Seats`,count(*) from cinemascreens.`indian cinema screens` group by `Calculated Seats` having count(*)>1;
#14.
select `Theatre Chain`,`Calculated Seats` from cinemascreens.`indian cinema screens` order by `Calculated Seats` desc;
#15.
SELECT City, Type, COUNT(*) AS Total_Theatres
FROM cinemascreens.`indian cinema screens`
GROUP BY City, Type
ORDER BY City;





