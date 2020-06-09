#Indicadores de credito
for (z in 34:42) {
url <- paste0('https://dadosabertos.bcb.gov.br/dataset?tags=indicadores+de+cr%C3%A9dito&q=&page=',z)
url <- read_html(url)
for (i in 1:20) {
  pag <- url %>% html_nodes(paste0("#content > div.row.wrapper > div > section:nth-child(1) > div.module-content > ul > li:nth-child(",i,") > div > h3 > a")) %>% html_attr("href")
  pag <- paste0("https://dadosabertos.bcb.gov.br/",pag)
  pag <- read_html(pag)
  cod <- pag %>% html_nodes("#dataset-resources > ul > li:nth-child(1) > a") %>% html_text()
  cod <- substr(cod, 21, gregexpr(pattern ='JSON',cod)[[1]][1]-1)
  desc <- pag %>% html_nodes("#content > div.row.wrapper > div > article > div > h1") %>% html_text()
  desc <- gsub("\n", "", desc)
  desc <- gsub("  ", "", desc)
  if (i == 1 & z == 1) {
    tabela_ind_fin <- data.frame("Cod" = cod, "Desc" = desc)
  } else {
    tabela_ind_fin <- rbind(tabela_ind_fin, data.frame("Cod" = cod, "Desc" = desc))
  }
}
}

#Inclusao financeira
for (z in 31:100) {
  url <- paste0('https://dadosabertos.bcb.gov.br/dataset?q=&tags=inclus%C3%A3o+financeira&page=',z)
  url <- read_html(url)
  for (i in 1:20) {
    pag <- url %>% html_nodes(paste0("#content > div.row.wrapper > div > section:nth-child(1) > div.module-content > ul > li:nth-child(",i,") > div > h3 > a")) %>% html_attr("href")
    pag <- paste0("https://dadosabertos.bcb.gov.br/",pag)
    pag <- read_html(pag)
    cod <- pag %>% html_nodes("#dataset-resources > ul > li:nth-child(1) > a") %>% html_text()
    cod <- substr(cod, 21, gregexpr(pattern ='JSON',cod)[[1]][1]-1)
    desc <- pag %>% html_nodes("#content > div.row.wrapper > div > article > div > h1") %>% html_text()
    desc <- gsub("\n", "", desc)
    desc <- gsub("  ", "", desc)
    if (i == 1 & z == 1) {
      tabela_inc_fin <- data.frame("Cod" = cod, "Desc" = desc)
    } else {
      tabela_inc_fin <- rbind(tabela_inc_fin, data.frame("Cod" = cod, "Desc" = desc))
    }
  }
}

#Financas publicas
for (z in 1:7) {
  url <- paste0('https://dadosabertos.bcb.gov.br/dataset?q=&tags=finan%C3%A7as+p%C3%BAblicas&page=',z)
  url <- read_html(url)
  for (i in 1:20) {
    pag <- url %>% html_nodes(paste0("#content > div.row.wrapper > div > section:nth-child(1) > div.module-content > ul > li:nth-child(",i,") > div > h3 > a")) %>% html_attr("href")
    pag <- paste0("https://dadosabertos.bcb.gov.br/",pag)
    pag <- read_html(pag)
    cod <- pag %>% html_nodes("#dataset-resources > ul > li:nth-child(1) > a") %>% html_text()
    cod <- substr(cod, 21, gregexpr(pattern ='JSON',cod)[[1]][1]-1)
    desc <- pag %>% html_nodes("#content > div.row.wrapper > div > article > div > h1") %>% html_text()
    desc <- gsub("\n", "", desc)
    desc <- gsub("  ", "", desc)
    if (i == 1 & z == 1) {
      tabela_fin_pub <- data.frame("Cod" = cod, "Desc" = desc)
    } else {
      tabela_fin_pub <- rbind(tabela_fin_pub, data.frame("Cod" = cod, "Desc" = desc))
    }
  }
}

#Setor externo
for (z in 1:3) {
  url <- paste0('https://dadosabertos.bcb.gov.br/dataset?tags=setor+externo&q=&page=',z)
  url <- read_html(url)
  for (i in 1:20) {
    pag <- url %>% html_nodes(paste0("#content > div.row.wrapper > div > section:nth-child(1) > div.module-content > ul > li:nth-child(",i,") > div > h3 > a")) %>% html_attr("href")
    pag <- paste0("https://dadosabertos.bcb.gov.br/",pag)
    pag <- read_html(pag)
    cod <- pag %>% html_nodes("#dataset-resources > ul > li:nth-child(1) > a") %>% html_text()
    cod <- substr(cod, 21, gregexpr(pattern ='JSON',cod)[[1]][1]-1)
    desc <- pag %>% html_nodes("#content > div.row.wrapper > div > article > div > h1") %>% html_text()
    desc <- gsub("\n", "", desc)
    desc <- gsub("  ", "", desc)
    if (i == 1 & z == 1) {
      tabela_set_ext <- data.frame("Cod" = cod, "Desc" = desc)
    } else {
      tabela_set_ext <- rbind(tabela_set_ext, data.frame("Cod" = cod, "Desc" = desc))
    }
  }
}

#Atividade economica
for (z in 1:3) {
  url <- paste0('https://dadosabertos.bcb.gov.br/dataset?tags=atividade+econ%C3%B4mica&q=&page=',z)
  url <- read_html(url)
  for (i in 1:20) {
    pag <- url %>% html_nodes(paste0("#content > div.row.wrapper > div > section:nth-child(1) > div.module-content > ul > li:nth-child(",i,") > div > h3 > a")) %>% html_attr("href")
    pag <- paste0("https://dadosabertos.bcb.gov.br/",pag)
    pag <- read_html(pag)
    cod <- pag %>% html_nodes("#dataset-resources > ul > li:nth-child(1) > a") %>% html_text()
    cod <- substr(cod, 21, gregexpr(pattern ='JSON',cod)[[1]][1]-1)
    desc <- pag %>% html_nodes("#content > div.row.wrapper > div > article > div > h1") %>% html_text()
    desc <- gsub("\n", "", desc)
    desc <- gsub("  ", "", desc)
    if (i == 1 & z == 1) {
      tabela_atv_eco <- data.frame("Cod" = cod, "Desc" = desc)
    } else {
      tabela_atv_eco <- rbind(tabela_atv_eco, data.frame("Cod" = cod, "Desc" = desc))
    }
  }
}

#Juntando tudo
tabela_atv_eco <- cbind("Atividade" = "atividade economica", tabela_atv_eco)
tabela_fin_pub <- cbind("Atividade" = "financas publicas", tabela_fin_pub)
tabela_inc_fin <- cbind("Atividade" = "inclusao financeira", tabela_inc_fin)
tabela_ind_fin <- cbind("Atividade" = "indicadores financeiros", tabela_ind_fin)
tabela_set_ext <- cbind("Atividade" = "setor externo", tabela_set_ext)
INF_BACEN <- bind_rows(tabela_atv_eco, tabela_fin_pub, tabela_inc_fin, tabela_ind_fin, tabela_set_ext)
rm(tabela_atv_eco, tabela_fin_pub, tabela_inc_fin, tabela_ind_fin, tabela_set_ext)

save.image("data/INFO_BCB.RData")
