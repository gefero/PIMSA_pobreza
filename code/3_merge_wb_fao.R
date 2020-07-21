library(wbstats)
library(tidyverse)

wb <- read_csv('./data/indicadores_pais/completo.csv')
fao <- read_csv('./data/indicadores_pais/FAO_asal_agro.csv') 

names(wb)
names(fao)

fao <- fao %>%
    rename(iso3c = `Area Code`,
           date = `Year`,
           value = `Value`,
           indicatorID = `Indicator Code`,
           indicator = `Indicator`,
           country = `Area`) %>%
    mutate(iso2c = iso3c,
           indicatorID = as.character(indicatorID)) %>% 
    select(iso3c, date, value, indicatorID, indicator, iso2c, country)

wb <- wb %>%
    bind_rows(fao)

write_csv(wb, './data/indicadores_pais/completo_mas_fao.csv')
