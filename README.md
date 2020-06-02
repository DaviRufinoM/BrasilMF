#O que é?

BrasilMF é um pacote de R que tem como objetivo munir de informações todas as pessoas que operam no mercado financeiro brasileiro ou quem simplemente tem interesses educacionais. O pacote ainda está em desenvolvimento

#Principais ferramentas

* Rápido acesso as informações do BACEN, B3, CVM, ANBIMA, ALPHA, VANTAGE, YAHOO, FINANCE
* Informações já formatadas
* Novos gráficos
* Atualização diário de normas

# Como baixar

```R
#Utilizar a biblioteca devtools
library(devtools)
```
```R
#Instalar a biblioteca
install_github(SrMercado/BrasilMF)
```

# Dependências

* bizdays
* httr
* dplyr
* jsonlite
* rvest
* htmltools

# Dúvidas

enviar e-mail para davirufino@gmail.com

# Objetivo final

* Puxar todas as informações públicas do mercado financeiro brasileiro (ex. BACEN, B3, CVM, ANBIMA, ALPHA VANTAGE, YAHOO FINANCE)
* Fazer uma tabela com todas as informações
* Criar novos gráficos
* Fazer uma base de dados
* Criar um veículo de informação e atualização gratuíto do mercado financeiro brasileiro
* Atualização de normas da CVM e BACEN
