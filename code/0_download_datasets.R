library(tidyverse)
library(povcalnetR)
library(directlabels)

#df_19<-read.csv("http://iresearch.worldbank.org/povcalnet/povcalnetapi.ashx?PovertyLine=1.9&Countries=all&SurveyYears=all")
#df_32<-read.csv("http://iresearch.worldbank.org/povcalnet/povcalnetapi.ashx?PovertyLine=3.2&Countries=all&SurveyYears=all")
#df_32<-read.csv("http://iresearch.worldbank.org/povcalnet/povcalnetapi.ashx?PovertyLine=10&Countries=all&SurveyYears=all")
#df<-read.csv("http://iresearch.worldbank.org/povcalnet/povcalnetapi.ashx?PovertyLine=10&Countries=all&SurveyYears=all")

#countries <- unique(df_32$CountryCode)

# pvcalnet <- list()
# for (c in countries){
#     print(c)
#     for (p in poverty_lines){
#         pvcalnet[[c]] <- povcalnet(country = c,
#                                    povline = p,
#                                    year='all')
#     }
#     print(paste('Done ',c))
# }
                

poverty_lines <- seq(46.7,50, by=0.1)

for (p in poverty_lines){
    cat(paste('Downloading povline=', p, '\n', sep=''))
    
    pvcalnet <- povcalnet(country = 'all',
                               povline = p,
                               year='all')
    
    file <- paste('./data/partial/', p, 'pvcalnet.csv', sep='')

    write.csv(pvcalnet, file)
    cat(paste('\t', 'Saved', '\n', sep=''))
}
    

data_path <- './data/partial'
files <- dir(data_path,pattern = ".csv")



data <- files %>%
    map(~ read_csv(file.path(data_path, .))) %>% 
    reduce(rbind) %>%
    select(-X1) %>% 
    arrange(countryname, year, povertyline)


write_csv(data, './data/proc/TOTAL_povcalnet_1_50.csv')
