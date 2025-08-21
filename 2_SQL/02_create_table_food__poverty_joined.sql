CREATE TABLE food_poverty_joined AS
SELECT
    fp.*,
    pv.multidimensional_poverty_index,
    pv.poverty_headcount_ratio,
    pv.poverty_intensity,
    pv.vulnerability_rate,
    pv.severe_poverty_rate,

    -- Derived features
    (fp.price_local / NULLIF(pv.poverty_headcount_ratio, 0)) AS price_to_poverty_ratio,
    (fp.price_local * pv.multidimensional_poverty_index) AS poverty_weighted_price

FROM
    cleaned_food_prices fp
LEFT JOIN
    cleaned_poverty pv
ON
    fp.state_name = pv.state_name
    AND fp.year = pv.year;
