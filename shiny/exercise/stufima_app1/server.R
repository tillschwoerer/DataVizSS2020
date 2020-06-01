shinyServer(function(input, output) {
    output$plot <- renderPlot({
        switch (input$which,
            erupt = {
                get_plot(input$which, input$which_c, input$erupt_filter)
            },
            {
                get_plot(input$which, input$which_c, input$erupt_filter)
            }
        )
    })
    output$output_dt <- renderDT({df})
})
