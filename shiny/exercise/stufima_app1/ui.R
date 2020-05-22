shinyUI(fluidPage
    (
        # Application title
        titlePanel("stufima app") ,
        sidebarLayout
        (
            sidebarPanel(
                numericInput("bins",
                            "Number of bins:",
                            min = 1,
                            max = 50,
                            value = 30),
                radioButtons("which", label = "which histogram:",
                             choices = c("Waiting"="wait", "Eruptions"="erupt"), selected = "wait")
            ),
            mainPanel(
                plotOutput("distPlot")
            )
        )
    )
)