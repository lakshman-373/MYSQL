#fifa assignment
use ksr;

#How many players are there in the dataset?
select count(*) from fifa;

#How many nationalities do these players belong to?
select count(distinct nationality) from fifa;

#What is the total wage given to all players? What's the average and standard deviation?
select sum(wage) as total_salary, avg(wage) as average_salary, stddev(wage) as SD_salary from fifa;

#Which nationality has the highest number of players, what are the top 3 nationalities by # of players?
select nationality,count(id) from fifa group by nationality order by count(id) desc  limit 1 ;
select nationality,count(id) from fifa group by nationality order by count(id) desc limit 3;


#Which player has the highest wage? Who has the lowest?
select max(wage) as high_wage, min(wage) as low_wage from fifa;

#The player having the – best overall rating? Worst overall rating?
select name,overall from fifa where Overall in (select max(Overall) from fifa);
select name,overall from fifa where Overall in (select min(Overall) from fifa);
#Club having the highest total of overall rating? Highest Average of overall rating?
select club,sum(Overall) from fifa  group by club order by sum(Overall) desc limit 1;
select club,avg(Overall) from fifa  group by club order by avg(Overall) desc limit 1;

#What are the top 5 clubs based on the average 	ratings of their players and their corresponding 	averages?
select club,avg(overall) from fifa group by club order by avg(overall) desc limit 5;

#What is the distribution of players whose preferred foot is left vs right?
select preferred_foot,count(*) from fifa group by Preferred_Foot ;

#Which jersey number is the luckiest?
select jersey_number,count(*) from fifa group by jersey_number order by count(*) desc limit 1;

#What is the frequency distribution of nationalities among players whose club name starts with M?
select nationality, count(*) from fifa where club like 'm%' group by nationality order by count(*);

#How many players have joined their respective clubs in the date range 20 May 2018 to 10 April 2019 (both inclusive)?
select club,count(*) from fifa where joined<='20-06-2018' and joined>='10-04-2019' group by club;

#How many players have joined their respective clubs date wise?
select club,joined,count(*) from fifa group by joined,club;

#How many players have joined their respective clubs yearly?
select club,year(str_to_date(joined,'%d-%m-%Y')) as year,count(*) from fifa group by club, year(str_to_date(joined,'%d-%m-%y'));
