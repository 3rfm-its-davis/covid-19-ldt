outputStats <- function() {
  socioData <- importData("covidV2") %>%
    filter(City != "Vancouver" & City != "Toronto") %>%
    select(c(
      "ResponseId", "City", "I01_1", "I03", "I04_2",
      "I04_3", "I04_1", "I04_5", "I04_4",
      "I05", "I07", "I09_USD", "S03"
    )) %>%
    mutate(Age = cut(I01_1,
      c(1920, 1965, 1980, 1995, 2010),
      labels = c("(1920-1965]", "(1965-1980]", "(1980-1995]", "(1995-2010]")
    )) %>%
    mutate(Gen = case_when(I05 > 1 ~ "Non-Female", I05 == 1 ~ "Female")) %>%
    mutate(Edc = case_when(I07 > 2 ~ ">=Bachelor", I07 < 3 ~ "<Bachelor")) %>%
    mutate(Inc = case_when(
      I09_USD < 3 ~ "<50,000",
      I09_USD > 4 ~ ">=100,000",
      T ~ "50,000-99,999"
    )) %>%
    mutate(Hsp = case_when(I03 == 1 ~ "Yes", I03 == 0 ~ "No")) %>%
    mutate(Raa = case_when(I04_1 == 1 ~ "Yes", I04_1 == 0 ~ "No")) %>%
    mutate(Rab = case_when(I04_2 == 1 ~ "Yes", I04_2 == 0 ~ "No")) %>%
    mutate(Ran = case_when(I04_3 == 1 ~ "Yes", I04_3 == 0 ~ "No")) %>%
    mutate(Raw = case_when(I04_4 == 1 ~ "Yes", I04_4 == 0 ~ "No")) %>%
    mutate(Rao = case_when(I04_5 == 1 ~ "Yes", I04_5 == 0 ~ "No")) %>%
    mutate(Emp = case_when(S03 == 1 ~ "Yes", S03 == 0 ~ "No")) %>%
    select(
      ResponseId, City, Age, Inc, Edc,
      Gen, Hsp, Raa, Rab, Ran, Raw, Rao, Emp
    )

  c(
    "Age", "Inc", "Edc", "Gen", "Hsp",
    "Raa", "Rab", "Ran", "Raw", "Rao", "Emp"
  ) %>% map(~ {
    table <- table(socioData[, .x], socioData$City)
    table <- cbind(rowSums(table), table)
    colnames(table)[1] <- "Total"
    table
  })
}