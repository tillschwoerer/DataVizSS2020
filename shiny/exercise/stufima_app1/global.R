library(shiny)
library(tidyverse)

waiting <- faithful[, 2]
eruptions <- faithful[, 1]
er_filt_range <- range(eruptions)

get_plot <- function(p_input_value, p_input_color, p_filtervalue=2.5){
  l_color <- ifelse(p_input_color=='erupt',"eruptions","waiting")
  print(paste("Color", l_color))
  switch (p_input_value,
    erupt = {
      l_data_x <- "eruptions"
      l_data_y <- "waiting"
    },
    {
      l_data_x <- "waiting"
      l_data_y <- "eruptions"
    }
  )
  return(
    faithful %>%
      filter(eruptions >= p_filtervalue) %>%
      ggplot(aes(x = .data[[l_data_x]], y = .data[[l_data_y]], color = .data[[l_color]])) +
      geom_point() +
      geom_smooth()
  )
}