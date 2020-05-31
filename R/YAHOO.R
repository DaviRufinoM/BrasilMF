cotacao_acoes <- function(acao, dt_ini = Sys.Date()-366, dt_fim = Sys.Date()-1) {
  dt_ini <- as.numeric(as.POSIXct(paste0(dt_ini,"21:00:00 PM", format = "%Y-%m-%d %H:%M:%S %p")))
  dt_fim <- as.numeric(as.POSIXct(paste0(dt_fim,"21:00:00 PM", format = "%Y-%m-%d %H:%M:%S %p")))
  url <- paste0("https://query1.finance.yahoo.com/v7/finance/download/",acao,"?period1=",dt_ini,"&period2=",dt_fim,"&interval=1d&events=history")
  tabela <- read.csv(url)
  return(tabela)
}

dividendo_acoes <- function(acao, dt_ini = Sys.Date()-366, dt_fim = Sys.Date()-1) {
  dt_ini <- as.numeric(as.POSIXct(paste0(dt_ini,"21:00:00 PM", format = "%Y-%m-%d %H:%M:%S %p")))
  dt_fim <- as.numeric(as.POSIXct(paste0(dt_fim,"21:00:00 PM", format = "%Y-%m-%d %H:%M:%S %p")))
  url <- paste0("https://query1.finance.yahoo.com/v7/finance/download/",acao,"?period1=",dt_ini,"&period2=",dt_fim,"&interval=1d&events=div")
  tabela <- read.csv(url)
  return(tabela)
}

split_acoes <- function(acao, dt_ini = Sys.Date()-366, dt_fim = Sys.Date()-1) {
  dt_ini <- as.numeric(as.POSIXct(paste0(dt_ini,"21:00:00 PM", format = "%Y-%m-%d %H:%M:%S %p")))
  dt_fim <- as.numeric(as.POSIXct(paste0(dt_fim,"21:00:00 PM", format = "%Y-%m-%d %H:%M:%S %p")))
  url <- paste0("https://query1.finance.yahoo.com/v7/finance/download/",acao,"?period1=",dt_ini,"&period2=",dt_fim,"&interval=1d&events=div")
  tabela <- read.csv(url)
  return(tabela)
}
