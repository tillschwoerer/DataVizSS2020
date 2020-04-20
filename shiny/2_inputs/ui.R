shinyUI(fluidPage(

  ### Text
  textInput(inputId="name", label="What's your name?"),
  passwordInput("password", "What's your password?"),
  textAreaInput("story", "Tell me about yourself", rows = 3),
  
  ### Numeric
  numericInput("age", "How old are you?", value = 18, min = 0, max = 100),
  sliderInput("size", "How tall are you?", value = 150, min = 0, max = 200),
  sliderInput("range", "Range", value = c(10, 20), min = 0, max = 100),
  
  ### Dates
  dateInput("birthday", "When were you born?"),
  dateRangeInput("holiday", "When are your next holidays?"),
  
  ### Limited choices
  selectInput("meal", "What's your favourite meal?", c("Pizza", "Pasta")),
  radioButtons("animal", "What's your favourite animal?", c("Dog", "Cat")),
  checkboxGroupInput("dessert", "Which desserts do you like?", c("Icecream", "Cake", "Mousse au chocolat")),
  selectInput("drink", "Which drinks do you like?", c("Sparkling water", "Red wine", "Beer"), multiple = TRUE)
    
))
