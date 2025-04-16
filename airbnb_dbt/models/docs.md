{% docs dim_listing_cleansed_minimum_nights %}
Minimum number of nights required to rent this property.

Keep in mind that the old listings might have `minimum_nights` set to 0 in the source tables.  Our cleansing algorithm updates this to `1`.
{% enddocs %}

{% docs dim_hosts_cleansed %}
This table contains information of all our AirBnb hosts.
{% enddocs %}

{% docs dim_hosts_cleansed_host_id %}
The identifier number of the AirBnb host.
{% enddocs %}