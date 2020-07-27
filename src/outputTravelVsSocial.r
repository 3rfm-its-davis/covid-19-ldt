outputTravelVsSocial = function(data, columns, social){
  data = importData("covidV1") %>% selectColumns(c("C11.2_1_1","C11.2_1_2","C11.2_1_3","C11.2_2_1","C11.2_2_2","C11.2_2_3","I01_1")) %>% gather(,,-I01_1) %>% mutate(value = as.numeric(value), age = 2020 - as.numeric(I01_1)) %>% na.exclude() %>% select(-I01_1) %>% filter(value<=100 & value >=0 & age<=100 & age >=0) %>% group_by(age, key, value) %>% tally()
  ggplot(data) + geom_point(aes(value,age, color = key, size = n), alpha = 0.6, position=position_dodge(width = 0.25)) + facet_wrap(~key)
}