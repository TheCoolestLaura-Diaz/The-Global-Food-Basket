-- Looking at the regions' percentage of global sugarcane production
-- Making table of sugarcane production

CREATE TABLE sugarcane_production AS
SELECT region, year, sugarcane
FROM portfolioproject.`crops excel`;

-- Making table of global sugarcane numbers
CREATE TABLE global_sugarcane_production AS
SELECT year, sugarcane
FROM portfolioproject.`global production`;

-- Making a table of 2018 and 1961 global percentages
CREATE TABLE sugarcane_comparison 
AS
SELECT region, sugarcane_production.year, sugarcane, (sugarcane/global_sugarcane)*100 AS global_perc
FROM sugarcane_production
INNER JOIN global_sugarcane_production ON sugarcane_production.year=global_sugarcane_production.year
WHERE sugarcane_production.year=2018 OR sugarcane_production.year=1961
ORDER BY sugarcane_production.year desc;

-- Making a table that has only 2018 global percentages
CREATE TABLE sugarcane_2018
AS
SELECT region, global_perc 
FROM portfolioproject.sugarcane_comparison
WHERE year=2018;

-- Making a table that has only 1961 global percentages
CREATE TABLE sugarcane_1961 AS
SELECT region, global_perc 
FROM portfolioproject.sugarcane_comparison
WHERE year=1961;

-- Making a table that shows net changes
CREATE TABLE sugarcane_net_change
AS
SELECT 
	sugarcane_1961.region, 
    1961_global_perc, 
    2018_global_perc, 
    ((2018_global_perc - 1961_global_perc)/1961_global_perc)*100 AS net_change
FROM sugarcane_1961
INNER JOIN sugarcane_2018 ON sugarcane_1961.region=sugarcane_2018.region;

-- Creating a view for net change of rice production
CREATE VIEW sugarcane_NetChanges
AS
SELECT *
FROM sugarcane_net_change;