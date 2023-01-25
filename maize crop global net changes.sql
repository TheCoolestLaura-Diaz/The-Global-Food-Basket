-- Looking at the regions' percentage of global maize production
-- Making table of coffee production

CREATE TABLE maize_production AS
SELECT region, year, maize
FROM portfolioproject.`crops excel`;

-- Making table of global maize numbers
CREATE TABLE global_maize_production AS
SELECT year, maize
FROM portfolioproject.`global production`;

-- Making a table of 2018 and 1961 global percentages
CREATE TABLE maize_comparison 
AS
SELECT region, maize_production.year, maize, (maize/global_maize)*100 AS global_perc
FROM maize_production
INNER JOIN global_maize_production ON maize_production.year=global_maize_production.year
WHERE maize_production.year=2018 OR maize_production.year=1961
ORDER BY maize_production.year desc;

-- Making a table that has only 2018 global percentages
CREATE TABLE maize_2018
AS
SELECT region, global_perc 
FROM portfolioproject.maize_comparison
WHERE year=2018;

-- Making a table that has only 1961 global percentages
CREATE TABLE maize_1961 AS
SELECT region, global_perc 
FROM portfolioproject.maize_comparison
WHERE year=1961;

-- Making a table that shows net changes
CREATE TABLE maize_net_change
AS
SELECT 
	maize_1961.region, 
    1961_global_perc, 
    2018_global_perc, 
    ((2018_global_perc - 1961_global_perc)/1961_global_perc)*100 AS net_change
FROM maize_1961
INNER JOIN maize_2018 ON maize_1961.region=maize_2018.region;

-- Creating a view for net change of coffee production
CREATE VIEW maize_NetChanges
AS
SELECT *
FROM maize_net_change;