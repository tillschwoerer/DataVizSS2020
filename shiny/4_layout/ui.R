shinyUI(fluidPage(
  
  titlePanel("Diamonds Shiny App"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "cut_filter", label = "cut", choices = cuts, selected = cuts, multiple = TRUE),
      selectInput(inputId = "x", label = "x-Axis", choices = factors, selected = factors[1]),
      selectInput(inputId = "y", label = "y-Axis", choices = factors, selected = factors[2]),
      selectInput(inputId = "kpi", label = "KPI", choices = kpis, selected = kpis[1]),
      selectInput(inputId = "fill_scale", label = "Color scale", choices = color_scales, selected = kpis[1]),
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
))
