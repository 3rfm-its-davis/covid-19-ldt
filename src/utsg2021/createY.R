createY <- function(raw) {
  ldtData <- raw %>%
    select(
      "ResponseId",
      "C11.1_1_1",
      "C11.1_1_2",
      "C11.1_1_3",
      "C11.2_1_1",
      "C11.2_1_2",
      "C11.2_1_3",
    ) %>%
    mutate(across(!ResponseId, ~ {
      replace(.x, .x < 0 | .x > 100, NA)
    })) %>%
    na.exclude() %>%
    rowwise(ResponseId) %>%
    mutate(
      biz_all_before = sum(C11.1_1_1, C11.1_1_2, C11.1_1_3),
      biz_all_during = sum(C11.2_1_1, C11.2_1_2, C11.2_1_3)
    ) %>%
    mutate(
      is_user = sum(biz_all_before, biz_all_during) > 0,
      biz_all = case_when(
        biz_all_before == 0 & biz_all_during == 0 ~ "zero",
        (biz_all_before / 6 - biz_all_during) > 0.5 ~ "smaller",
        abs(biz_all_before / 6 - biz_all_during) <= 0.5 ~ "same",
        (biz_all_before / 6 - biz_all_during) < -0.5 ~ "greater",
        T ~ ""
      )
    ) %>%
    mutate(biz_all = as.numeric(biz_all %>%
      factor(levels = c("zero", "smaller", "same", "greater")))) %>%
    select(ResponseId, biz_all_before, biz_all_during, biz_all)

  return(ldtData)
}