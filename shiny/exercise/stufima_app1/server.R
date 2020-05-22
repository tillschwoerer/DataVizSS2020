shinyServer(function(input, output) {
    output$distPlot <- renderPlot({
        switch (input$which,
            erupt = {
                get_hist(input$which, input$bins)
            },
            {
                get_hist(input$which, input$bins)
            }
        )
    })
})
