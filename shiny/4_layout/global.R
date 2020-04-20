library(shiny)
library(tidyverse)

df <- ggplot2::diamonds

factors <- c("cut", "color", "clarity")
cuts <- unique(df$cut)
kpis <- c("price", "carat", "depth")
color_scales <- c("viridis", "magma", "cividis")