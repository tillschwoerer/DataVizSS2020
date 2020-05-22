shinyServer(function(input, output) {
    output$distPlot <- renderPlot({
        switch (input$which,
            erupt = {
                get_plot(input$which, input$which_c, input$erupt_filter)
            },
            {
                get_plot(input$which, input$which_c, input$erupt_filter)
            }
        )
    })
})
