library(shiny)
library(tidyverse)

waiting <- faithful[, 2]
eruptions <- faithful[, 1]

get_bins <- function(p_which, p_input_bins){
  return(seq(min(p_which), max(p_which), length.out = p_input_bins + 1))
}

get_hist <- function(p_input_value, p_input_bins){
  l_data <- NULL
  l_title <- ""
  l_title_pre <- "Histogram of"
  l_title_suf <- ""
  switch (p_input_value,
    erupt = {
      l_data <- eruptions
      l_title_suf <- "Eruptions"
      l_title <- paste(l_title_pre , l_title_suf)
    },
    {
      l_data <- waiting
      l_title_suf <- "Waiting"
      l_title <- paste(l_title_pre , l_title_suf)
    }
  )
  bins <- get_bins(l_data, p_input_bins)
  return (hist(l_data,main = l_title, xlab = l_title_suf, breaks = bins, col = 'darkgray', border = 'white'))
}