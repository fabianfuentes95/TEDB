rm(list=ls())

# Se cargan los paquetes necesarios
if (!require(pacman)) install.packages("pacman") 
library(pacman) ; p_load('tidyverse','data.table','openxlsx', 'ggplot2')

# En caso de ser necesario debe cambiar el directorio donde se tenga el proyecto
#setwd('C:/Users/fuent/OneDrive/TEC/TEDB')

download.file('https://tedb.ornl.gov/wp-content/uploads/2022/03/Table3_05_01312022.xlsx',
              destfile ='data/Table3_05_01312022.xls', mode="wb")

download.file('https://tedb.ornl.gov/wp-content/uploads/2022/03/Table2_07_01312022.xlsx',
              destfile ='data/Table2_07_01312022.xlsx', mode="wb")

t27 <- read.xlsx('data/Table2_07_01312022.xlsx', startRow = 10)


