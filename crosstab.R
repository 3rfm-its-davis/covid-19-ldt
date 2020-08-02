socioCross = raw %>% selectColumns(c("ResponseId", "City", "B02_5", "D01", "D09_2", "C07", "C12_3", "C12_13", "C13_3", "I01_1", "I04_2", "I04_3", "I04_1", "I04_5", "I04_4", "I05", "I09_USD", "I07", "I12")) %>% 
  mutate(Age = cut(I01_1, c(1920, 1965, 1980, 1995, 2010), labels = c("(1920-1965]","(1965-1980]","(1980-1995]","(1995-2010]"))) %>%
  mutate(Gen = case_when(I05 == 2 ~ "Male", I05 != 2 ~ "Non-Male")) %>%
  mutate(Edc = case_when(I07 > 3 ~ ">=Bachelor", I07 < 4 ~ "<Bachelor")) %>%
  mutate(Chl = case_when(D09_2 > 0 ~ "Yes", D09_2 == 0 ~ "No")) %>%
  mutate(Inc = case_when(I09_USD < 3 ~ "<50,000", I09_USD > 4 ~ ">=100,000", T ~ "50,000-99,999")) %>%
  mutate(Rem = case_when(C07 == 0 ~ "No", C07 > 0 ~ "Yes")) %>%
  mutate(Hel = C12_3 - 3) %>%
  mutate(Vdc = C12_13 - 3) %>%
  mutate(Fut = case_when(C13_3 < 3 ~ "less", C13_3 > 3 ~ "more", T ~ "same"))%>%
  mutate(Raa = case_when(I04_1 == 1 ~ "Yes", I04_1 == 0 ~ "No")) %>%
  mutate(Rab = case_when(I04_2 == 1 ~ "Yes", I04_2 == 0 ~ "No")) %>%
  mutate(Ran = case_when(I04_3 == 1 ~ "Yes", I04_3 == 0 ~ "No")) %>%
  mutate(Raw = case_when(I04_4 == 1 ~ "Yes", I04_4 == 0 ~ "No")) %>%
  mutate(Rao = case_when(I04_5 == 1 ~ "Yes", I04_5 == 0 ~ "No")) %>%
  mutate(Ngh = case_when(D01 == 1 ~ "Urban", D01 > 1 ~ "Non-Urban")) %>%
  mutate(City = case_when(City %in% c("LA", "SF", "Sacramento", "Seattle", "SD", "Denver", "SLC") ~ "West",
                          City %in% c("Kansas", "Detroit", "Chicago") ~ "Midwest",
                          City %in% c("Atlanta", "Tampa", "DC") ~ "South",
                          City %in% c("NYC", "Boston") ~ "Northeast")) %>%
  mutate_at(c("City", "Age", "Inc", "Edc", "Rem", "Gen", "Ngh", "Raa", "Rab", "Ran", "Raw", "Rao"), as.factor) %>%
  mutate(Age = factor(Age, levels = c("(1965-1980]","(1995-2010]","(1980-1995]","(1920-1965]"))) %>%
  mutate(Inc = factor(Inc, levels = c("<50,000","50,000-99,999",">=100,000"))) %>%
  mutate(Raa = factor(Raa, levels = c("No","Yes"))) %>%
  mutate(Rab = factor(Rab, levels = c("No","Yes"))) %>%
  mutate(Ran = factor(Ran, levels = c("No","Yes"))) %>%
  mutate(Raw = factor(Raw, levels = c("No","Yes"))) %>%
  mutate(Rao = factor(Rao, levels = c("No","Yes"))) %>%
  mutate(Chl = factor(Chl, levels = c("No","Yes"))) %>%
  mutate(Edc = factor(Edc, levels = c("<Bachelor",">=Bachelor"))) %>%
  mutate(Ngh = factor(Ngh, levels = c("Urban","Non-Urban"))) %>%
  mutate(Rem = factor(Rem, levels = c("No", "Yes"))) %>%
  mutate(City = factor(City, levels = c("West", "Midwest", "South", "Northeast"))) %>%
  select(ResponseId, City, Age, Inc, Hel, Vdc, Rem, Edc, Chl, Gen, Ngh, Raa, Rab, Ran, Raw, Rao, Fut)

databaseCross = inner_join(joined,socioCross)
colnames(databaseCross)[1] = "ID"
databaseCross$ID = 1:dim(databaseCross)[1]
databaseCross = databaseCross %>%
  filter(.[,"biz_all"] %>% complete.cases)

