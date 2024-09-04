use sql_class_5;

select user_id,spend,transaction_date,
row_number() over(partition by user_id order by transaction_date) as salrank
from transactions
having salrank = 3
order by spend desc;

with rann as(
select user_id,spend,transaction_date,
row_number() over(partition by transaction_date order by spend) as salrank
from transactions
having salrank = 3
order by spend desc)
select user_id,spend,transaction_date, salrank
from rann;
