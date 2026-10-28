# Portfolio adaptation of the team's R preparation workflow.
# Inputs: trade(country_code, indicator, value),
# gni(CountryCode, value), fdi(CountryCode, value), all filtered to 2023.
# Assumed units: trade in USD millions; GNI / FDI in USD.
# Added safeguards: duplicate-key checks and retained missing values.
library(dplyr)
library(tidyr)

prepare_indicators <- function(trade, gni, fdi) {
  stopifnot(!anyDuplicated(gni$CountryCode),
            !anyDuplicated(fdi$CountryCode))
  # Summation assumes additive trade rows; verify source grain.
  trade_wide <- trade |>
    group_by(country_code, indicator) |>
    summarise(value = sum(value), .groups = "drop") |>
    pivot_wider(names_from = indicator, values_from = value)
  trade_wide |>
    left_join(gni |> transmute(CountryCode, gni_million = value / 1e6),
              by = c("country_code" = "CountryCode")) |>
    left_join(fdi |> transmute(CountryCode, fdi_million = value / 1e6),
              by = c("country_code" = "CountryCode"))
}
