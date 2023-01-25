-- Looking at the regions' percentage of global cashew production
-- Making table of cashew production

-- CREATE TABLE cashew_production AS
-- SELECT region, year, cashew
-- FROM portfolioproject.`crops excel`;

-- Making table of global cashew numbers
-- CREATE TABLE global_cashew_production AS
-- SELECT year, cashew
-- FROM portfolioproject.`global production`;

-- Making a table of 2018 and 1961 global percentages
-- CREATE TABLE cashew_comparison 
-- AS
-- SELECT region, cashew_production.year, cashew, (cashew/global_cashew)*100 AS global_perc
-- FROM cashew_production
-- INNER JOIN global_cashew_production ON cashew_production.year=global_cashew_production.year
-- WHERE cashew_production.year=2018 OR cashew_production.year=1961
-- ORDER BY cashew_production.year desc;

-- Making a table that has only 2018 global percentages
-- CREATE TABLE cashew_2018
-- AS
-- SELECT region, global_perc 
-- FROM portfolioproject.cashew_comparison
-- WHERE year=2018;

-- Making a table that has only 1961 global percentages
-- CREATE TABLE cashew_1961
-- AS
-- SELECT region, global_perc 
-- FROM portfolioproject.cashew_comparison
-- WHERE year=1961;

-- Making a table that shows net changes
-- CREATE TABLE cashew_net_change
-- AS
-- SELECT 
	-- cashew_1961.region, 
    -- 1961_global_perc, 
    -- 2018_global_perc, 
    -- ((2018_global_perc - 1961_global_perc)/1961_global_perc)*100 AS net_change
-- FROM cashew_1961
-- INNER JOIN cashew_2018 ON cashew_1961.region=cashew_2018.region;

-- Creating a view for net change of cassava production
-- CREATE VIEW cashew_NetChanges
-- AS
-- SELECT *
-- FROM cashew_net_change;