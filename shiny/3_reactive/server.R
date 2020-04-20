library(shiny)
library(tidyverse)

df <- ggplot2::diamonds

shinyServer(function(input, output) {

    output$plot <- renderPlot({
        df %>% ggplot(aes(x = .data[[input$barvar]])) + geom_bar()
    })
})
