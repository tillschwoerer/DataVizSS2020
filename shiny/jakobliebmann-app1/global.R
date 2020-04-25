library(shiny)
library(tidyverse)
library(DT)
choices <- c("eruptions", "waiting", "waiting/eruptions")
df <- faithful %>%
  mutate("waiting/eruptions" = round(waiting/eruptions, digits = 2))