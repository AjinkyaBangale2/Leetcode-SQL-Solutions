# https://leetcode.com/problems/sales-analysis-iii/

select s.product_id, p.product_name
from sales s, product p
where s.product_id = p.product_id
group by s.product_id, p.product_name
having min(s.sale_date) >= '2019-01-01' 
    and max(s.sale_date) <= '2019-03-31'