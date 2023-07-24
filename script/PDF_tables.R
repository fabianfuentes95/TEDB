rm(list=ls())

################################################################################
# 
################################################################################

# PARA EL CORRECTO FUNCIONAMIENTO DE ESTE PROGRAMA, ES NECESARIO TENER INSTALADA 
# LA APLICACION DE JAVA EN SU COMPUTADORA, DE LO CONTRARIO NO SERA POSIBLE USAR 
# LAS FUCNCIONES NECESARIAS EN ESTE SCRIPT
# SE RECOMIENDA DESCARGAR EN: https://www.java.com/en/download/

# Se instalan los paquetes necesarios

if (!require("remotes")) {
  install.packages("remotes")
}
# on 64-bit Windows
remotes::install_github(c("ropensci/tabulizerjars", "ropensci/tabulizer"), INSTALL_opts = "--no-multiarch")
# elsewhere
remotes::install_github(c("ropensci/tabulizerjars", "ropensci/tabulizer"))

library(tabulizer)
library(tidyverse)

download.file('https://tedb.ornl.gov/wp-content/uploads/2022/03/TEDB_Ed_40.pdf',
              destfile = 'C:/TEDB/pdf/TEDB_Ed_40.pdf', mode="wb")

TEDB_Ed_40 <- 'C:/TEDB/pdf/TEDB_Ed_40.pdf'

#locate_areas(TEDB_Ed_40,61)

tab <- extract_tables(TEDB_Ed_40, 61, area = list(c(236, 66, 538, 550 )), output = "data.frame")
tab<- tab[[1]]

name <- c('transp','gasoline', 'diesel_fuel', 'liq_pet_gas', 'Jet_fuel', 'res_f_oil', 'nat_gas', 'elec', 'tot') 
colnames(tab) <- name

tab <- tab[3:31,]

tab$gasoline <- as.numeric(tab$gasoline)
