library(readr)
library(tidyverse)


covid_prison_rates <- read_csv("covid_prison_rates.csv")


covid <- covid_prison_rates %>%
  select(name, prisoner_cases_pct) %>%
  arrange(desc(prisoner_cases_pct)) %>% 
  ggplot(aes(x = name, y = prisoner_cases_pct)) +
  geom_col()