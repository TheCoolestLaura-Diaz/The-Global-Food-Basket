-- Looking at the regions' percentage of global rice production
-- Making table of rice production

CREATE TABLE rice_production AS
SELECT region, year, rice
FROM portfolioproject.`crops excel`;

-- Making table of global rice numbers
CREATE TABLE global_rice_production AS
SELECT year, rice
FROM portfolioproject.`global production`;

-- Making a table of 2018 and 1961 global percentages
CREATE TABLE rice_comparison 
AS
SELECT region, rice_production.year, rice, (rice/global_rice)*100 AS global_perc
FROM rice_production
INNER JOIN global_rice_production ON rice_production.year=global_rice_production.year
WHERE rice_production.year=2018 OR rice_production.year=1961
ORDER BY rice_production.year desc;

-- Making a table that has only 2018 global percentages
CREATE TABLE rice_2018
AS
SELECT region, global_perc 
FROM portfolioproject.rice_comparison
WHERE year=2018;

-- Making a table that has only 1961 global percentages
CREATE TABLE rice_1961 AS
SELECT region, global_perc 
FROM portfolioproject.rice_comparison
WHERE year=1961;

-- Making a table that shows net changes
CREATE TABLE rice_net_change
AS
SELECT 
	rice_1961.region, 
    1961_global_perc, 
    2018_global_perc, 
    ((2018_global_perc - 1961_global_perc)/1961_global_perc)*100 AS net_change
FROM rice_1961
INNER JOIN rice_2018 ON rice_1961.region=rice_2018.region;

-- Creating a view for net change of rice production
CREATE VIEW rice_NetChanges
AS
SELECT *
FROM rice_net_change;