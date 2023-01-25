-- Looking at the regions' percentage of global cocoa production
-- Making table of cocoa production

CREATE TABLE cocoa_production AS
SELECT region, year, cocoa
FROM portfolioproject.`crops excel`;

-- Making table of global cocoa numbers
CREATE TABLE global_cocoa_production AS
SELECT year, cocoa
FROM portfolioproject.`global production`;

-- Making a table of 2018 and 1961 global percentages
CREATE TABLE cocoa_comparison 
AS
SELECT region, cocoa_production.year, cocoa, (cocoa/global_cocoa)*100 AS global_perc
FROM cocoa_production
INNER JOIN global_cocoa_production ON cocoa_production.year=global_cocoa_production.year
WHERE cocoa_production.year=2018 OR cocoa_production.year=1961
ORDER BY cocoa_production.year desc;

-- Making a table that has only 2018 global percentages
CREATE TABLE cocoa_2018
AS
SELECT region, global_perc 
FROM portfolioproject.cocoa_comparison
WHERE year=2018;

-- Making a table that has only 1961 global percentages
CREATE TABLE cocoa_1961 AS
SELECT region, global_perc 
FROM portfolioproject.cocoa_comparison
WHERE year=1961;

-- Making a table that shows net changes
CREATE TABLE cocoa_net_change
AS
SELECT 
	cocoa_1961.region, 
    1961_global_perc, 
    2018_global_perc, 
    ((2018_global_perc - 1961_global_perc)/1961_global_perc)*100 AS net_change
FROM cocoa_1961
INNER JOIN cocoa_2018 ON cocoa_1961.region=cocoa_2018.region;

-- Creating a view for net change of cocoa production
CREATE VIEW cocoa_NetChanges
AS
SELECT *
FROM cocoa_net_change;