shinyUI(fluidPage(
    titlePanel("My first shiny app"),
    sliderInput(inputId = "filtervalue", "min. duration of eruption in minutes?", value = 3, min = 0, max = 5),
    selectInput(inputId = "x", label = "Choose variable for x-axis (abscissa):", choices = choices, selected = "eruptions"),
    selectInput(inputId = "y", label = "Choose variable for y-axis (ordinate):", choices = choices, selected = "waiting"),
    selectInput(inputId = "color", label = "Choose variable for color-mapping:", choices = choices, selected = "waiting/eruptions"),
    plotOutput(outputId = "plot"),
    DTOutput(outputId = "table")
  )
)
