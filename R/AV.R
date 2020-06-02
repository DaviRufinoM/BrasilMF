av_stock_intraday <- function(simbolo, intervalo = "60min", tamanho = "compact", datatype = "json", apikey) {
  url <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY","&symbol=",simbolo,"&interval=",intervalo,"&outputsize=",tamanho,"&apikey=",apikey,"&datatype=",datatype)
  if (datatype == "json") {
    tabela <- read_json(url)
    return(tabela)
  } else {
    tabela <- read.csv(url)
    return(tabela)
  }
}

av_stock_daily <- function(simbolo, tamanho = "compact", datatype = "json", apikey) {
  url <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=",simbolo,"&outputsize=",tamanho,"&apikey=",apikey,"&datatype=",datatype)
  if (datatype == "json") {
    tabela <- read_json(url)
    return(tabela)
  } else {
    tabela <- read.csv(url)
    return(tabela)
  }
}

av_stock_daily_adjusted <- function(simbolo, tamanho = "compact", datatype = "json", apikey) {
  url <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED","&symbol=",simbolo,"&outputsize=",tamanho,"&apikey=",apikey,"&datatype=",datatype)
  if (datatype == "json") {
    tabela <- read_json(url)
    return(tabela)
  } else {
    tabela <- read.csv(url)
    return(tabela)
  }
}

av_stock_daily_weekly <- function(simbolo, datatype = "json", apikey) {
  url <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY","&symbol=",simbolo,"&outputsize=",tamanho,"&apikey=",apikey,"&datatype=",datatype)
  if (datatype == "json") {
    tabela <- read_json(url)
    return(tabela)
  } else {
    tabela <- read.csv(url)
    return(tabela)
  }
}

av_stock_daily_weekly_adjusted <- function(simbolo, datatype = "json", apikey) {
  url <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY_ADJUSTED","&symbol=",simbolo,"&outputsize=",tamanho,"&apikey=",apikey,"&datatype=",datatype)
  if (datatype == "json") {
    tabela <- read_json(url)
    return(tabela)
  } else {
    tabela <- read.csv(url)
    return(tabela)
  }
}

av_stock_daily_monthly <- function(simbolo, datatype = "json", apikey) {
  url <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY","&symbol=",simbolo,"&outputsize=",tamanho,"&apikey=",apikey,"&datatype=",datatype)
  if (datatype == "json") {
    tabela <- read_json(url)
    return(tabela)
  } else {
    tabela <- read.csv(url)
    return(tabela)
  }
}

av_stock_daily_monthly_adjusted <- function(simbolo, datatype = "json", apikey) {
  url <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY_ADJUSTED","&symbol=",simbolo,"&apikey=",apikey,"&datatype=",datatype)
  if (datatype == "json") {
    tabela <- read_json(url)
    return(tabela)
  } else {
    tabela <- read.csv(url)
    return(tabela)
  }
}

av_stock_quote_endpoint <- function(simbolo, datatype = "json", apikey) {
  url <- paste0("https://www.alphavantage.co/query?function=GLOBAL_QUOTE","&symbol=",simbolo,"&apikey=",apikey,"&datatype=",datatype)
  if (datatype == "json") {
    tabela <- read_json(url)
    return(tabela)
  } else {
    tabela <- read.csv(url)
    return(tabela)
  }
}

av_stock_search_endpoint <- function(simbolo, datatype = "json", apikey) {
  url <- paste0("https://www.alphavantage.co/query?function=SYMBOL_SEARCH","&keywords=",simbolo,"&apikey=",apikey,"&datatype=",datatype)
  if (datatype == "json") {
    tabela <- read_json(url)
    return(tabela)
  } else {
    tabela <- read.csv(url)
    return(tabela)
  }
}
