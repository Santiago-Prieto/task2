#Santiago Prieto 201814818
#R 4.1.1
#Taller A -Task2
rm(list = ls()) 
if(!require(pacman)) install.packages("pacman") ; require(pacman) 
p_load(rio,skimr,tidyverse,readxl,haven,WriteXLS)
Sys.setlocale("LC_CTYPE", "en_US.UTF-8")

#  Punto 1 #Loops

chip = list()

files = lapply(2012:2020, function(x) list.files(paste0("data/imput/",x),full.names =TRUE)) %>% unlist
for (i in 1:length(files)) {
  chip[[i]]<-read_excel(files[i])
  
}


#Punto 2

fextraccion = function(n,lista,tipo_rubro){
  nlist = lista[[n]] 
  colnames(nlist) = nlist[7,]
  valor = nlist %>% subset(NOMBRE==tipo_rubro) %>% select(`PAGOS(Pesos)`)
  return(valor)  
}
fextraccion(n = 10 , lista = chip , tipo_rubro = "SALUD")


fextraccion = function(n,lista,tipo_rubro){
  
  # crear df
  df = data.frame(valor=NA,cod_dane=NA,periodo=NA)  
  nlist = lista[[n]] 
  
  # extraer codigo dane
  df$cod_dane = colnames(nlist)[1]
  
  # extraer periodo
  df$periodo = nlist[2,1]
  
  # extraer el valor
  colnames(nlist) = nlist[7,]
  df$valor = nlist %>% subset(NOMBRE==tipo_rubro) %>% select(`PAGOS(Pesos)`)
  
  return(df)  
}
fextraccion(n = 10 , lista = chip , tipo_rubro = "SALUD")

