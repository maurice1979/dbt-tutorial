-- Use the `ref` function to select from other models

select *
from "jaffle_shop"."public"."my_first_dbt_model"
where id = 1