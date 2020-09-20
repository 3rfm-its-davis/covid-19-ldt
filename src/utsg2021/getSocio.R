getSocio <- function(raw, y) {
  socio <- raw %>%
    inner_join(y, by = "ResponseId") %>%
    select(c(
      "ResponseId", "City", "B02_5", "D01",
      "D09_2", "C07", "C12_3", "C12_13", "C13_3",
      "I01_1", "I04_2", "I04_3", "I04_1", "I04_5",
      "I04_4", "I05", "I09_USD", "I07", "I12"
    )) %>%
    mutate(Age = cut(I01_1, c(1920, 1965, 1980, 1995, 2010),
      labels = c("(1920-1965]", "(1965-1980]", "(1980-1995]", "(1995-2010]")
    )) %>%
    mutate(Gen = case_when(
      I05 == 2 ~ "Male",
      I05 != 2 ~ "Non-Male"
    )) %>%
    mutate(Edc = case_when(I07 > 3 ~ ">=Bachelor", I07 < 4 ~ "<Bachelor")) %>%
    mutate(Chl = case_when(D09_2 > 0 ~ "Yes", D09_2 == 0 ~ "No")) %>%
    mutate(Inc = case_when(
      I09_USD < 3 ~ "<50,000",
      I09_USD > 4 ~ ">=100,000",
      T ~ "50,000-99,999"
    )) %>%
    mutate(Rem = case_when(C07 == 0 ~ "No", C07 > 0 ~ "Yes")) %>%
    mutate(Hel = C12_3 - 3) %>%
    mutate(Vdc = C12_13 - 3) %>%
    mutate(Fut = case_when(
      C13_3 < 3 ~ "less",
      C13_3 > 3 ~ "more",
      T ~ "same"
    )) %>%
    mutate(Raa = case_when(I04_1 == 1 ~ "Yes", I04_1 == 0 ~ "No")) %>%
    mutate(Rab = case_when(I04_2 == 1 ~ "Yes", I04_2 == 0 ~ "No")) %>%
    mutate(Ran = case_when(I04_3 == 1 ~ "Yes", I04_3 == 0 ~ "No")) %>%
    mutate(Raw = case_when(I04_4 == 1 ~ "Yes", I04_4 == 0 ~ "No")) %>%
    mutate(Rao = case_when(I04_5 == 1 ~ "Yes", I04_5 == 0 ~ "No")) %>%
    mutate(Ngh = case_when(D01 == 1 ~ "Urban", D01 > 1 ~ "Non-Urban")) %>%
    mutate(City = case_when(
      City %in% c(
        "LA", "SF", "Sacramento",
        "Seattle", "SD", "Denver", "SLC"
      ) ~ "West",
      City %in% c("Kansas", "Detroit", "Chicago") ~ "Midwest",
      City %in% c("Atlanta", "Tampa", "DC") ~ "South",
      City %in% c("NYC", "Boston") ~ "Northeast"
    )) %>%
    mutate_at(c(
      "City", "Age", "Inc", "Edc",
      "Rem", "Gen", "Ngh", "Raa", "Rab",
      "Ran", "Raw", "Rao"
    ), as.factor) %>%
    mutate(Age = factor(Age, levels = c(
      "(1965-1980]",
      "(1995-2010]",
      "(1980-1995]",
      "(1920-1965]"
    ))) %>%
    mutate(Inc = factor(Inc, levels = c(
      "<50,000",
      "50,000-99,999",
      ">=100,000"
    ))) %>%
    mutate(Raa = factor(Raa, levels = c("No", "Yes"))) %>%
    mutate(Rab = factor(Rab, levels = c("No", "Yes"))) %>%
    mutate(Ran = factor(Ran, levels = c("No", "Yes"))) %>%
    mutate(Raw = factor(Raw, levels = c("No", "Yes"))) %>%
    mutate(Rao = factor(Rao, levels = c("No", "Yes"))) %>%
    mutate(Chl = factor(Chl, levels = c("No", "Yes"))) %>%
    mutate(Edc = factor(Edc, levels = c("<Bachelor", ">=Bachelor"))) %>%
    mutate(Fut = factor(Fut, levels = c("less", "same", "more"))) %>%
    mutate(Ngh = factor(Ngh, levels = c("Urban", "Non-Urban"))) %>%
    mutate(Rem = factor(Rem, levels = c("No", "Yes"))) %>%
    mutate(City = factor(City, levels = c(
      "West",
      "Midwest",
      "South",
      "Northeast"
    ))) %>%
    mutate_at(c(
      "City", "Age", "Inc", "Edc", "Rem",
      "Gen", "Ngh", "Raa", "Rab", "Ran",
      "Raw", "Rao", "Chl", "Fut"
    ), as.numeric) %>%
    select(
      ResponseId, City, Age, Inc, Hel,
      Vdc, Rem, Edc, Chl, Gen,
      Ngh, Raa, Rab, Ran, Raw,
      Rao, Fut
    )

  return(socio)
}