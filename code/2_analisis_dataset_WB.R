library(tidyverse)
wb <- read_csv('./data/indicadores_pais/completo.csv')


x<-wb %>%
    filter(date >= 2005 & date <= 2015) %>%
    group_by(country, indicator, indicatorID) %>%
    summarise(ymin = min(date),
              ymax = max(date),
              n = n()) %>%
    arrange(indicator, country, n) %>%
    ungroup()

