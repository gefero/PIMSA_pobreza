library(wbstats)
library(tidyverse)

# empleo_parcial, empleo, desempleo, cat_ocup, calif, rama


#search <- wbsearch("employment")

rama <- c("SP.POP.TOTL","SP.POP.0014.TO","SL.EMP.TOTL.SP.ZS", "SL.AGR.EMPL.ZS", "SL.IND.EMPL.ZS", "SL.SRV.EMPL.ZS")
rama <- wb(indicator=rama, country = "countries_only")
rama <- rama %>%
    arrange(country, date, indicator)
write_csv(rama, './data/indicadores_pais/rama.csv')

cat_ocup <- c("SL.EMP.MPYR.ZS","SL.EMP.WORK.ZS", "SL.EMP.SELF.ZS", "SL.FAM.WORK.ZS")
cat_ocup <- wb(indicator=cat_ocup, country = "countries_only")
cat_ocup <- cat_ocup %>%
    arrange(country, date, indicator)
write_csv(cat_ocup, './data/indicadores_pais/cat_ocup.csv')

cond_act <- c("UNEMPSA_", "SL.UEM.TOTL.ZS", "SL.UEM.TOTL.NE.ZS", "SL.UEM.INTM.ZS", "SL.UEM.ADVN.ZS", "SL.TLF.PART.ZS")
cond_act <- wb(indicator=cond_act, country = "countries_only")
cond_act <- cond_act %>%
    arrange(country, date, indicator)
write_csv(cond_act, './data/indicadores_pais/cond_act.csv')


informal <- c("IC.SME.EMPL.ZS", "SL.ISV.IFRM.ZS", "SL.EMP.VULN.ZS")
informal <- wb(indicator=informal, country = "countries_only")
informal <- informal %>%
    arrange(country, date, indicator)
write_csv(informal, './data/indicadores_pais/informal.csv')


for (i in list(cond_act, cat_ocup, rama, informal)){
    i %>%
    select(indicator) %>%
    unique() %>%
    pull() %>%
    print()
}

df <- cat_ocup %>%
    bind_rows(cond_act) %>%
    bind_rows(rama) %>%
    bind_rows(informal)

write_csv(df, './data/indicadores_pais/completo.csv')



    