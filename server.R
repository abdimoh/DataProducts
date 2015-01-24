library(shiny)
library(datasets)
data(mtcars)
shinyServer(
  function(input, output) {
    
    output$histog <- renderPlot({
      
      data <- switch(input$var,
                     "Miles/(US) gallon" = mtcars$mpg,
                     "Number of cylinders" = mtcars$cyl,
                     "Gross horsepower" = mtcars$hp,
                     "Weight (lb/1000)" = mtcars$wt)
      
      hist(data, xlab = input$var, main = paste("Histogram of", input$var))
    })
    
    output$aver <- renderText({
      
      data <- switch(input$var2,
                     "4 cylinders" = tapply(mtcars$mpg, mtcars$cyl, mean)[[1]],
                     "6 cylinders" = tapply(mtcars$mpg, mtcars$cyl, mean)[[2]],
                     "8 cylinders" = tapply(mtcars$mpg, mtcars$cyl, mean)[[1]])               
      
     
       
#     hist(data, xlab = input$var, main = paste("Histogram of", input$var))
    })
    
    })