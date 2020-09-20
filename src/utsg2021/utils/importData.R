importData <- function(dataType) {
  data <- read.csv(paste(here::here(), "/src/data/", dataType, ".csv", sep = ""))
  if ("removed" %in% colnames(data)) {
    return(data[data[, "removed"] == "", ])
  } else {
    return(data[data[, "gc"] == 1, ])
  }
}