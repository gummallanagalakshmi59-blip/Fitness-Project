#CREATE A DATABASE
CREATE DATABASE fitness_project_app;
USE fitness_project_app;
SHOW DATABASES;
SHOW TABLES;

#CREATE A TABLES
CREATE TABLE daily_activity (
Id BIGINT,
ActivityDate DATE,
TotalSteps INT,
TotalDistance FLOAT,
Calories INT,
VeryActiveMinutes INT,
FairlyActiveMinutes INT,
LightlyActiveMinutes INT,
SedentaryMinutes INT
);
CREATE TABLE sleep_day (
Id BIGINT,
SleepDay DATETIME,
TotalSleepRecords INT,
TotalMinutesAsleep INT,
TotalTimeInBed INT
);
CREATE TABLE weight_log (
Id BIGINT,
Date DATETIME,
WeightKg FLOAT,
WeightPounds FLOAT,
Fat FLOAT,
BMI FLOAT,
IsManualReport BOOLEAN,
LogId BIGINT
);
CREATE TABLE hourly_steps (
Id BIGINT,
ActivityHour DATETIME,
StepTotal INT
);

use fitness_project_app;

SHOW TABLES;

#DATA CLEANIG
#MISSING VALUES
SELECT *
FROM daily_activity
WHERE TotalSteps IS NULL;

#DUPLICATES
SELECT Id, ActivityDate, COUNT(*)
FROM daily_activity
GROUP BY Id, ActivityDate
HAVING COUNT(*) > 1;

#DATA ANALYSIS
#COUNT OF ROWS
SELECT COUNT(*) FROM hourlysteps_merged;
SELECT COUNT(*) AS dailymerged_rows FROM dailyactivity_merged;
SELECT COUNT(*) AS sleepmerged_rows FROM sleepday_merged;
SELECT COUNT(*) AS hourlymerged_rows FROM hourlysteps_merged;

#AVG 
SELECT AVG(TotalSteps) AS average_steps
FROM dailyactivity_merged;

SELECT AVG(TotalMinutesAsleep)/60 AS avg_sleep_hours
FROM sleepday_merged;

SELECT AVG(StepTotal) AS avg_hourly_steps
FROM hourlysteps_merged;
SELECT AVG(StepTotal) AS avg_hourly_steps
FROM hourlysteps_merged;

#MOST ACTIVE USERS
SELECT Id, SUM(TotalSteps) AS total_steps
FROM dailyactivity_merged
GROUP BY Id
ORDER BY total_steps DESC;

#STEPS VS CALORIES
SELECT TotalSteps, Calories
FROM daily_activity
ORDER BY TotalSteps DESC;

#ACTIVITY VS WEIGHT
SELECT d.Id, d.TotalSteps, w.WeightKg
FROM daily_activity d
JOIN weight_log w
ON d.Id = w.Id;




