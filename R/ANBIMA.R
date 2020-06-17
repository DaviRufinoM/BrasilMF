dados_anbima <- function(info) {
  switch (object,
          "estrutura_termo" = {
            url <- "https://www.anbima.com.br/informacoes/est-termo/CZ-down.asp"

            tab1 <- read.csv(url,sep =";", nrows = 2, dec = ",")
            tab1 <- t(tab1)
            tab1 <- data.frame("Beta" = row.names(tab1), "PREFIXADO" = tab1[,1], "IPCA" = tab1[,2])
            tab1 <- tab1[2:7,]
            row.names(tab1) <- 1:6

            tab2 <- read.csv(url,sep =";", skip = 5, nrow = 69, dec = ",")
            tab2$Vertices <- gsub("\\.", "", tab2$Vertices)

            tab3 <- read.csv(url,sep =";", skip = 77, nrow = 10, dec = ",")
            colnames(tab3) <- c("Vertices", "Taxas")

            tab4 <- read.csv(url,sep =";", skip = 90, nrow = 31, dec = ",")
            colnames(tab4) <- c("Titulo", "Selic", "Vencimento", "Erro")
            tab4$Vencimento <- as.Date(tab4$Vencimento, format = "%d/%m/%Y")

            lista <- list(tab1, tab2, tab3, tab4)

            return(lista)
          },
          "debenture_secundario" = {
            i <- 0
            while (RCurl::url.exists(url)==FALSE) {
              data <- Sys.Date() - i
              data <- format("%d%m%y")
              url <- paste0("https://www.anbima.com.br/informacoes/merc-sec-debentures/arqs/db",data,".txt")
              i <-i + 1
            }

            tabela <- read.table(url, sep = "@", skip = 2, fill = TRUE, header = TRUE, dec = ",")
            colnames(tabela) <- c("Codigo","Nome","Repactuacao_Vencimento","Indice_Correcao","Taxa_Compra","Taxa_Venda","Taxa_Indicativa","Desvio_Padrao","Intervalo_Indicativo_Minimo","Intervalo_Indicativo_Maximo","PU","Perc_PU_Par","Duration","Perc_Reune","Referencia_NTN_B")
            return(tabela)
          }
  )

}


