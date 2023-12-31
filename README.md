# TEDB
Propuesta para analizar información de las distintas versiones del "TRANSPORTATION ENERGY DATA BOOK" en las distintas ediciones

Esta es una propuesta realizada para descargar y analizar la información referente a la proporción de tipo de combustible (Gasoline, Diesel fuel,  liquified petroleum gas, Natural gas, Electricity, etc) por modo detransporte (Light vehicles, Buses, Medium/heavy trucks, Air, Water, Pipeline, Rail).

Se retoman los datos del "Transportation Energy Data Book (TEDB)" disponible en: https://tedb.ornl.gov/ que es un recurso elaborado por Oak Ridge National repository que contiene información de transporte para Estados Unidos. TEDB está organizado por ediciones.

Para poder replicar la información, es necesario descargar el proyecto completo con la estructura de carpetas que se encuentran almacenadas y descomprimir en el directorio de su preferencia. Una vez que se tengan los archivos en el directorio de su preferencia, se puede abrir el archivo " “TEDB.Rproj”, con el cual se abrirá una nueva sesión de Rstudio.

En la carpeta “script” se encuentran todos los script necesarios para este proyecto, el primero que se debe ejecutar es el llamado “download_data.R” el cual descargará las distintas versiones del "TRANSPORTATION ENERGY DATA BOOK",  posteriormente se debe ejecutar el llamado “TEDB.R”, este carga la información necesaria y realiza las operaciones para obtener la proporción de tipo de combustible por modo de transporte. 
Los resultados de esta información se almacenan en la carpeta “outdata” con la cual se puede ejecutar el siguiente scrip llamado “graph.R” el cual genera las siguientes gráficas que se encuentran en la carpeta "outdata" con los nombres "serc_gas" y "serc_die"

En las cuales podemos analizar la proporción de uso de combustible por tipo de transporte, en este caso me centraré en el análisis de la Gasolina y el Diesel.

En cuanto a la Gasolina, destaca que los transportes que predominantemente usan gasolina son denominados “Light vehicles” que incluyen automóviles, camionetas ligeras y motocicletas. En el tiempo se denota un comportamiento relativamente estable de todos los tipos de transporte que usan gasolina.

![serc_gas](https://github.com/fabianfuentes95/TEDB/assets/48730068/df904c1a-218a-4720-98cc-c31814f4e864)

Al analizar la proporción de transportes que usan Diesel, se destaca que en 2007, los oleoductos tenían la mayor proporción de uso de este combustible, sin embargo en 2015, los ferrocarriles superaron a loa antes mencionados, tendencia que ha continuado con el paso de los años.

![serc_die](https://github.com/fabianfuentes95/TEDB/assets/48730068/5085a3b6-abed-4378-95a2-1a911f5ffd5e)

Realicé el ejercico extra para estimar el consumo de combustible por estado, este lo realicé en el archivo excel llamado "Ejercicio_extra.xlsx", en el cual tomé la información del registro de veículos por estado, y el consumo de energía y tipo de transporte para poder tener un estimado de la porporción de consumo de combustible reportado en trillones BTU.
