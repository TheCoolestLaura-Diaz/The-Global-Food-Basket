-- Looking at the regions' percentage of global potatoes production
-- Making table of potatoes production

CREATE TABLE potatoes_production AS
SELECT region, year, potatoes
FROM portfolioproject.`crops excel`;

-- Making table of global potatoes numbers
CREATE TABLE global_potatoes_production AS
SELECT year, potatoes
FROM portfolioproject.`global production`;

-- Making a table of 2018 and 1961 global percentages
CREATE TABLE potatoes_comparison 
AS
SELECT region, potatoes_production.year, potatoes, (potatoes/global_potatoes)*100 AS global_perc
FROM potatoes_production
INNER JOIN global_potatoes_production ON potatoes_production.year=global_potatoes_production.year
WHERE potatoes_production.year=2018 OR potatoes_production.year=1961
ORDER BY potatoes_production.year desc;

-- Making a table that has only 2018 global percentages
CREATE TABLE potatoes_2018
AS
SELECT region, global_perc 
FROM portfolioproject.potatoes_comparison
WHERE year=2018;

-- Making a table that has only 1961 global percentages
CREATE TABLE potatoes_1961 AS
SELECT region, global_perc 
FROM portfolioproject.potatoes_comparison
WHERE year=1961;

-- Making a table that shows net changes
CREATE TABLE potatoes_net_change
AS
SELECT 
	potatoes_1961.region, 
    1961_global_perc, 
    2018_global_perc, 
    ((2018_global_perc - 1961_global_perc)/1961_global_perc)*100 AS net_change
FROM potatoes_1961
INNER JOIN potatoes_2018 ON potatoes_1961.region=potatoes_2018.region;

-- Creating a view for net change of potatoes production
CREATE VIEW potatoes_NetChanges
AS
SELECT *
FROM potatoes_net_change;