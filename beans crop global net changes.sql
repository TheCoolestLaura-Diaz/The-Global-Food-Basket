-- Looking at the regions' percentage of global beans production
-- Making table of beans production

-- CREATE TABLE beans_production AS
-- SELECT region, year, beans
-- FROM portfolioproject.`crops excel`;

-- Making table of global beans numbers
-- CREATE TABLE global_beans_production
-- AS
-- SELECT year, beans
-- FROM portfolioproject.`global production`;

-- Making a table of 2018 and 1961 global percentages
-- CREATE TABLE beans_comparison
-- AS
-- SELECT region, beans_production.year, beans, (beans/global_beans)*100 AS global_perc
-- FROM beans_production
-- INNER JOIN global_beans_production ON beans_production.year=global_beans_production.year
-- WHERE beans_production.year=2018 OR beans_production.year=1961
-- ORDER BY beans_production.year desc;

-- Making a table that has only 2018 global percentages
-- CREATE TABLE beans_2018
-- AS
-- SELECT region, global_perc 
-- FROM portfolioproject.beans_comparison
-- WHERE year=2018;

-- Making a table that has only 1961 global percentages
-- CREATE TABLE beans_1961
-- AS
-- SELECT region, global_perc 
-- FROM portfolioproject.beans_comparison
-- WHERE year=1961;

-- Making a table that shows net changes
-- CREATE TABLE beans_net_change
-- AS
-- SELECT 
	-- beans_1961.region, 
    -- 1961_global_perc, 
    -- 2018_global_perc, 
    -- ((2018_global_perc - 1961_global_perc)/1961_global_perc)*100 AS net_change
-- FROM beans_1961
-- INNER JOIN beans_2018 ON beans_1961.region=beans_2018.region;

-- Creating a view for net change of beans production
-- CREATE VIEW beans_NetChanges
-- AS
-- SELECT *
-- FROM beans_net_change;