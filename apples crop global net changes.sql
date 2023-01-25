-- Looking at the regions' percentage of global apple production for years 1961 and 2018

-- Making a table of 2018 and 1961 global percentages

CREATE TABLE apple_comparison
AS
SELECT region, apple_production.year, apples, (apples/global_apples)*100 AS global_perc
FROM apple_production
INNER JOIN global_apple_production ON apple_production.year=global_apple_production.year
WHERE apple_production.year=2018 OR apple_production.year=1961
ORDER BY apple_production.year desc;


-- Making a table that has only 2018 global percentages
CREATE TABLE apples_2018
AS
SELECT region, global_perc 
FROM portfolioproject.apple_comparison
WHERE year=2018;

-- Making a table that has only 1961 global percentages
CREATE TABLE apples_1961
AS
SELECT region, global_perc 
FROM portfolioproject.apple_comparison
WHERE year=1961;

-- Making a table that shows net changes
CREATE TABLE apples_net_change
AS
SELECT 
	apples_1961.region, 
    1961_global_perc, 
    2018_global_perc, 
    ((2018_global_perc - 1961_global_perc)/1961_global_perc)*100 AS net_change
FROM apples_1961
INNER JOIN apples_2018 ON apples_1961.region=apples_2018.region;