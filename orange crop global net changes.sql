-- Looking at the regions' percentage of global orange production
-- Making table of orange production

-- CREATE TABLE orange_production AS
-- SELECT region, year, oranges
-- FROM portfolioproject.`crops excel`;

-- Making table of global orange numbers
-- CREATE TABLE global_orange_production
-- AS
-- SELECT year, oranges
-- FROM portfolioproject.`global production`;

-- Making a table of 2018 and 1961 global percentages
-- CREATE TABLE orange_comparison
-- AS
-- SELECT region, orange_production.year, oranges, (oranges/global_oranges)*100 AS global_perc
-- FROM orange_production
-- INNER JOIN global_orange_production ON orange_production.year=global_orange_production.year
-- WHERE orange_production.year=2018 OR orange_production.year=1961
-- ORDER BY orange_production.year desc;

-- Making a table that has only 2018 global percentages
-- CREATE TABLE oranges_2018
-- AS
-- SELECT region, global_perc 
-- FROM portfolioproject.orange_comparison
-- WHERE year=2018;

-- Making a table that has only 1961 global percentages
-- CREATE TABLE oranges_1961
-- AS
-- SELECT region, global_perc 
-- FROM portfolioproject.orange_comparison
-- WHERE year=1961;

-- Making a table that shows net changes
-- CREATE TABLE oranges_net_change
-- AS
-- SELECT 
	-- oranges_1961.region, 
    -- 1961_global_perc, 
    -- 2018_global_perc, 
    -- ((2018_global_perc - 1961_global_perc)/1961_global_perc)*100 AS net_change
-- FROM oranges_1961
-- INNER JOIN oranges_2018 ON oranges_1961.region=oranges_2018.region;

-- Creating a view for net change of avocado production
-- CREATE VIEW oranges_NetChanges
-- AS
-- SELECT *
-- FROM oranges_net_change;