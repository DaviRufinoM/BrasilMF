anbima_site <- function(inf) {
  url <- "https://www.anbima.com.br/informacoes/est-termo/CZ-down.asp"
  switch(inf,
         "inflacao" = {
           tabela <- read.csv(url,sep =";", nrows = 2)
           return(tabela)
         },
         "ettj" = {
           tabela <- read.csv(url,sep =";", skip = 5, nrow = 69)
           return(tabela)
         },
         "taxa" = {
           tabela <- read.csv(url,sep =";", skip = 77, nrow = 10)
           return(tabela)
         },
         "tit_publico" = {
           tabela <- read.csv(url,sep =";", skip = 90, nrow = 31)
           return(tabela)
         }
         )
  if(exists("tabela")==FALSE) {
    warning("Insira um valor valido")
  }
}
