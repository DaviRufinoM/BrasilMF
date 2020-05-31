cvm_noticias <- function() {

  site <- 'http://www.cvm.gov.br/legislacao/instrucoes.html'
  site <- read_html(site)
  for (i in 1:5) {
    if (i == 1) {
      tabela <- data.frame("Intrucao" =  site %>% html_nodes(paste0("#main > div > section > section:nth-child(3) > div > ul > li:nth-child(",i,") > a")) %>% html_text(),
                           "Data" =  site %>% html_nodes(paste0("#main > div > section > section:nth-child(3) > div > ul > li:nth-child(",i,") > b")) %>% html_text(),
                           "Descricao" = site %>% html_nodes(paste0("#main > div > section > section:nth-child(3) > div > ul > li:nth-child(",i,") > div > p")) %>% html_text())
    } else {
      tabela <- rbind(tabela, data.frame("Intrucao" =  site %>% html_nodes(paste0("#main > div > section > section:nth-child(3) > div > ul > li:nth-child(",i,") > a")) %>% html_text(),
                                         "Data" =  site %>% html_nodes(paste0("#main > div > section > section:nth-child(3) > div > ul > li:nth-child(",i,") > b")) %>% html_text(),
                                         "Descricao" = site %>% html_nodes(paste0("#main > div > section > section:nth-child(3) > div > ul > li:nth-child(",i,") > div > p")) %>% html_text()))
    }
  }
  return(tabela)
}

uol_noticias <- function() {

  site <- 'https://economia.uol.com.br/temas/juros/'
  site <- read_html(site)
  for (i in 1:10) {
    if (i == 1) {
      tabela <- data.frame("Noticia" =  site %>% html_nodes(paste0("body > section > div > div > div.col-sm-24.col-md-16.col-lg-17 > section > div > div > div > div > div:nth-child(",i,") > div > a > div > h3")) %>% html_text(),
                           "Data" =  site %>% html_nodes(paste0("body > section > div > div > div.col-sm-24.col-md-16.col-lg-17 > section > div > div > div > div > div:nth-child(",i,") > div > a > div > time")) %>% html_text(),
                           "Href" = site %>% html_nodes(paste0("body > section > div > div > div.col-sm-24.col-md-16.col-lg-17 > section > div > div > div > div > div:nth-child(",i,") > div > a")) %>% html_attr("href"))
    } else {
      tabela <- rbind(tabela, data.frame("Noticia" =  site %>% html_nodes(paste0("body > section > div > div > div.col-sm-24.col-md-16.col-lg-17 > section > div > div > div > div > div:nth-child(",i,") > div > a > div > h3")) %>% html_text(),
                                         "Data" =  site %>% html_nodes(paste0("body > section > div > div > div.col-sm-24.col-md-16.col-lg-17 > section > div > div > div > div > div:nth-child(",i,") > div > a > div > time")) %>% html_text(),
                                         "Href" = site %>% html_nodes(paste0("body > section > div > div > div.col-sm-24.col-md-16.col-lg-17 > section > div > div > div > div > div:nth-child(",i,") > div > a")) %>% html_attr("href")))
    }
  }
  return(tabela)
}






