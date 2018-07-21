library(shiny)

#interfaz usuario
ui<-pageWithSidebar(
  
  headerPanel("KM Litros"),
  sidebarPanel(
    selectInput("v","Mediciones:",choices=c("cilindros"="cyl","tranmision"="am","motores"="gear")),
    checkboxInput("outliers","Mostrar outliers",TRUE)
    
  ),
  mainPanel() 
  
)

#server
server <- function(input, output, session) {
  
}

shinyApp(ui=ui, server=server)