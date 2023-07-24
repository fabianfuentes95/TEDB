rm(list=ls())

# Se cargan los paquetes necesarios
if (!require(pacman)) install.packages("pacman") 
library(pacman) ; p_load('tidyverse','data.table','ggplot2')

# En caso de ser necesario debe cambiar el directorio donde se tenga el proyecto
#setwd('C:/Users/fuent/OneDrive/TEC/TEDB')

df <- fread('outdata/TEDB.csv')

plot<- ggplot(df)+
  geom_point(aes(x=yr, y=serc_gas, color=transp))+
  scale_x_continuous( breaks = seq(2007, 2019, 1))+
  labs(title = 'Proporción del uso de Gasolina por tipo de transporte', 
       color='Tipo de transporte')+
  theme_minimal()

plot

ggsave('outdata/serc_gas.png', 
       plot, bg = 'white', dpi = 400, width = 11.91*1.5*2, height = 11.91*1*2, 
       units = "cm", device = 'png')

plot <- ggplot(df)+
  geom_point(aes(x=yr, y=serc_die, color=transp))+
  scale_x_continuous( breaks = seq(2007, 2019, 1))+
  labs(title = 'Proporción del uso de Diesel por tipo de transporte', 
       color='Tipo de transporte')+
  theme_minimal()
plot

ggsave('outdata/serc_die.png', 
       plot, bg = 'white', dpi = 400, width = 11.91*1.5*2, height = 11.91*1*2, 
       units = "cm", device = 'png')