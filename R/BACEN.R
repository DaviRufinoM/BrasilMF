dados_bacen <- function(cod, dt_ini = Sys.Date()-365,dt_fim = Sys.Date()) {

  if (missing(cod)) {
    warning("Informe o campo cod")
  } else if (missing(dt_ini) & missing(dt_fim)) {
    url <- paste0("http://api.bcb.gov.br/dados/serie/bcdata.sgs.",cod,"/dados?formato=csv")
    base <- read.csv(url, sep = ";")
    return(base)
  } else {
    dt_ini <- format(as.Date(dt_ini), "%d/%m/%Y")
    dt_fim <- format(as.Date(dt_fim), "%d/%m/%Y")
    url <- paste0("http://api.bcb.gov.br/dados/serie/bcdata.sgs.",cod,"/dados?formato=csv&dataInicial=",dt_ini,"&dataFinal=",dt_fim)
    base <- read.csv(url, sep = ";")
    return(base)
  }
}

procura_bacen <- function(palavra = "") {
  total <- nrow(INF_BACEN)
  pb <- txtProgressBar(min = 0, max = total, style = 3)
    for (i in 1:nrow(INF_BACEN)) {
    if (gregexpr(palavra,INF_BACEN$Desc)[[i]][1] > 1) {
      if (exists("bacen_infor")) {
        bacen_infor <-dplyr::bind_rows(bacen_infor, INF_BACEN[i,])
      } else {
        bacen_infor <- INF_BACEN[i,]
      }
    }
    setTxtProgressBar(pb, i)
  }
  close(pb)
  return(bacen_infor)
}
