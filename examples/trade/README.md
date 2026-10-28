# Trade data preparation

My main work: cleaning data and reviewing/revising completed dashboard pages. The screenshot is an actual team Power BI output extracted from the submitted presentation. It is static, not an embedded dashboard.

prepare_indicators.R is a portfolio adaptation of selected team workflow steps, not the original full script. Inputs must already be filtered to 2023. It shows country-code joins and conversion from USD to USD millions. Trade values are assumed to be in USD millions; the original source units have not been independently reconciled.

Added for the portfolio: input-based paths, duplicate-key checks, retained missing values. Original code filled some missing economic indicators with zero; the adaptation does not reproduce those choices. Aggregation assumes additive trade rows; source grain should be checked before treating a repeated country-indicator value as something to sum.

The supplied prepared 2023 export has 164 rows/economies. This differs from the dashboard's 2013–2023 scope. No R execution, source reconciliation, causal effect or complete clustering validation is claimed. Original student information and local personal paths are omitted.
