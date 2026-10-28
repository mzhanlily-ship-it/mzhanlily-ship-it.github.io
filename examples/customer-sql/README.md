# Customer analysis SQL

frequency.sql is a reformatted excerpt of the submitted team report Appendix D. My work focused on Question 1 SQL and group coordination, based on my current recollection. Individual query authorship has not been independently checked; the broader database and report were team outputs.

Run: python verify_sql.py

The test uses invented in-memory data to compare the dimension-table and active-customer denominators, zero-order customers, and COUNT(order_key) behaviour. Whether the original dimension includes every registered customer has not been verified. It does not reproduce original findings.

Page results are report aggregates (pp8–9). The original spending denominator and customer-table coverage have not been independently checked. The original SQLite file failed to read; original metrics have not been independently regenerated. No names, emails, credentials or individual records are included.
