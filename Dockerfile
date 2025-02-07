# Use the official PostgreSQL image
FROM postgres:15

# Set environment variables for PostgreSQL
ENV POSTGRES_USER=dbt_user
ENV POSTGRES_PASSWORD=dbt_password
ENV POSTGRES_DB=jaffle_shop

# Expose PostgreSQL port
EXPOSE 5432