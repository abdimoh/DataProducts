library(shiny)
library(markdown)
shinyUI(fluidPage(
  
  titlePanel("Explore Data on Cars "),
  
  fluidRow(
    column(8, offset = 2,
           includeMarkdown(rmarkdown::render("Readme.Rmd"))
    )),
  
  hr(),
  
    fluidRow(column (4,
      helpText("Show a histogram of a car variable 
        based on the data mtcars."),
      

      
      selectInput("var", 
                  label = "Choose a variable to display",
                  choices = list("Miles/(US) gallon", "Number of cylinders",
                                 "Gross horsepower", "Weight (lb/1000)"),
                  selected = "Miles/(US) gallon") ,  
      
      br(), br(),br(),
      
      
      selectInput("var2", 
                  label = "Average miles per gallon (mpg) by number of cylinders in the car (cyl)",
                  choices = list("4 cylinders", "6 cylinders",
                                 "8 cylinders"),
                  selected = "4 cylinders")   
      
        )),
    
    
    
        mainPanel( plotOutput('histog'),  h4('Average Miles per Gallon'), verbatimTextOutput("aver"))

        
    
    
  )
)
