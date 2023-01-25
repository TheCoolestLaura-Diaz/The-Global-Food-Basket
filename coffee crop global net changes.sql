-- Looking at the regions' percentage of global coffee production
-- Making table of coffee production

CREATE TABLE coffee_production AS
SELECT region, year, coffee
FROM portfolioproject.`crops excel`;

-- Making table of global coffee numbers
CREATE TABLE global_coffee_production AS
SELECT year, coffee
FROM portfolioproject.`global production`;

-- Making a table of 2018 and 1961 global percentages
CREATE TABLE coffee_comparison 
AS
SELECT region, coffee_production.year, coffee, (coffee/global_coffee)*100 AS global_perc
FROM coffee_production
INNER JOIN global_coffee_production ON coffee_production.year=global_coffee_production.year
WHERE coffee_production.year=2018 OR coffee_production.year=1961
ORDER BY coffee_production.year desc;

-- Making a table that has only 2018 global percentages
CREATE TABLE coffee_2018
AS
SELECT region, global_perc 
FROM portfolioproject.coffee_comparison
WHERE year=2018;

-- Making a table that has only 1961 global percentages
CREATE TABLE coffee_1961 AS
SELECT region, global_perc 
FROM portfolioproject.coffee_comparison
WHERE year=1961;

-- Making a table that shows net changes
CREATE TABLE coffee_net_change
AS
SELECT 
	coffee_1961.region, 
    1961_global_perc, 
    2018_global_perc, 
    ((2018_global_perc - 1961_global_perc)/1961_global_perc)*100 AS net_change
FROM coffee_1961
INNER JOIN coffee_2018 ON coffee_1961.region=coffee_2018.region;

-- Creating a view for net change of coffee production
CREATE VIEW coffee_NetChanges
AS
SELECT *
FROM coffee_net_change;