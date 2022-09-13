### Clase 27 - Proyecto Final ###

#1.Importar 2 dataframes ubicados en la carpeta "Proyecto", con cualquiera de los métodos aprendidos.
#(tener en cuenta que vienen en distintos formatos)
install.packages("readr")
library(readr)
FP1 <- "C:/Users/alju6001/OneDrive - Nielsen IQ/Panchi/Cursos/CURSO R CREHANA/Material/Datasets/Proyecto/STORE_LEVEL_SALES.csv"
STORE_LEVEL_SALES <- read_csv(FP1)

FP2 <- "C:/Users/alju6001/OneDrive - Nielsen IQ/Panchi/Cursos/CURSO R CREHANA/Material/Datasets/Proyecto/STORES_MASTER.txt"
STORE_MASTER <- read_table(FP2)


#2.Cambia el nombre de las variables SABOR por GUSTO y VENTAS por VENTAS_KG en el DF STORE_LEVEL_SALES
library(dplyr)
STORE_LEVEL_SALES <- rename(STORE_LEVEL_SALES, c(GUSTO=SABOR, VENTAS_KG=VENTAS))


#3.Al dataframe STORE_LEVEL_SALES, agrega las variables REGION, TIPO_TIENDA y SIZE_TIENDA del DF STORE_MASTER, generando un DF STORE_LEVEL_SALES_MERGE
STORE_LEVEL_SALES_MERGE <- inner_join(x=STORE_LEVEL_SALES, y=STORE_MASTER, by= "TIENDA" )
STORE_LEVEL_SALES_MERGE1 <- select(STORE_LEVEL_SALES_MERGE, PERIODO, TIENDA,GUSTO,VENTAS_KG,TIPO_SABOR,REGION,TIPO_TIENDA,SIZE_TIENDA)


#4.Ordena el DataFrame por gusto en orden alfabético descendente
STORE_LEVEL_SALES_MERGE1 <- STORE_LEVEL_SALES_MERGE1 %>% arrange(desc(GUSTO))


#5.Genera una nueva variable con la venta en gramos (la fórmula sería VENTAS_KG*1000)
STORE_LEVEL_SALES_MERGE1 <- STORE_LEVEL_SALES_MERGE1 %>% mutate(VENTAS_GR = VENTAS_KG*1000)

#6.Agrupa el dataframe STORE_LEVEL_SALES_MERGE1 trayendo las ventas promedio por tienda en KG y en GR por GUSTO
TIENDA_GUSTO_AVG_SALES <- STORE_LEVEL_SALES_MERGE1 %>% 
  group_by(TIENDA,GUSTO) %>% 
  summarise(mean(VENTAS_KG), mean(VENTAS_GR))

#7.A este último DataFrame que has creado, agregale las variables REGION, TIPO_TIENDA, SIZE_TIENDA y ANT_TIENDA
TIENDA_GUSTO_AVG_SALES_FINAL <- inner_join(x=TIENDA_GUSTO_AVG_SALES, y=STORE_MASTER, by= "TIENDA" )

#8.Genera una tabla final, únicamente con las ventas promedio por tienda de las tiendas FRANQUICIA
TIENDA_GUSTO_AVG_SALES_FRANQUICIA <-  TIENDA_GUSTO_AVG_SALES_FINAL %>% 
  filter(TIPO_TIENDA == "FRANQUICIA")

#9.Exporta este último dataframe en formato CSV con , como separador 
write.table(x = TIENDA_GUSTO_AVG_SALES_FRANQUICIA, file = "C:/Users/alju6001/OneDrive - Nielsen IQ/Panchi/Cursos/CURSO R CREHANA/Material/Datasets/Proyecto/TIENDA_GUSTO_AVG_SALES_FRANQUICIA.csv", sep = ",", 
            row.names = FALSE, col.names = TRUE)



