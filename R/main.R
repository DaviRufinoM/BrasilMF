#Bibliotecas necessarias
library(bizdays)
library(httr)
library(dplyr)

#Alterando as opcoes
options("scipen"=10)
options("digits"=10)

#Chamando os scipts
source('R/BACEN.R')
source('R/CVM.R')
source('R/ANBIMA.R')
