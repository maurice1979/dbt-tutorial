# dbt-tutorial

This tutorial is based on the official [dbt Quickstart guide](https://docs.getdbt.com/guides). 


## Virtual environment

This repository uses uv to handle the virtual environment in which the dbt tutorial is run. 

Run the command from the dbt tutorial with `uv run <command>`. 

Activate your uv environment with:

```bash
source .venv/bin/activate
```

> [!TIP]
> If you have other dbt environment in your computer, it might be necessary to re-refine some environment variables:
>
> `export DBT_PROFILES_DIR=/<path-to-your>/.dbt`
>
> `export DBT_TARGET=<your-target>`
>
> `uv` will not overide existing environment variables!

Recommended: Unset existing environment variables (and use uv with the `--env-file=.env` option):

```bash
unset DBT_TARGET
unset DBT_PROFILES_DIR
```

Overwrite the existing environment variables

```bash
export DBT_PROFILES_DIR=~/.dbt
export DBT_TARGET=dev
```

# Create a Docker container for the Database

Since we do not want to use a cloud database, we are going to create a container with a postgresql DB that will be used for the tutorial.


```bash
docker build -t postgres_dbt .
```

Start the container with:

```bash
docker run --env-file .env --name jaffle_shop_db -p 5432:5432 -d postgres_dbt
```

# Jaffle shop data

This project does not include the data from the jaffle shop. Download the data from [this repository](https://github.com/dbt-labs/jaffle-shop-data) and put the content in the folder called `jaffle-data`

# Steps

Once the docker container is created and running

1. cd jaffle_shop
2. uv run --env-file=.env dbt debug
3. uv run --env-file=.env dbt run
4. uv run --env-file=.env dbt seed # to load the jaffle-data into the database.
