with orders as (
    select * from {{ ref('stg_orders')}}
),

payments as (
    select * from {{ ref('stg_payments')}}
),

final as (
select  o.order_id, 
        o.customer_id, 
        o.order_date, 
        SUM(p.amount_dollars) as total_amount
 from orders as O 
 left join payments as p 
    on O.order_id = P.order_id
where p.status <> 'fail'
group by o.order_id, o.customer_id, o.order_date 

)

select * from final 
