# DBT - Dagster Project Setup

## Introduction
This project is a working setup of DBT and Dagster combo with Snowflake database.  The setup follows the official guide and thus placing the Dagster project inside the DBT folder.  We could potentially take the Dagster folder out, but it might require some tweaking.

## Configuration
First set the environment variables in the .env_sample file in the airbnb_dbt folder and change the file name to .env. It is expected that **direnv** is installed in your system so we load the values inside the .env file.
```
DAGSTER_HOME=
DAGSTER_DBT_PARSE_PROJECT_ON_LOAD=1
SNOWFLAKE_ACCOUNT=
SNOWFLAKE_DB=AIRBNB
SNOWFLAKE_PASSWORD=
SNOWFLAKE_ROLE=
SNOWFLAKE_SCHEMA=
SNOWFLAKE_USER=
SNOWFLAKE_WAREHOUSE=
```

Check if your values are all correct by running the following command.  You should get an *All checks passed!* message if everything is good.

```bash
cd airbnb_db # if you are not already inside the folder
dbt debug
```

## Launch Dagster
To launch the Dagster instance run the following commands.

```
dagster dev
```