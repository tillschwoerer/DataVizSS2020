shinyServer(function(input, output) {
   output$plot <- renderPlot({
     faithful %>%
       filter(eruptions > 2.5) %>%
       ggplot(aes(x = eruptions, y = waiting, color = eruptions)) +
       geom_point() +
       geom_smooth()
   })
})
