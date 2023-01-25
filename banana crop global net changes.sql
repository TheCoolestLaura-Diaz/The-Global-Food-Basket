-- Looking at the regions' percentage of global banana production
-- Making table of banana production

-- CREATE TABLE banana_production AS
-- SELECT region, year, bananas
-- FROM portfolioproject.`crops excel`;

-- Making table of global banana numbers
-- CREATE TABLE global_banana_production
-- AS
-- SELECT year, bananas
-- FROM portfolioproject.`global production`;

-- Making a table of 2018 and 1961 global percentages
-- CREATE TABLE banana_comparison
-- AS
-- SELECT region, banana_production.year, bananas, (bananas/global_bananas)*100 AS global_perc
-- FROM banana_production
-- INNER JOIN global_banana_production ON banana_production.year=global_banana_production.year
-- WHERE banana_production.year=2018 OR banana_production.year=1961
-- ORDER BY banana_production.year desc;

-- Making a table that has only 2018 global percentages
-- CREATE TABLE bananas_2018
-- AS
-- SELECT region, global_perc 
-- FROM portfolioproject.banana_comparison
-- WHERE year=2018;

-- Making a table that has only 1961 global percentages
-- CREATE TABLE bananas_1961
-- AS
-- SELECT region, global_perc 
-- FROM portfolioproject.banana_comparison
-- WHERE year=1961;

-- Making a table that shows net changes
-- CREATE TABLE bananas_net_change
-- AS
-- SELECT 
	-- bananas_1961.region, 
    -- 1961_global_perc, 
    -- 2018_global_perc, 
    -- ((2018_global_perc - 1961_global_perc)/1961_global_perc)*100 AS net_change
-- FROM bananas_1961
-- INNER JOIN bananas_2018 ON bananas_1961.region=bananas_2018.region;

-- Creating a view for net change of avocado production
-- CREATE VIEW bananas_NetChanges
-- AS
-- SELECT *
-- FROM bananas_net_change;