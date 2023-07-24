rm(list=ls())

# Se cargan los paquetes necesarios
if (!require(pacman)) install.packages("pacman") 
library(pacman) ; p_load('tidyverse','data.table','openxlsx', 'ggplot2')

# En caso de ser necesario debe cambiar el directorio donde se tenga el proyecto
#setwd('C:/Users/fuent/OneDrive/TEC/TEDB')

nom <- c('TEDB_Ed_40.xlsx','TEDB_Ed_39.xlsx','TEDB_Ed_38.xlsx','TEDB_Ed_37.xlsx','TEDB_Ed_36.xlsx',
         'TEDB_Ed_35.xlsx','TEDB_Ed_34.xlsx','TEDB_Ed_33.xlsx','TEDB_Ed_32.xlsx','TEDB_Ed_31.xlsx',
         'TEDB_Ed_30.xlsx','TEDB_Ed_29.xlsx','TEDB_Ed_28.xlsx')
x <- 1

TEDB <- lapply(1:length(nom), function(x){
print(paste0('Incicia', nom[x]))
  
df <- read.xlsx(paste0('data/',nom[x]), startRow = 4)
df <- as.data.table(df)[1:28,][, yr :=nom[x]]

noms <- c('transp','gasoline', 'diesel_fuel', 'liq_pet_gas', 'Jet_fuel', 'res_f_oil', 'nat_gas', 'elec', 'tot', 'yr') 
colnames(df) <- noms

var <- noms[2:9]
df[,(var):=lapply(.SD,as.numeric),.SDcols=var]

f1 <- c('Light vehicles','Buses','Medium/heavy trucks','Air','Water','Pipeline','Rail')
df <- df[transp %in% f1]

df[,`:=`(serc_gas = (gasoline/tot)*100,
         serc_die = (diesel_fuel/tot)*100,
         serc_lga = (liq_pet_gas/tot)*100,
         serc_jet = (Jet_fuel/tot)*100,
         serc_res = (res_f_oil/tot)*100,
         serc_nga = (nat_gas/tot)*100, 
         serc_ele = (elec/tot)*100)]


}) %>% rbindlist(fill=T)

TEDB[, yr:=case_when(
  yr==nom[1]  ~ 2019, yr==nom[2]  ~ 2018, yr==nom[3]  ~ 2017, yr==nom[4]  ~ 2016,
  yr==nom[5]  ~ 2015, yr==nom[6]  ~ 2014, yr==nom[7]  ~ 2013, yr==nom[8]  ~ 2012,
  yr==nom[9]  ~ 2011, yr==nom[10] ~ 2010, yr==nom[11] ~ 2009, yr==nom[12] ~ 2008,
  yr==nom[13] ~ 2007)]

TEDB[,mean(serc_gas, na.rm=T), by=list(yr)]

fwrite(TEDB,'outdata/TEDB.csv')

wide <- dcast(TEDB, transp ~ yr, 
value.var = c("serc_gas", 'serc_die', 'serc_lga', 'serc_jet', 'serc_res', 'serc_nga', 'serc_ele'))

fwrite(wide, 'outdata/TEDB_wide.csv')


long <- TEDB[, c('transp', 'yr',"serc_gas", 'serc_die', 'serc_lga', 'serc_jet', 'serc_res', 'serc_nga', 'serc_ele')] %>%
  melt( id.vars=c('transp', 'yr') ,measure.vars=c("serc_gas", 'serc_die', 'serc_lga', 'serc_jet', 'serc_res', 'serc_nga', 'serc_ele'),
        variable.name = "var")

fwrite(wide, 'outdata/TEDB_long.csv')

