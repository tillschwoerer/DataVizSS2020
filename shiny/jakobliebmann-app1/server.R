shinyServer(function(input, output) {
  output$plot <- renderPlot({
     filval <- input$filtervalue
     x <- input$x
     y <- input$y
     color <- input$color
     faithful %>%
       mutate("waiting/eruptions" = waiting/eruptions) %>%
       filter(eruptions > filval) %>%
       ggplot(aes(x = .data[[x]], y = .data[[y]], color = .data[[color]])) +
       geom_point() +
       geom_smooth()
   })
})
