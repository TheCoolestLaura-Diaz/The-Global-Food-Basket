-- Looking at the regions' percentage of global tomato production
-- Making table of tomato production

-- CREATE TABLE tomato_production AS
-- SELECT region, year, tomatoes
-- FROM portfolioproject.`crops excel`;

-- Making table of global orange numbers
-- CREATE TABLE global_tomato_production
-- AS
-- SELECT year, tomatoes
-- FROM portfolioproject.`global production`;

-- Making a table of 2018 and 1961 global percentages
-- CREATE TABLE tomato_comparison
-- AS
-- SELECT region, tomato_production.year, tomatoes, (tomatoes/global_tomatoes)*100 AS global_perc
-- FROM tomato_production
-- INNER JOIN global_tomato_production ON tomato_production.year=global_tomato_production.year
-- WHERE tomato_production.year=2018 OR tomato_production.year=1961
-- ORDER BY tomato_production.year desc;

-- Making a table that has only 2018 global percentages
-- CREATE TABLE tomatoes_2018
-- AS
-- SELECT region, global_perc 
-- FROM portfolioproject.tomato_comparison
-- WHERE year=2018;

-- Making a table that has only 1961 global percentages
-- CREATE TABLE tomatoes_1961
-- AS
-- SELECT region, global_perc 
-- FROM portfolioproject.tomato_comparison
-- WHERE year=1961;

-- Making a table that shows net changes
-- CREATE TABLE tomatoes_net_change
-- AS
-- SELECT 
	-- tomatoes_1961.region, 
    -- 1961_global_perc, 
    -- 2018_global_perc, 
    -- ((2018_global_perc - 1961_global_perc)/1961_global_perc)*100 AS net_change
-- FROM tomatoes_1961
-- INNER JOIN tomatoes_2018 ON tomatoes_1961.region=tomatoes_2018.region;

-- Creating a view for net change of avocado production
-- CREATE VIEW tomatoes_NetChanges
-- AS
-- SELECT *
-- FROM tomatoes_net_change;