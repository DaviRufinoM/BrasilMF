#Fundos de Investimento: Informacao Cadastral
dados_cvm_fi_icvm555 <- function(data = Sys.Date()-1) {

  cal <- create.calendar("Brazil/ANBIMA", holidaysANBIMA, weekdays=c("saturday", "sunday"))

  data <- bizseq(data-5,data,cal)
  data <- max(data)
  data <- format(as.Date(data,"1970-01-01"), "%Y%m%d")
  url <- paste0("http://dados.cvm.gov.br/dados/FI/CAD/DADOS/inf_cadastral_fi_",data,".csv")
  tabela <- read.csv(url, sep = ";")
  return(tabela)
}

#Fundos Estruturados: Informacao Cadastral
dados_cvm_inf_cadastral_555 <- function() {
  url <- 'http://dados.cvm.gov.br/dados/FIE/CAD/DADOS/cad_fie.zip'
  destfile <- "cad_fie.zip"
  download.file(url = url, destfile = destfile, mode ="wb")
  unzip(zipfile = destfile)
  cad_fie <- read.csv("cad_fie.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
  cad_fie_admin <- read.csv("cad_fie_admin.csv", sep = ";", stringsAsFactors = FALSE)
  cad_fie_auditor <- read.csv("cad_fie_auditor.csv", sep = ";", stringsAsFactors = FALSE)
  cad_fie_gestor <- read.csv("cad_fie_gestor.csv", sep = ";", stringsAsFactors = FALSE)
  for (i in unique(cad_fie_admin$CNPJ_FUNDO)) {
    cad_fie$ADMINISTRADOR_CNPJ[cad_fie$CNPJ_FUNDO == i] <- cad_fie_admin$CNPJ_ADMIN[cad_fie_admin$CNPJ_FUNDO == i][1]
    cad_fie$ADMINISTRADOR_NOME[cad_fie$CNPJ_FUNDO == i] <- cad_fie_admin$ADMIN[cad_fie_admin$CNPJ_FUNDO == i][1]
  }
  for (i in unique(cad_fie_gestor$CNPJ_FUNDO)) {
    cad_fie$GESTOR_CNPJ[cad_fie$CNPJ_FUNDO == i] <- cad_fie_gestor$CPF_CNPJ_GESTOR[cad_fie_gestor$CNPJ_FUNDO == i][1]
    cad_fie$GESTOR_NOME[cad_fie$CNPJ_FUNDO == i] <- cad_fie_gestor$GESTOR[cad_fie_gestor$CNPJ_FUNDO == i][1]
  }
  for (i in unique(cad_fie_auditor$CNPJ_FUNDO)) {
    cad_fie$AUDITOR_CNPJ[cad_fie$CNPJ_FUNDO == i] <- cad_fie_auditor$CNPJ_AUDITOR[cad_fie_auditor$CNPJ_FUNDO == i][1]
    cad_fie$AUDITOR_NOME[cad_fie$CNPJ_FUNDO == i] <- cad_fie_auditor$AUDITOR[cad_fie_auditor$CNPJ_FUNDO == i][1]
  }
  file.remove("cad_fie.csv","cad_fie_admin.csv","cad_fie_gestor.csv","cad_fie_auditor.csv","cad_fie.zip")
}

#Informacao cadastral auditores
dados_cvm_inf_cadastral_auditores <- function(tipo = "PJ") {
  url <- 'http://dados.cvm.gov.br/dados/AUDITOR/CAD/DADOS/cad_auditor.zip'
  destfile <- "cad_auditor.zip"
  download.file(url = url, destfile = destfile, mode ="wb")
  unzip(zipfile = destfile)
  if (tipo == "PJ") {
    cad_auditor_pj <- read.csv("cad_auditor_pj.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
    file.remove("cad_auditor_pf.csv","cad_auditor_pj.csv","cad_auditor.zip")
    return(cad_auditor_pj)
  } else if (tipo == "PF") {
    cad_auditor_pf <- read.csv("cad_auditor_pf.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
    file.remove("cad_auditor_pf.csv","cad_auditor_pj.csv","cad_auditor.zip")
    return(cad_auditor_pf)
  } else {
    warning("tipo invalido")
  }
}

#Informacao cadastral participantes intermediários
dados_cvm_inf_cadastral_part_intermediarios <- function(tipo = "empresa") {
  url <- 'http://dados.cvm.gov.br/dados/INTERMED/CAD/DADOS/cad_intermed.zip'
  destfile <- "cad_intermed.zip"
  download.file(url = url, destfile = destfile, mode ="wb")
  unzip(zipfile = destfile)
  if (tipo == "empresa") {
    cad_intermed <- read.csv("cad_intermed.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
    file.remove("cad_intermed.csv","cad_intermed_resp.csv","cad_intermed.zip")
    return(cad_intermed)
  } else if (tipo == "resp") {
    cad_intermed_resp <- read.csv("cad_intermed_resp.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
    file.remove("cad_intermed.csv","cad_intermed_resp.csv","cad_intermed.zip")
    return(cad_intermed_resp)
  } else {
    warning("tipo invalido")
  }
}

#Informacao cadastral agente autonomo
dados_cvm_inf_cadastral_aai <- function(tipo = "PJ") {
  url <- 'http://dados.cvm.gov.br/dados/AGENTE_AUTON/CAD/DADOS/cad_agente_auton.zip'
  destfile <- "cad_agente_auton.zip"
  download.file(url = url, destfile = destfile, mode ="wb")
  unzip(zipfile = destfile)
  if (tipo == "PJ") {
    cad_agente_auton_pj <- read.csv("cad_agente_auton_pj.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
    file.remove("cad_agente_auton_pj.csv","cad_agente_auton_pf.csv","cad_agente_auton.zip")
    return(cad_agente_auton_pj)
  } else if (tipo == "PF") {
    cad_agente_auton_pf <- read.csv("cad_agente_auton_pf.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
    file.remove("cad_agente_auton_pj.csv","cad_agente_auton_pf.csv","cad_agente_auton.zip")
    return(cad_agente_auton_pf)
  } else {
    warning("tipo invalido")
  }
}

#Informacao cadastral empresa incentivada
dados_cvm_inf_cadastral_emp_incentivada <- function() {
  url <- 'http://dados.cvm.gov.br/dados/CIA_INCENT/CAD/DADOS/cad_cia_incent.csv'
  cad_cia_incet <- read.csv(url, sep = ";", quote = "", stringsAsFactors = FALSE)
  return(cad_cia_incet)
}

#Informacao cadastral empresa estrangeira
dados_cvm_inf_cadastral_emp_estrangeira <- function() {
  url <- 'http://dados.cvm.gov.br/dados/CIA_ESTRANG/CAD/DADOS/cad_cia_estrang.csv'
  cad_cia_estrang <- read.csv(url, sep = ";", quote = "", stringsAsFactors = FALSE)
  return(cad_cia_estrang)
}

#Informacao cadastral empresa aberta
dados_cvm_inf_cadastral_emp_aberta <- function() {
  url <- 'http://dados.cvm.gov.br/dados/CIA_ABERTA/CAD/DADOS/cad_cia_aberta.csv'
  cad_cia_aberta <- read.csv(url, sep = ";", quote = "", stringsAsFactors = FALSE)
  return(cad_cia_aberta)
}

#Informacao cadastral representante de investidor nao residente
dados_cvm_inf_cadastral_repres_inv_n_res <- function(tipo = "PJ") {
  url <- 'http://dados.cvm.gov.br/dados/INVNR/CAD/DADOS/cad_invnr_repres.zip'
  destfile <- "cad_invnr_repres.zip"
  download.file(url = url, destfile = destfile, mode ="wb")
  unzip(zipfile = destfile)
  if (tipo == "PJ") {
    cad_invnr_repres_pj <- read.csv("cad_invnr_repres_pj.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
    file.remove("cad_invnr_repres_pj.csv","cad_invnr_repres_pf.csv","cad_invnr_repres.zip")
    return(cad_invnr_repres_pj)
  } else if (tipo == "PF") {
    cad_invnr_repres_pf <- read.csv("cad_invnr_repres_pf.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
    file.remove("cad_invnr_repres_pf.csv","cad_invnr_repres_pf.csv","cad_invnr_repres.zip")
    return(cad_invnr_repres_pf)
  } else {
    warning("tipo invalido")
  }
}

#Informacao cadastral consultor de valores mobiliarios
dados_cvm_inf_cadastral_consult <- function(tipo = "PJ") {
  url <- 'http://dados.cvm.gov.br/dados/CONSULTOR_VLMOB/CAD/DADOS/cad_consultor_vlmob.zip'
  destfile <- "cad_consultor_vlmob.zip"
  download.file(url = url, destfile = destfile, mode ="wb")
  unzip(zipfile = destfile)
  if (tipo == "PJ") {
    cad_consultor_vlmob_pj <- read.csv("cad_consultor_vlmob_pj.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
    file.remove("cad_consultor_vlmob_pj.csv","cad_consultor_vlmob_pf.csv","cad_consultor_vlmob_diretor.csv","cad_consultor_vlmob_socios.csv","cad_consultor_vlmob.zip")
    return(cad_consultor_vlmob_pj)
  } else if (tipo == "PF") {
    cad_consultor_vlmob_pf <- read.csv("cad_consultor_vlmob_pf.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
    file.remove("cad_consultor_vlmob_pj.csv","cad_consultor_vlmob_pf.csv","cad_consultor_vlmob_diretor.csv","cad_consultor_vlmob_socios.csv","cad_consultor_vlmob.zip")
    return(cad_consultor_vlmob_pf)
  } else if (tipo == "DIRETOR") {
    cad_consultor_vlmob_diretor <- read.csv("cad_consultor_vlmob_diretor.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
    file.remove("cad_consultor_vlmob_pj.csv","cad_consultor_vlmob_pf.csv","cad_consultor_vlmob_diretor.csv","cad_consultor_vlmob_socios.csv","cad_consultor_vlmob.zip")
    return(cad_consultor_vlmob_diretor)
  } else if (tipo == "SOCIOS") {
    cad_consultor_vlmob_socios <- read.csv("cad_consultor_vlmob_pf.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
    file.remove("cad_consultor_vlmob_pj.csv","cad_consultor_vlmob_pf.csv","cad_consultor_vlmob_diretor.csv","cad_consultor_vlmob_socios.csv","cad_consultor_vlmob.zip")
    return(cad_consultor_vlmob_socios)
  } else {
    warning("tipo invalido")
  }
}

#Informacao cadastral administrador fii
dados_cvm_inf_cadastral_adm_fii <- function() {
  url <- 'http://dados.cvm.gov.br/dados/ADM_FII/CAD/DADOS/cad_adm_fii.csv'
  cad_adm_fii <- read.csv(url, sep = ";", quote = "", stringsAsFactors = FALSE)
  return(cad_adm_fii)
}

#Informacao cadastral administradores de carteira
dados_cvm_inf_cadastral_adm_carteira <- function(tipo = "PJ") {
  url <- 'http://dados.cvm.gov.br/dados/ADM_CART/CAD/DADOS/cad_adm_cart.zip'
  destfile <- "cad_adm_cart.zip"
  download.file(url = url, destfile = destfile, mode ="wb")
  unzip(zipfile = destfile)
  if (tipo == "PJ") {
    cad_adm_cart_pj <- read.csv("cad_adm_cart_pj.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
    file.remove("cad_adm_cart_pj.csv","cad_adm_cart_pf.csv","cad_adm_cart_diretor.csv","cad_adm_cart_resp.csv","cad_adm_cart_socios.csv","cad_adm_cart.zip")
    return(cad_adm_cart_pj)
  } else if (tipo == "PF") {
    cad_adm_cart_pf <- read.csv("cad_adm_cart_pf.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
    file.remove("cad_adm_cart_pj.csv","cad_adm_cart_pf.csv","cad_adm_cart_diretor.csv","cad_adm_cart_resp.csv","cad_adm_cart_socios.csv","cad_adm_cart.zip")
    return(cad_adm_cart_pf)
  } else if (tipo == "DIRETOR") {
    cad_adm_cart_diretor <- read.csv("cad_adm_cart_diretor.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
    file.remove("cad_adm_cart_pj.csv","cad_adm_cart_pf.csv","cad_adm_cart_diretor.csv","cad_adm_cart_resp.csv","cad_adm_cart_socios.csv","cad_adm_cart.zip")
    return(cad_adm_cart_diretor)
  } else if (tipo == "SOCIOS") {
    cad_adm_cart_socios <- read.csv("cad_adm_cart_socios.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
    file.remove("cad_adm_cart_pj.csv","cad_adm_cart_pf.csv","cad_adm_cart_diretor.csv","cad_adm_cart_resp.csv","cad_adm_cart_socios.csv","cad_adm_cart.zip")
    return(cad_adm_cart_socios)
  } else if (tipo == "RESP") {
    cad_adm_cart_resp <- read.csv("cad_adm_cart_resp.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
    file.remove("cad_adm_cart_pj.csv","cad_adm_cart_pf.csv","cad_adm_cart_diretor.csv","cad_adm_cart_resp.csv","cad_adm_cart_socios.csv","cad_adm_cart.zip")
    return(cad_adm_cart_resp)
  } else {
    warning("tipo invalido")
  }
}

#Fundos de Investimento: Documentos Informe Diario
dados_cvm_inf_diario_fi <- function(dt_ini = "2019-05-02", dt_fim = Sys.Date()-1) {
  cal <- create.calendar("Brazil/ANBIMA", holidaysANBIMA, weekdays=c("saturday", "sunday"))
  datas <- bizseq(dt_ini, dt_fim, cal)
  datas <- unique(format(datas, "%Y%m"))
  for (i in datas) {
    url <- paste0('http://dados.cvm.gov.br/dados/FI/DOC/INF_DIARIO/DADOS/inf_diario_fi_',i,'.csv')
    if (i == datas[1]) {
      assign(paste0("inf_dia_",datas[1]),read.csv(url, sep = ";", stringsAsFactors = FALSE))
    } else {
      url <- paste0('http://dados.cvm.gov.br/dados/FI/DOC/INF_DIARIO/DADOS/inf_diario_fi_',i,'.csv')
      assign(paste0("inf_dia_",datas[1]), rbind(get(paste0("inf_dia_",datas[1])), read.csv(url, sep = ";", stringsAsFactors = FALSE)))
    }
  }
  assign("tabela",get(paste0("inf_dia_",datas[1]))[get(paste0("inf_dia_",datas[1]))$DT_COMPTC >= dt_ini & get(paste0("inf_dia_",datas[1]))$DT_COMPTC <= dt_fim,])
  return(tabela)
}

#Fundos de Investimento: Documentos Extrato das Informacoes
dados_cvm_extrato_inf <- function(dt_ini = 2015, dt_fim = 2020) {
  datas <- dt_ini:dt_fim
  for (i in datas) {
    url <- paste0('http://dados.cvm.gov.br/dados/FI/DOC/EXTRATO/DADOS/extrato_fi_',i,'.csv')
    if (i == datas[1]) {
      assign(paste0("extrato_",datas[1]),read.csv(url, sep = ";", quote = "" ,stringsAsFactors = FALSE))
    } else {
      url <- paste0('http://dados.cvm.gov.br/dados/FI/DOC/EXTRATO/DADOS/extrato_fi_',i,'.csv')
      assign(paste0("extrato_",datas[1]), rbind(get(paste0("extrato_",datas[1])), read.csv(url, sep = ";", quote = "", stringsAsFactors = FALSE)))
    }
  }
  assign("tabela",get(paste0("extrato_",datas[1])))
  return(tabela)
}

#Fundos de Investimento Documentos: Perfil Mensal
dados_cvm_perfil_mensal <- function(dt_ini = "2019-05-31", dt_fim = Sys.Date()-1) {
  datas <- bizseq(dt_ini, dt_fim)
  datas <- unique(format(datas, "%Y%m"))
  for (i in datas) {
    url <- paste0('http://dados.cvm.gov.br/dados/FI/DOC/PERFIL_MENSAL/DADOS/perfil_mensal_fi_',i,'.csv')
    if (i == datas[1]) {
      assign(paste0("perfil_",datas[1]),read.csv(url, sep = ";", quote = "", stringsAsFactors = FALSE))
    } else {
      url <- paste0('http://dados.cvm.gov.br/dados/FI/DOC/PERFIL_MENSAL/DADOS/perfil_mensal_fi_',i,'.csv')
      assign(paste0("perfil_",datas[1]), rbind(get(paste0("perfil_",datas[1])), read.csv(url, sep = ";", quote = "", stringsAsFactors = FALSE)))
    }
  }
  assign("tabela",get(paste0("perfil_",datas[1])))
  return(tabela)
}

#Informe Trimestral FIP
dados_cvm_inf_tri_fip <- function(dt_ini = 2018, dt_fim = 2020) {
  datas <- dt_ini:dt_fim
  for (i in datas) {
    url <- paste0('http://dados.cvm.gov.br/dados/FIP/DOC/INF_TRIMESTRAL/DADOS/inf_trimestral_fip_',i,'.csv')
    if (i == datas[1]) {
      assign(paste0("inf_tri_fip_",datas[1]),read.csv(url, sep = ";", quote = "" ,stringsAsFactors = FALSE))
    } else {
      url <- paste0('http://dados.cvm.gov.br/dados/FIP/DOC/INF_TRIMESTRAL/DADOS/inf_trimestral_fip_',i,'.csv')
      assign(paste0("inf_tri_fip_",datas[1]), rbind(get(paste0("inf_tri_fip_",datas[1])), read.csv(url, sep = ";", quote = "", stringsAsFactors = FALSE)))
    }
  }
  assign("tabela",get(paste0("inf_tri_fip_",datas[1])))
  return(tabela)
}
