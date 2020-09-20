getRaw <- function() {
  source("./utils/importData.R")
  raw <- importData("covidV2") %>%
    filter(City != "Vancouver" & City != "Toronto") %>%
    filter(C04_1 == 1 | C04_2 == 1 | C04_3 == 1 | C04_8 == 1 | C04_9 == 1)

  return(raw)
}