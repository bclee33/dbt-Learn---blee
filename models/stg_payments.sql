select id as payment_id,
       orderid as order_id,
       paymentmethod as payment_method,
       status,
       amount * .01 as amount_dollars,
       created as created_at
from raw.stripe.payment
