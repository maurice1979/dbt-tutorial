with customers as (

    select
        id as customer_id,
        name as customer_name

    from public.raw_customers

),

orders as (

    select
        id as order_id,
        customer as customer_id,
        ordered_at as order_date,
        order_total

    from public.raw_orders

),

customer_orders as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders

    group by 1

),

final as (

    select
        customers.customer_id,
        customer_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers

    left join customer_orders using (customer_id)

)

select * from final