WITH
    L AS (
        SELECT * FROM {{ ref('dim_listings_cleansed') }}
    ),
H AS (
    SELECT * FROM {{ ref('dim_hosts_cleansed') }}
)
SELECT L.LISTING_ID,
       L.LISTING_NAME,
       L.ROOM_TYPE,
       L.MINIMUM_NIGHTS,
       L.PRICE,
       L.HOST_ID,
       H.HOST_NAME,
       H.IS_SUPERHOST AS HOST_IS_SUPERHOST,
       L.CREATED_AT,
       GREATEST(L.UPDATED_AT, H.UPDATED_AT) AS UPDATED_AT
FROM L
LEFT JOIN H ON H.HOST_ID = L.HOST_ID