-- Looking at the regions' percentage of global soybean production
-- Making table of soybean production

CREATE TABLE soybean_production AS
SELECT region, year, soybeans
FROM portfolioproject.`crops excel`;

-- Making table of global soybean numbers
CREATE TABLE global_soybean_production AS
SELECT year, soybeans
FROM portfolioproject.`global production`;

-- Making a table of 2018 and 1961 global percentages
CREATE TABLE soybean_comparison 
AS
SELECT region, soybean_production.year, soybeans, (soybeans/global_soybeans)*100 AS global_perc
FROM soybean_production
INNER JOIN global_soybean_production ON soybean_production.year=global_soybean_production.year
WHERE soybean_production.year=2018 OR soybean_production.year=1961
ORDER BY soybean_production.year desc;

-- Making a table that has only 2018 global percentages
CREATE TABLE soybean_2018
AS
SELECT region, global_perc 
FROM portfolioproject.soybean_comparison
WHERE year=2018;

-- Making a table that has only 1961 global percentages
CREATE TABLE soybean_1961 AS
SELECT region, global_perc 
FROM portfolioproject.soybean_comparison
WHERE year=1961;

-- Making a table that shows net changes
CREATE TABLE soybean_net_change
AS
SELECT 
	soybean_1961.region, 
    1961_global_perc, 
    2018_global_perc, 
    ((2018_global_perc - 1961_global_perc)/1961_global_perc)*100 AS net_change
FROM soybean_1961
INNER JOIN soybean_2018 ON soybean_1961.region=soybean_2018.region;

-- Creating a view for net change of rice production
CREATE VIEW soybean_NetChanges
AS
SELECT *
FROM soybean_net_change;