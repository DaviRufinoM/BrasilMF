#Funcao do grafico
grafico_site <- function(tabela, id = 'chartContainer', titulo = "", data_formato = 'MMM YY', type = 'stackedArea', suffix_y = '', prefix_y = '') {

  Tabelas <- "<!DOCTYPE HTML><html><script>window.onload = function () {var chart = new CanvasJS.Chart('chartContainer', {      animationEnabled: true,      title: {        text: ''},      axisX: {        valueFormatString: 'MMM YY',        minimum: new Date(2020,01,08),        maximum: new Date(2020,06,01)},      axisY: {title: '',suffix:'',prefix:'',minimum:85.293,maximum:172.436},      legend: {verticalAlign: 'top',horizontalAlign: 'center',dockInsidePlotArea: true},      toolTip: {shared: true},data: ["
  for (z in unique(tabela$label)) {
    Tabelas <- paste0(Tabelas, "{name:", "'", unique(tabela$label[tabela$label == z]), "'", ",
                    showInLegend: true,
                    legendMarkerType: 'square',
                    type: ", "'", type, "'", ",
                    color:", "'", unique(tabela$color[tabela$label == z]), "'", ",
                    markerSize: 0,
                    dataPoints: [")

    for (i in 1:nrow(tabela[tabela$label == z,])) {

      Tabelas_tabela <- tabela[tabela$label == z,]

      if (i == nrow(Tabelas_tabela[Tabelas_tabela$label == z,])) {
        Tabelas <- paste0(Tabelas, "{ x: new Date(", substr(Tabelas_tabela$data[i],1,4),",", substr(Tabelas_tabela$data[i],6,7),",", substr(Tabelas_tabela$data[i],9,10),"), y:",Tabelas_tabela$value[i],"}]},")
      } else {
        Tabelas <- paste0(Tabelas, "{ x: new Date(", substr(Tabelas_tabela$data[i],1,4),",", substr(Tabelas_tabela$data[i],6,7),",", substr(Tabelas_tabela$data[i],9,10),"), y:",Tabelas_tabela$value[i],"},")
      }
    }
  }
  Tabelas <- substr(Tabelas, 1, nchar(Tabelas)-1)

  grafico <- paste0("var chart = new CanvasJS.Chart(", "'",id,"'", ", {
      animationEnabled: true,
      title: {
        text: ","'",titulo,"'","},
      axisX: {
        valueFormatString: ","'",data_formato,"'", ",
        minimum: new Date(", substr(min(tabela$data),1,4),",", substr(min(tabela$data),6,7),",", substr(min(tabela$data),9,10),"),
        maximum: new Date(", substr(max(tabela$data),1,4),",", substr(max(tabela$data),6,7),",", substr(max(tabela$data),9,10),")},
      axisY: {title: '',suffix:","'",suffix_y,"',prefix:","'",prefix_y,"',", "minimum:", min(tabela$value)*0.9, ",", "maximum:", max(tabela$value)*1.1, "},
      legend: {verticalAlign: 'top',horizontalAlign: 'center',dockInsidePlotArea: true},
      toolTip: {shared: true},",
                    Tabelas,"]});
    chart.render();")

  grafico <- paste0(Tabelas, "]});    chart.render();} </script><body id='chartContainer'><td bgcolor='#ffffff' id='chartContainer'></td> <script src='https://canvasjs.com/assets/script/canvasjs.min.js'></script></body></html>")
  grafico <- gsub("\n", "", grafico)

  return(html_print(HTML(grafico)))
}

#Teste
tabela <- av_stock_daily("IBM", datatype = "csv", apikey = "JKRcyjSPUHcMPSbvYtqd")[,c(1,5)]
colnames(tabela) <- c("data", "value")
tabela$data <- as.Date(tabela$data)
tabela$label <- "Cotacao"
tabela$color <- '#D39F2B'
grafico_site(tabela, type = "scatter")
