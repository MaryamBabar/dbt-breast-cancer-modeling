SELECT
  id,
  diagnosis,
  CASE 
    WHEN diagnosis = 'M' THEN 1
    WHEN diagnosis = 'B' THEN 0
    ELSE NULL
  END AS diagnosis_numeric,
  
  radius_mean,
  texture_mean,
  perimeter_mean,
  area_mean,
  smoothness_mean,
  compactness_mean,
  concavity_mean,
  concave_points_mean,
  symmetry_mean,
  fractal_dimension_mean,

  -- Risk flag example
  CASE 
    WHEN radius_worst > 15 THEN 'High Risk'
    ELSE 'Low Risk'
  END AS risk_flag,

  -- Example normalized texture_mean (replace min/max)
  (texture_mean - 9.7) / (39.3 - 9.7) AS texture_mean_normalized,

  radius_worst,
  texture_worst,
  perimeter_worst,
  area_worst,
  smoothness_worst,
  compactness_worst,
  concavity_worst,
  concave_points_worst,
  symmetry_worst,
  fractal_dimension_worst

FROM {{ ref('data') }}  -- assuming your seed or raw data table is named 'data'
