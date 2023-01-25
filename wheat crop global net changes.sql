-- Looking at the regions' percentage of global wheat production
-- Making table of wheat production

CREATE TABLE wheat_production AS
SELECT region, year, wheat
FROM portfolioproject.`crops excel`;

-- Making table of global wheat numbers
CREATE TABLE global_wheat_production AS
SELECT year, wheat
FROM portfolioproject.`global production`;

-- Making a table of 2018 and 1961 global percentages
CREATE TABLE wheat_comparison 
AS
SELECT region, wheat_production.year, wheat, (wheat/global_wheat)*100 AS global_perc
FROM wheat_production
INNER JOIN global_wheat_production ON wheat_production.year=global_wheat_production.year
WHERE wheat_production.year=2018 OR wheat_production.year=1961
ORDER BY wheat_production.year desc;

-- Making a table that has only 2018 global percentages
CREATE TABLE wheat_2018
AS
SELECT region, global_perc 
FROM portfolioproject.wheat_comparison
WHERE year=2018;

-- Making a table that has only 1961 global percentages
CREATE TABLE wheat_1961 AS
SELECT region, global_perc 
FROM portfolioproject.wheat_comparison
WHERE year=1961;

-- Making a table that shows net changes
CREATE TABLE wheat_net_change
AS
SELECT 
	wheat_1961.region, 
    1961_global_perc, 
    2018_global_perc, 
    ((2018_global_perc - 1961_global_perc)/1961_global_perc)*100 AS net_change
FROM wheat_1961
INNER JOIN wheat_2018 ON wheat_1961.region=wheat_2018.region;

-- Creating a view for net change of wheat production
CREATE VIEW wheat_NetChanges
AS
SELECT *
FROM wheat_net_change;