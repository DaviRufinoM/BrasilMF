#Noticias
mf_noticias <- function(origem) {
  switch (origem,
          "uol" = {
            site <- 'https://economia.uol.com.br/temas/juros/'
            site <- xml2::read_html(site)
            for (i in 1:10) {
              if (i == 1) {
                tabela <- data.frame("Noticia" = rvest::html_text(rvest::html_nodes(site, xpath = paste0("/html/body/section/div/div/div[1]/section/div/div/div/div/div[",i,"]/div/a/div/h3"))),
                                     "Data" = rvest::html_text(rvest::html_nodes(site, xpath = paste0("/html/body/section/div/div/div[1]/section/div/div/div/div/div[",i,"]/div/a/div/time"))),
                                     "Href" = rvest::html_attr(rvest::html_nodes(site, xpath = paste0("/html/body/section/div/div/div[1]/section/div/div/div/div/div[",i,"]/div/a")), "href"), stringsAsFactors = FALSE)
              } else {
                tabela <- rbind(tabela, data.frame("Noticia" = rvest::html_text(rvest::html_nodes(site, xpath = paste0("/html/body/section/div/div/div[1]/section/div/div/div/div/div[",i,"]/div/a/div/h3"))),
                                                   "Data" = rvest::html_text(rvest::html_nodes(site, xpath = paste0("/html/body/section/div/div/div[1]/section/div/div/div/div/div[",i,"]/div/a/div/time"))),
                                                   "Href" = rvest::html_attr(rvest::html_nodes(site, xpath = paste0("/html/body/section/div/div/div[1]/section/div/div/div/div/div[",i,"]/div/a")), "href"), stringsAsFactors = FALSE))
              }
            }
            return(tabela)
          },
          "yahoo" = {
            site <- 'https://finance.yahoo.com/news/'
            site <- xml2::read_html(site)
            for (i in 1:5) {
              if (i == 1) {
                tabela <- data.frame("Noticia" = rvest::html_text(rvest::html_nodes(site, xpath = paste0("/html/body/div[1]/div/div/div[1]/div/div[3]/div[1]/div/div[2]/div/div/div/ul/li[",i,"]/div/div/div[2]/h3/a"))),
                                     "Resumo" = rvest::html_text(rvest::html_nodes(site, xpath = paste0("/html/body/div[1]/div/div/div[1]/div/div[3]/div[1]/div/div[2]/div/div/div/ul/li[",i,"]/div/div/div[2]/p/text()"))),
                                     "Href" = rvest::html_attr(rvest::html_nodes(site, xpath = paste0("/html/body/div[1]/div/div/div[1]/div/div[3]/div[1]/div/div[2]/div/div/div/ul/li[",i,"]/div/div/div[2]/h3/a")), "href"), stringsAsFactors = FALSE)
              } else {
                tabela <- rbind(tabela, data.frame("Noticia" = rvest::html_text(rvest::html_nodes(site, xpath = paste0("/html/body/div[1]/div/div/div[1]/div/div[3]/div[1]/div/div[2]/div/div/div/ul/li[",i,"]/div/div/div[2]/h3/a"))),
                                                   "Resumo" = rvest::html_text(rvest::html_nodes(site, xpath = paste0("/html/body/div[1]/div/div/div[1]/div/div[3]/div[1]/div/div[2]/div/div/div/ul/li[",i,"]/div/div/div[2]/p/text()"))),
                                                   "Href" = rvest::html_attr(rvest::html_nodes(site, xpath = paste0("/html/body/div[1]/div/div/div[1]/div/div[3]/div[1]/div/div[2]/div/div/div/ul/li[",i,"]/div/div/div[2]/h3/a")), "href"), stringsAsFactors = FALSE))
              }
            }
            return(tabela)
          }
  )
}
