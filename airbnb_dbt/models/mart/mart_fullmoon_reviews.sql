{{ config(materialized = 'table') }}
WITH FCT_REVIEWS AS (
    SELECT * FROM {{ ref('fct_reviews') }}
),
FULL_MOON_DATES AS (
    SELECT * FROM {{ ref('seed_full_moon_dates') }}
)
SELECT r.*,
       CASE
           WHEN F.FULL_MOON_DATE IS NULL THEN 'not full moon'
            ELSE 'full moon'
        END AS IS_FULL_MOON
FROM FCT_REVIEWS R
LEFT JOIN FULL_MOON_DATES F
ON TO_DATE(R.REVIEW_DATE) = DATEADD(DAY, 1, F.FULL_MOON_DATE)