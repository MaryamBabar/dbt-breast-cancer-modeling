with source as (

    select * from {{ ref('breast_cancer_clean') }}

),

transformed as (

    select
        id,
        case 
            when diagnosis = 'M' then 'Malignant'
            when diagnosis = 'B' then 'Benign'
            else 'Unknown'
        end as diagnosis,
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
        -- Add a new calculated column: area to perimeter ratio
        case when perimeter_mean != 0 then area_mean / perimeter_mean else null end as area_perimeter_ratio
    from source
    where diagnosis in ('M', 'B')  -- filter valid diagnosis only

)

select * from transformed
