select customerid, email, name, dateregistered, phonenumber
from {{ source("raw_dataset", "customer") }}

