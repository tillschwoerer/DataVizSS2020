shinyUI(dashboardPage(
  
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
))