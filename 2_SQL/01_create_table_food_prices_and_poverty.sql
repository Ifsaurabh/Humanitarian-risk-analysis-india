CREATE TABLE cleaned_food_prices (
    state_name TEXT,
    district_name TEXT,
    market TEXT,
    commodity_group TEXT,
    commodity TEXT,
    unit_of_measure TEXT,
    price_local NUMERIC,
    currency TEXT,
    price_flag TEXT,
    price_type TEXT,
    data_period_start DATE,
    data_period_end DATE,
    latitude NUMERIC,
    longitude NUMERIC,
    year INT
);

CREATE TABLE cleaned_poverty (
    state_name TEXT,
    multidimensional_poverty_index NUMERIC,
    poverty_headcount_ratio NUMERIC,
    poverty_intensity NUMERIC,
    vulnerability_rate NUMERIC,
    severe_poverty_rate NUMERIC,
    data_period_start DATE,
    year INT
);
