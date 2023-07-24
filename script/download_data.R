rm(list=ls())

# Se cargan los paquetes necesarios
if (!require(pacman)) install.packages("pacman") 
library(pacman) ; p_load('tidyverse')

# En caso de ser necesario debe cambiar el directorio donde se tenga el proyecto
#setwd('C:/Users/fuent/OneDrive/TEC/TEDB')

# URL de cada PDF
urls <- c('https://tedb.ornl.gov/wp-content/uploads/2022/03/TEDB_Ed_40.pdf',
          'https://info.ornl.gov/sites/publications/Files/Pub147659.pdf',
          'https://tedb.ornl.gov/wp-content/uploads/2021/02/Edition38_Full_Doc.pdf',
          'https://tedb.ornl.gov/wp-content/uploads/2020/02/Edition37_Full_Doc.pdf',
          'https://tedb.ornl.gov/wp-content/uploads/2019/03/Edition36_Full_Doc.pdf',
          'https://tedb.ornl.gov/wp-content/uploads/2019/03/Edition35_Full_Doc.pdf',
          'https://tedb.ornl.gov/wp-content/uploads/2019/03/Edition34_Full_Doc.pdf',
          'https://tedb.ornl.gov/wp-content/uploads/2019/03/Edition33_Full_Doc.pdf',
          'https://tedb.ornl.gov/wp-content/uploads/2019/03/Edition32_Full_Doc.pdf',
          'https://tedb.ornl.gov/wp-content/uploads/2019/03/Edition31_Full_Doc.pdf',
          'https://tedb.ornl.gov/wp-content/uploads/2019/03/Edition30_Full_Doc.pdf',
          'https://tedb.ornl.gov/wp-content/uploads/2019/03/Edition29_Full_Doc.pdf',
          'https://tedb.ornl.gov/wp-content/uploads/2019/03/Edition28_Full_Doc.pdf')

nom <- c('TEDB_Ed_40.pdf','TEDB_Ed_39.pdf','TEDB_Ed_38.pdf','TEDB_Ed_37.pdf','TEDB_Ed_36.pdf',
         'TEDB_Ed_35.pdf','TEDB_Ed_34.pdf','TEDB_Ed_33.pdf','TEDB_Ed_32.pdf','TEDB_Ed_31.pdf',
         'TEDB_Ed_30.pdf','TEDB_Ed_29.pdf','TEDB_Ed_28.pdf')

descarga_TEDB<- function(x){
  
  download.file(url = urls[x], destfile = paste0('pdf/',nom[x]), mode="wb")
  
}

walk(1:13, descarga_TEDB)
