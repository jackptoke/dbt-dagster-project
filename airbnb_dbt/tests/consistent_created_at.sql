SELECT * FROM {{ ref('fct_reviews') }} F
JOIN {{ ref('dim_listings_cleansed') }} L
ON L.LISTING_ID = F.LISTING_ID
WHERE TO_DATE(F.REVIEW_DATE) <= TO_DATE(L.CREATED_AT)