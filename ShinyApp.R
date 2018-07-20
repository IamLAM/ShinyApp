library(shiny)

#interfaz usuario
ui<-pageWithSidebar(
  
  headerPanel ("KM Litros"),
  sidebarPanel(),
  mainPanel() 
  
  
  
)

#server

server<-function (input,output){
  
  
}

library(shiny)

ui <- fluidPage(
  
)

server <- function(input, output, session) {
  
}

shinyApp(ui=ui, server=server)