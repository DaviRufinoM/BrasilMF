#Bibliotecas necessarias
library(bizdays)
library(dplyr)
library(rvest)
library(RCurl)
library(xml2)

#Alterando as opcoes
options("scipen"=10)
options("digits"=10)

#Chamando os scipts
source('R/BACEN.R')
source('R/CVM.R')
source('R/NOTICIAS.R')

load("data//INF_BACEN.rda")
