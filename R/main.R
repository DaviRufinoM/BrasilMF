#Bibliotecas necessarias
library(bizdays)
library(httr)
library(dplyr)
library(jsonlite)
library(rvest)
library(htmltools)

#Alterando as opcoes
options("scipen"=10)
options("digits"=10)

#Chamando os scipts
source('R/ANBIMA.R')
source('R/AV.R')
source('R/BACEN.R')
source('R/CVM.R')
source('R/NOTICIAS.R')
source('R/YAHOO.R')

#Chamando as tabelas
load('data/INFO_BCB.RData')
