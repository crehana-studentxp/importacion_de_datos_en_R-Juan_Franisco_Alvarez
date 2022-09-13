### Clase 14 - Proyecto: Avance 1 ###

#1.Importar 2 dataframes ubicados en la carpeta "Proyecto", con cualquiera de los métodos aprendidos.
#(tener en cuenta que vienen en distintos formatos)
install.packages("readr")
library(readr)
FP1 <- "C:/Users/alju6001/OneDrive - Nielsen IQ/Panchi/Cursos/CURSO R CREHANA/Material/Datasets/Proyecto/STORE_LEVEL_SALES.csv"
STORE_LEVEL_SALES <- read_csv(FP1)

FP2 <- "C:/Users/alju6001/OneDrive - Nielsen IQ/Panchi/Cursos/CURSO R CREHANA/Material/Datasets/Proyecto/STORES_MASTER.txt"
STORE_MASTER <- read_table(FP2)


