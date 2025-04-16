WITH mart_fullmoon_reviews AS (
    SELECT * FROM {{ ref('mart_fullmoon_reviews') }}
)
SELECT
    IS_FULL_MOON,
    REVIEW_SENTIMENT,
    COUNT(*) AS REVIEWS
FROM mart_fullmoon_reviews
GROUP BY IS_FULL_MOON, REVIEW_SENTIMENT
ORDER BY IS_FULL_MOON, REVIEW_SENTIMENT