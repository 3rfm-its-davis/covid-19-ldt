getFactor <- function(raw, y) {
  list <- paste("A0", 1:5, sep = "") %>%
    map(function(x) paste(x, "_", 1:5, sep = "")) %>%
    unlist()

  list[5] <- "A01_6"

  attitudeA <- raw %>%
    select(c("ResponseId", list)) %>%
    inner_join(y, by = "ResponseId") %>%
    na.exclude() %>%
    select(-A02_4, -A05_2, -biz_all)

  faA <- fa(
    attitudeA[, -1],
    nfactors = 5, scores = "Bartlett", rotate = "promax"
  )

  factor <- data.frame(faA$scores)
  plot(faA$e.values)

  colnames(factor) <- c(
    "FA1A", "FA2A", "FA3A", "FA4A", "FA5A"
  )
  write.csv(faA$loadings[], "./output/factor.csv")

  return(data.frame(
    ResponseId = attitudeA[, 1],
    attitudeA[, -1] %>% apply(2, function(x) (x - mean(x)) / sd(x))
  ))
}