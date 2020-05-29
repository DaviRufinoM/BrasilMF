if(Sys.time() > hora) {
  base <- base64_enc("DfRF2YAZ8S1I:z4AaO0W1fpB4")
  result <- POST("https://api.anbima.com.br/oauth/access-token",
                 body = list("grant_type" = "client_credentials"),
                 add_headers(c("Content-Type" = "application/json","Authorization" = paste("Basic",base))), encode = "json")
  hora <- content(result)$expires_in+Sys.time()
  rm(base)
}

anbima_deb_merc_sec <- function(dt_ini = Sys.Date()-1, dt_fim = Sys.Date()-1) {
  datas <- bizseq(dt_ini, dt_fim)
  for (i in 1:length(datas)) {
    Info <- GET("http://api-sandbox.anbima.com.br/feed/precos-indices/v1/debentures/mercado-secundario",
                config = list("data_referencia" = datas[i]),
                add_headers(c("client_id" = 'DfRF2YAZ8S1I', "access_token" = content(result)$access_token)))

    Info <- content(Info)
    Info <- do.call(bind_rows, Info)
    Info$dia <- datas[i]
    if(i == 1) {
      Tabela <- Info
    } else {
      Tabela <- rbind(Tabela, Info)
    }
  }
  return(Tabela)
}
