-- Reformatted frequency query from the team report, Appendix D.
-- Denominator: customers in dim_customer, including zero-order customers if present.
SELECT c.income_group,
       COUNT(DISTINCT c.customer_key) AS customer_count,
       COUNT(f.order_key) AS total_orders,
       ROUND(COUNT(f.order_key) * 1.0 /
             COUNT(DISTINCT c.customer_key), 2) AS avg_orders_per_customer
FROM dim_customer AS c
LEFT JOIN fact_order AS f ON c.customer_key = f.customer_key
GROUP BY c.income_group, c.income_group_order
ORDER BY c.income_group_order;
