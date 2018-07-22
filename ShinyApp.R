library(shiny)
#tratamiento de datos

mpgData<-mtcars
mpgData$am<-factor(mpgData$am,labels=c("Automatico","Manual"))



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
  
  #expresion reactiva generando dos variables de salida
  formulaTexto<-reactive(
    {paste("mpg ~",input$v)})
  output$Texto<-renderText(
    {formulaTexto()
    
    })
  
  #desplegamos
  output$mpgPloy<-renderPlot({
    boxplot(as.formula(formulaTexto),
            data=mpgData,
            outline = input$outliers,
            col="#75AAADB",pch=19
            )
    
  })
  
  
}

shinyApp(ui=ui, server=server)