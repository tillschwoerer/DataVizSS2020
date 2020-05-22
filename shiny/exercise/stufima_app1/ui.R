shinyUI(fluidPage
    (
        # Application title
        titlePanel("stufima app") ,
        sidebarLayout
        (
            sidebarPanel(
                sliderInput("erupt_filter",
                            "Eruption time in mins:",
                            min = er_filt_range[1],
                            max = er_filt_range[2],
                            value = 2.5),
                radioButtons("which", label = "which:",
                             choices = c("Waiting"="wait", "Eruptions"="erupt"), selected = "wait"),
                radioButtons("which_c", label = "color for:",
                             choices = c("Waiting"="wait", "Eruptions"="erupt"), selected = "wait")
            ),
            mainPanel(
                plotOutput("distPlot")
            )
        )
    )
)