create Database StravaProject;

USE StravaProject;

Select * FROM dailyactivity_merged;
Select * FROM dailycalories_merged;
Select * FROM dailyintensities_merged;
Select * FROM dailysteps_merged;
Select * FROM heartrate_seconds_merged;
Select * FROM hourlycalories_merged;
Select * FROM hourlyintensities_merged;
Select * FROM hourlysteps_merged;
Select * FROM minutecaloriesnarrow_merged;
Select * FROM minutecalorieswide_merged;
Select * FROM sleepday_merged;


-- 1. Average Daily Steps per User

SELECT Id, AVG(TotalSteps) AS avg_daily_steps
FROM dailyactivity_merged
GROUP BY Id;

-- 2. Top 5 Most Active Days Across All Users (by Total Steps)

SELECT ActivityDate, SUM(TotalSteps) AS total_steps
FROM dailyactivity_merged
GROUP BY ActivityDate
ORDER BY total_steps DESC
LIMIT 5;

-- 3. Calories vs Steps Correlation

SELECT a.Id, a.ActivityDate, a.TotalSteps, c.Calories
FROM dailyActivity_merged a
JOIN dailyCalories_merged c ON a.Id = c.Id AND a.ActivityDate = c.ActivityDay;

-- 4. User-wise Total Calories Burned

SELECT Id, SUM(Calories) AS total_calories
FROM dailycalories_merged
GROUP BY Id
ORDER BY total_calories DESC;

-- 5. Top 5 Average daily Very Active Minutes

SELECT AVG(VeryActiveMinutes) AS avg_very_active_minutes
FROM dailyactivity_merged
GROUP BY Id
order by avg_very_active_minutes DESC
LIMIT 5;

-- 6. Average daily step count

SELECT AVG(StepTotal) AS avg_dailysteps
FROM dailysteps_merged
GROUP BY Id
order by avg_dailysteps DESC
LIMIT 10;

-- 7. Average heart rate

SELECT AVG(StepTotal) AS avg_dailysteps
FROM dailysteps_merged
GROUP BY Id
order by avg_dailysteps DESC;

-- 8. Average hourly calories

SELECT ID, AVG(calories) AS avg_hourlycalories
FROM hourlycalories_merged
GROUP BY Id
order by avg_hourlycalories DESC;


-- 9. Average hourly intensity

SELECT Id, AverageIntensity 
from hourlyintensities_merged
order by AverageIntensity DESC;

-- 10. hourly steps

select avg(StepTotal) from hourlysteps_merged
group by ID;

-- 11. Hourly Activity Pattern

SELECT strftime('%H', ActivityHour) AS hour, AVG(StepTotal) AS avg_steps
FROM hourlysteps_merged
GROUP BY hour
ORDER BY hour;

-- 12. Average sleep per day in hour

select * from sleepday_merged;

select Id, avg(TotalMinutesAsleep)/60 from sleepday_merged
group by ID;





