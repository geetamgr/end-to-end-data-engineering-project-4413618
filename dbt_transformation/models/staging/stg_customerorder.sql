select
    orderid,
    orderdate,
    orderstatus,
    customerid,
    totalamount
from {{ source("raw_dataset", "customerorder") }}