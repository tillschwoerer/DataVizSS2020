shinyServer(function(input, output, session) {
  
    output$plot <- renderPlot({
      
      x <- input$x
      y <- input$y
      kpi <- input$kpi
      cut_filter <- input$cut_filter
      fill_scale <- input$fill_scale
      
      df %>%
        filter(cut %in% cut_filter) %>%
        group_by(.data[[x]], .data[[y]]) %>%
        summarise(kpi = mean(.data[[kpi]])) %>%
        ggplot(aes(x = .data[[x]], y = .data[[y]], fill = kpi)) +
        geom_tile() +
        labs(fill = kpi) +
        scale_fill_viridis_c(option = fill_scale) +
        theme_minimal()
    })
})
