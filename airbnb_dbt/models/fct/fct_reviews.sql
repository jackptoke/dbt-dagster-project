{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
        )
 }}
WITH SRC_REVIEWS AS (
    SELECT * FROM {{ ref('src_reviews') }}
)
SELECT
    {{ dbt_utils.generate_surrogate_key(['LISTING_ID', 'REVIEW_DATE', 'REVIEWER_NAME', 'REVIEW_TEXT']) }} as REVIEW_ID,
    * FROM SRC_REVIEWS
WHERE REVIEW_TEXT IS NOT NULL
{%  if is_incremental() %}
    {% if var("start_date", False) and var("end_date", False) %}
        {{ log('Loading' ~ this ~ 'incrementally (start_date: ' ~ var("start_date") ~ ', end_date: ' ~ var("end_date")) }}
        AND review_date >= '{{ var("start_date") }}'
        AND review_date < '{{ var("end_date") }}'
    {% else %}
        AND REVIEW_DATE > (SELECT MAX(REVIEW_DATE) FROM {{ this }})
        {{  log('Loading' ~ this ~ ' incrementally (all missing dates)', info=True) }}
    {%  endif %}
{% endif %}

