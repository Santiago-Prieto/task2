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
