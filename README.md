# dbt-tutorial

This tutorial is based on the official [dbt Quickstart guide](https://docs.getdbt.com/guides). 


## Virtual environment

This repository uses uv to handle the virtual environment in which the dbt tutorial is run. 

Run the command from the dbt tutorial with `uv run <command>`. 

> [!TIP]
> If you have other dbt environment in your computer, it might be necessary to re-refine some environment variables:
> `export DBT_PROFILES_DIR=/<path-to-your>/.dbt`
> `export DBT_TARGET=<your-target>`

# Create a Docker container for the Database

Since we do not want to use a cloud database, we are going to create a container with a postgresql DB that will be used for the tutorial.


```bash
docker build -t postgres_dbt .
```

Start the container with:

```bash
docker run --name jaffle_shop_db -p 5432:5432 -d postgres_dbt
```

# Jaffle shop data

This project does not include the data from the jaffle shop. Download the data from [this repository](https://github.com/dbt-labs/jaffle-shop-data) and put the content in the folder called `jaffle-data`

# Steps

Once the docker container is created and running

1. cd jaffle_shop
2. uv run dbt debug
3. uv run dbt run
4. uv run dbt seed # to load the jaffle-data into the database.
