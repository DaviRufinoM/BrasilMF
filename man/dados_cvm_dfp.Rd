\name{dados_cvm_dfp}
\alias{dados_cvm_dfp}
\title{Package Description}
\usage{
dados_cvm_dfp(documento, ano, tipo)
}
\arguments{
\item{documento}{Qual o documentos pesquisado (ex. dre, balanco, dmpl)}
\item{ano}{ano da pesquisa}
\item{tipo}{consolidada ou individual}
}
\description{
Pegas as demonstracoes financeiras padronizadas das companhias abertas disponibilizadas site http://dados.cvm.gov.br/
}
\examples{
dados_cvm_dfp("dre", 2019, "consolidada")
}
