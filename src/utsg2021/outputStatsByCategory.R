outputStatsByCategory <- function(s, y) {
  c(
    "City", "Age", "Inc", "Edc", "Gen", "Chl",
    "Raa", "Rab", "Ran", "Raw", "Rao",
    "Hel", "Vdc", "Rem", "Ngh"
  ) %>%
    map(~ {
      table(s[, .x], y$biz_all)
    })
}