-- Looking at the regions' percentage of global grape production
-- Making table of grape production

-- CREATE TABLE grape_production AS
-- SELECT region, year, grapes
-- FROM portfolioproject.`crops excel`;

-- Making table of global grape numbers
-- CREATE TABLE global_grape_production
-- AS
-- SELECT year, grapes
-- FROM portfolioproject.`global production`;

-- Making a table of 2018 and 1961 global percentages
-- CREATE TABLE grape_comparison
-- AS
-- SELECT region, grape_production.year, grapes, (grapes/global_grapes)*100 AS global_perc
-- FROM grape_production
-- INNER JOIN global_grape_production ON grape_production.year=global_grape_production.year
-- WHERE grape_production.year=2018 OR grape_production.year=1961
-- ORDER BY grape_production.year desc;

-- Making a table that has only 2018 global percentages
-- CREATE TABLE grapes_2018
-- AS
-- SELECT region, global_perc 
-- FROM portfolioproject.grape_comparison
-- WHERE year=2018;

-- Making a table that has only 1961 global percentages
-- CREATE TABLE grapes_1961
-- AS
-- SELECT region, global_perc 
-- FROM portfolioproject.grape_comparison
-- WHERE year=1961;

-- Making a table that shows net changes
-- CREATE TABLE grapes_net_change
-- AS
-- SELECT 
	-- grapes_1961.region, 
    -- 1961_global_perc, 
    -- 2018_global_perc, 
    -- ((2018_global_perc - 1961_global_perc)/1961_global_perc)*100 AS net_change
-- FROM grapes_1961
-- INNER JOIN grapes_2018 ON grapes_1961.region=grapes_2018.region;

-- Creating a view for net change of avocado production
-- CREATE VIEW grapes_NetChanges
-- AS
-- SELECT *
-- FROM grapes_net_change;