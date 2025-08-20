-- Preview the joined data
SELECT * FROM food_poverty_joined LIMIT 20;

-- Join success check
SELECT 
    COUNT(*) AS total_rows,
    COUNT(multidimensional_poverty_index) AS matched_poverty_rows
FROM food_poverty_joined;

--Summary stats
SELECT 
    AVG(price_local) AS avg_price,
    AVG(multidimensional_poverty_index) AS avg_mpi,
    AVG(poverty_weighted_price) AS avg_weighted_price
FROM food_poverty_joined;

-- Top states by poverty- weighted price
SELECT 
    state_name,
    ROUND(AVG(poverty_weighted_price), 2) AS avg_weighted_price
FROM food_poverty_joined
WHERE poverty_weighted_price IS NOT NULL
GROUP BY state_name
ORDER BY avg_weighted_price DESC
LIMIT 10;

-- Commodity volatility in high-poverty states
SELECT 
    state_name,
    commodity,
    ROUND(AVG(price_local), 2) AS avg_price,
    ROUND(STDDEV(price_local), 2) AS price_volatility
FROM food_poverty_joined
WHERE multidimensional_poverty_index > 0.3
GROUP BY state_name, commodity
ORDER BY price_volatility DESC
LIMIT 15;


-- Find outliers
SELECT 
    state_name,
    market,
    commodity,
    price_local,
    poverty_headcount_ratio,
    ROUND(price_to_poverty_ratio, 2) AS ratio
FROM food_poverty_joined
WHERE price_to_poverty_ratio > 100
ORDER BY ratio DESC
LIMIT 10;
