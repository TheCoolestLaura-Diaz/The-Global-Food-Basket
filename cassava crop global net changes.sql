-- Looking at the regions' percentage of global cassava production
-- Making table of cassava production

-- CREATE TABLE cassava_production AS
-- SELECT region, year, cassava
-- FROM portfolioproject.`crops excel`;

-- Making table of global cassava numbers
-- CREATE TABLE global_cassava_production AS
-- SELECT year, cassava
-- FROM portfolioproject.`global production`;

-- Making a table of 2018 and 1961 global percentages
-- CREATE TABLE cassava_comparison AS
-- SELECT region, cassava_production.year, cassava, (cassava/global_cassava)*100 AS global_perc
-- FROM cassava_production
-- INNER JOIN global_cassava_production ON cassava_production.year=global_cassava_production.year
-- WHERE cassava_production.year=2018 OR cassava_production.year=1961
-- ORDER BY cassava_production.year desc;

-- Making a table that has only 2018 global percentages
-- CREATE TABLE cassava_2018
-- AS
-- SELECT region, global_perc 
-- FROM portfolioproject.cassava_comparison
-- WHERE year=2018;

-- Making a table that has only 1961 global percentages
-- CREATE TABLE cassava_1961
-- AS
-- SELECT region, global_perc 
-- FROM portfolioproject.cassava_comparison
-- WHERE year=1961;

-- Making a table that shows net changes
-- CREATE TABLE cassava_net_change
-- AS
-- SELECT 
	-- cassava_1961.region, 
    -- 1961_global_perc, 
    -- 2018_global_perc, 
    -- ((2018_global_perc - 1961_global_perc)/1961_global_perc)*100 AS net_change
-- FROM cassava_1961
-- INNER JOIN cassava_2018 ON cassava_1961.region=cassava_2018.region;

-- Creating a view for net change of cassava production
-- CREATE VIEW cassava_NetChanges
-- AS
-- SELECT *
-- FROM cassava_net_change;