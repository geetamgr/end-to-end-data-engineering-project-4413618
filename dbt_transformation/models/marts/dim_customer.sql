
with
    customer as (
        select * from {{ ref("stg_customer") }}
    ),

    customerorder as (
        select * from {{ ref("stg_customerorder") }}
    ),

    customer_order as (
        select
            c.customerid,
            c.email,
            c.name,
            c.phonenumber,
            c.dateregistered,
            min(co.orderdate) as first_order_date,
            max(co.orderdate) as most_recent_order_date,
            count(co.orderid) as number_of_orders
        from customerorder co
        inner join customer c using (customerid)
        group by
            c.customerid,
            c.email,
            c.name,
            c.phonenumber,
            c.dateregistered
    )

select *
from customer_order
