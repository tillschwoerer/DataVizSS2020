shinyUI(fluidPage(
    titlePanel("Diamonds Shiny App"),
    selectInput(inputId = "barvar", label = "Variable", choices = colvars, selected = colvars[1]),
    plotOutput("plot")
    
))
