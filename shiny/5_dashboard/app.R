library(shiny)
library(shinydashboard)
library(tidyverse)
library(gapminder)
library(plotly)
library(DT)

df <- gapminder %>% mutate(pop = as.numeric(gdpPercap))
years <- unique(df$year)
countries <- unique(df$country)
continents <- unique(df$continent)
vars <- c("lifeExp", "pop", "gdpPercap")
DT_options <- list(pageLength = 5, lengthMenu = c(5, 10, 15, 20), dom="tpl")

ui <- dashboardPage(
  
  dashboardHeader(title = "World Dashboard"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem(text = "Country", tabName = "country", icon = icon("flag")),
      menuItem(text = "Continent", tabName = "tab_continent", icon = icon("globe-africa"))
    )  
  ),
  
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "country",
        fluidRow(
          box(
            width = 12,
            collapsible = TRUE,
            selectInput("year_select", "Year", years, 2007, width = "20%"),
            DTOutput("country_table")
          ),
          box(
            title = "Select countries above",
            width = 12,
            collapsible = TRUE,
            plotlyOutput("country_plot"),
            selectInput("var", "Variable", vars)
          )
        )
      ),
      tabItem(
        tabName = "tab_continent",
        fluidRow(
          box(
            width = 12,
            plotlyOutput("continent_plot"),
            selectInput("continent_var", "Variable", vars)
          )
        )
      )  
    )
  )
)


server <- function(input, output, session) {
  
  ##################
  ### Countries ####
  ##################
  filtered <- reactive({
    df %>% filter(year %in% input$year_select) %>% arrange(-lifeExp) 
  })
  
  output$country_table <- renderDT({
    filtered() %>% datatable(filter = "top", options = DT_options)
  })

  output$country_plot <- renderPlotly({
    req(input$country_table_rows_selected)
    
    countries_selected <- filtered()[input$country_table_rows_selected, ] %>% pull(country)
    
    df %>%
      filter(country %in% countries_selected) %>%
      group_by(country, year) %>%
      summarise(Variable = sum(get(input$var))) %>%
      plot_ly(x = ~year, y=~Variable, color=~country, type="scatter", mode="lines+markers")
  })

  ##################
  ### Continent ##
  ##################
  output$continent_plot <- renderPlotly({
    df %>% 
      group_by(continent, year) %>%
      summarise(Variable = sum(get(input$continent_var))) %>%
      plot_ly(x = ~year, y=~Variable, color=~continent, type="scatter", mode="lines+markers")
  })
  

}

shinyApp(ui, server)