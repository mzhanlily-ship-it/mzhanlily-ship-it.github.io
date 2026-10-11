"""Portfolio-only synthetic fixture. Does not verify the original database."""
import sqlite3
from pathlib import Path
c = sqlite3.connect(':memory:')
c.executescript("""CREATE TABLE dim_customer(customer_key INTEGER PRIMARY KEY,income_group TEXT,income_group_order INTEGER);
CREATE TABLE fact_order(order_key INTEGER PRIMARY KEY,customer_key INTEGER);
INSERT INTO dim_customer VALUES(1,'Example',1),(2,'Example',1),(3,'Example',1);
INSERT INTO fact_order VALUES(10,1),(11,1),(12,2);""")
result=c.execute(Path(__file__).with_name('frequency.sql').read_text()).fetchone()
assert result == ('Example',3,3,1.0), result
active=c.execute('SELECT COUNT(*)*1.0/COUNT(DISTINCT customer_key) FROM fact_order').fetchone()[0]
assert active == 1.5
# COUNT(*) after LEFT JOIN would wrongly count the zero-order customer as an order.
wrong=c.execute('SELECT COUNT(*) FROM dim_customer c LEFT JOIN fact_order f ON c.customer_key=f.customer_key').fetchone()[0]
assert wrong == 4
assert c.execute('SELECT COUNT(*) FROM fact_order f LEFT JOIN dim_customer c ON f.customer_key=c.customer_key WHERE c.customer_key IS NULL').fetchone()[0] == 0
print('PASS: registered vs active denominator, zero-order retention, and order counting. Synthetic data only.')
