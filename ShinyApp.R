library(shiny)
#preprocesado de datos

mpgData<-mtcars
mpgData$am<-factor(mpgData$am,labels=c("Automatico","Manual"))



#interfaz usuario
ui<-pageWithSidebar(
  
  headerPanel("Contruyendo AppShiny"),
  sidebarPanel(
    selectInput("v","Mediciones:",
                choices=c("cilindros"="cyl",
                          "tranmision"="am",
                          "motores"="gear")),
    checkboxInput("outliers","Mostrar outliers",TRUE)
    
  ),
  mainPanel(
    #desplegamos en pantalla
    h3(textOutput("Texto")),
    plotOutput("mpgPlot")
  ) 
  
)

#server
server <- function(input, output, session) {
  
  #expresion reactiva generando dos variables de salida
  formulaTexto<-reactive(
    {paste("mpg ~",input$v)})
  output$Texto<-renderText(
    {formulaTexto()
    
    })
  
  # configuramos el despliegue
  output$mpgPlot<-renderPlot({
    boxplot(as.formula(formulaTexto()),
            data=mpgData,
            outline = input$outliers,
            col="#75AAAB",pch=19
            )
    
  })
  
  
}

shinyApp(ui=ui, server=server)