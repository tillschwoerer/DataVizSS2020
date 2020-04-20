shinyServer(function(input, output, session) {
  
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
  
})