c("City", "Age", "Inc", "Edc", "Gen", "Chl", "Raa", "Rab", "Ran", "Raw", "Rao", "Hel", "Vdc", "Rem", "Ngh") %>% map(~ {
  table(databaseCross[, .x],databaseCross$biz_all)
})
c("City", "Age", "Inc", "Edc", "Gen", "Chl", "Raa", "Rab", "Ran", "Raw", "Rao", "Ngh", "Hel", "Vdc", "Rem") %>% map(~ {
  table(databaseCross[, .x],databaseCross$Fut)
})

count = raw %>% selectColumns(c(
  "ResponseId", 
  "C11.1_1_1",
  "C11.1_1_2",
  "C11.1_1_3",
  "C11.2_1_1",
  "C11.2_1_2",
  "C11.2_1_3"
)) %>%
  filter(C11.1_1_1 <= 100 & C11.1_1_1 >= 0) %>%
  filter(C11.1_1_2 <= 100 & C11.1_1_2 >= 0) %>%
  filter(C11.1_1_3 <= 100 & C11.1_1_3 >= 0) %>%
  filter(C11.2_1_1 <= 100 & C11.2_1_1 >= 0) %>%
  filter(C11.2_1_2 <= 100 & C11.2_1_2 >= 0) %>%
  filter(C11.2_1_3 <= 100 & C11.2_1_3 >= 0) %>%
  mutate(t19 = C11.1_1_1 + C11.1_1_2 + C11.1_1_3,
         t20 = C11.2_1_1 + C11.2_1_2 + C11.2_1_3) %>%
  select(ResponseId, t19 ,t20)

inner_join(joined,count) %>% group_by(biz_all) %>% summarize(m19 = mean(t19),s19 = sd(t19),m20 = mean(t20),s20 = sd(t20))
inner_join(joined,count) %>% mutate(biz_all = case_when(biz_all == "zero" ~ "zero", T ~ "non-zero")) %>% group_by(biz_all) %>% summarize(m19 = mean(t19),s19 = sd(t19),m20 = mean(t20),s20 = sd(t20))
inner_join(joined,count) %>% mutate(biz_all = case_when(T ~ "all")) %>% group_by(biz_all) %>% summarize(m19 = mean(t19),s19 = sd(t19),m20 = mean(t20),s20 = sd(t20))
inner_join(joined,socioCross) %>% inner_join(count) %>% group_by(Fut) %>% summarize(m19 = mean(t19),s19 = sd(t19),m20 = mean(t20),s20 = sd(t20))

socioData = importData("covidV2") %>%
  filter(City != "Vancouver" & City != "Toronto") %>%
  selectColumns(c("ResponseId", "City", "I01_1", "I03", "I04_2", "I04_3", "I04_1", "I04_5", "I04_4", "I05", "I07", "I09_USD", "S03")) %>%
  mutate(Age = cut(I01_1, c(1920, 1965, 1980, 1995, 2010), labels = c("(1920-1965]","(1965-1980]","(1980-1995]","(1995-2010]"))) %>%
  mutate(Gen = case_when(I05 > 1 ~ "Non-Female", I05 == 1 ~ "Female")) %>%
  mutate(Edc = case_when(I07 > 2 ~ ">=Bachelor", I07 < 3 ~ "<Bachelor")) %>%
  mutate(Inc = case_when(I09_USD < 3 ~ "<50,000", I09_USD > 4 ~ ">=100,000", T ~ "50,000-99,999")) %>%
  mutate(Hsp = case_when(I03 == 1 ~ "Yes", I03 == 0 ~ "No")) %>%
  mutate(Raa = case_when(I04_1 == 1 ~ "Yes", I04_1 == 0 ~ "No")) %>%
  mutate(Rab = case_when(I04_2 == 1 ~ "Yes", I04_2 == 0 ~ "No")) %>%
  mutate(Ran = case_when(I04_3 == 1 ~ "Yes", I04_3 == 0 ~ "No")) %>%
  mutate(Raw = case_when(I04_4 == 1 ~ "Yes", I04_4 == 0 ~ "No")) %>%
  mutate(Rao = case_when(I04_5 == 1 ~ "Yes", I04_5 == 0 ~ "No")) %>%
  mutate(Emp = case_when(S03 == 1 ~ "Yes", S03 == 0 ~ "No")) %>%
  select(ResponseId, City, Age, Inc, Edc, Gen, Hsp, Raa, Rab, Ran, Raw, Rao, Emp)

c("Age", "Inc", "Edc", "Gen", "Hsp", "Raa", "Rab", "Ran", "Raw", "Rao", "Emp") %>% map(~ {
  table = table(socioData[, .x],socioData$City)
  table = cbind(rowSums(table),table)
  colnames(table)[1] = "Total"
  table
})
