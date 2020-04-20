#########################################
# Creating custom functions with ggplot #
#########################################

library(tidyverse)
df <- ggplot2::diamonds

#########################################
# Starting point                        #
#########################################
# We want to create a plot like this ...
df %>% ggplot(aes(x = cut)) + geom_bar()

# ... using a custom function which takes the x-axis variable as an input
ggplot_bar <- function(x){
  df %>% ggplot(aes(x)) + geom_bar()
}

ggplot_bar("color")  # Our naive approach does not work 
ggplot_bar(cut)      # and this does not work either


###############################################
# Approach 1: Pass the variable as a character#
###############################################
# 
ggplot_bar1 <- function(x){
  df %>% ggplot(aes(.data[[x]])) + geom_bar()
}
ggplot_bar1("cut")   # The variable is passed as a character


##############################################################
# Approach 1: Pass the variable as a an unquoted column name #
##############################################################

ggplot_bar2 <- function(x){
  df %>% ggplot(aes(x = {{x}})) + geom_bar()
}
ggplot_bar2(cut)   # The variable is passed as an unquoted column name


###############################################
# What is the advantage of approach 1?        #
###############################################

## 1. Use map / lapply to generate multiple plots using few lines of code

plotlist <- list("cut", "color", "clarity") %>% map(ggplot_bar1)
plotlist
gridExtra::grid.arrange(grobs = plotlist, ncol = 2)

## 2. We can use this syntax to create Shiny Apps
## ... to be continued
