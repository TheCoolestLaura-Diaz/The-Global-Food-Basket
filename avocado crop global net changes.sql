-- Looking at the regions' percentage of global avocado production
-- Making table of avocado production
-- CREATE TABLE avocado_production
-- SELECT region, year, avocados
-- FROM portfolioproject.`crops excel`;

-- Making table of global avocado numbers
-- CREATE TABLE global_avocado_production
-- AS
-- SELECT year, avocados
-- FROM portfolioproject.`global production`;

-- Making a table of 2018 and 1961 global percentages
-- CREATE TABLE avocado_comparison
-- AS
-- SELECT region, avocado_production.year, avocados, (avocados/global_avocados)*100 AS global_perc
-- FROM avocado_production
-- INNER JOIN global_avocado_production ON avocado_production.year=global_avocado_production.year
-- WHERE avocado_production.year=2018 OR avocado_production.year=1961
-- ORDER BY avocado_production.year desc;

-- Making a table that has only 2018 global percentages
-- CREATE TABLE avocados_2018
-- AS
-- SELECT region, global_perc 
-- FROM portfolioproject.avocado_comparison
-- WHERE year=2018;

-- Making a table that has only 1961 global percentages
-- CREATE TABLE avocados_1961
-- AS
-- SELECT region, global_perc 
-- FROM portfolioproject.avocado_comparison
-- WHERE year=1961;

-- Making a table that shows net changes
-- CREATE TABLE avocados_net_change
-- AS
-- SELECT 
	-- avocados_1961.region, 
    -- 1961_global_perc, 
    -- 2018_global_perc, 
    -- ((2018_global_perc - 1961_global_perc)/1961_global_perc)*100 AS net_change
-- FROM avocados_1961
-- INNER JOIN avocados_2018 ON avocados_1961.region=avocados_2018.region;

-- Creating a view for net change of avocado production
CREATE VIEW Avocados_NetChanges
AS
SELECT *
FROM avocados_net_change;