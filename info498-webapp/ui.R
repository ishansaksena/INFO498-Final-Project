#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Built Environments and their Effects on Health"),
  
  tabsetPanel(type = "tabs",
    
    tabPanel("Parks",
      # Sidebar with a slider input for number of bins 
      sidebarLayout(
        sidebarPanel(
           selectInput("select_condition", label = h3("Select Condition"), 
                       choices = list("Arthiritis", "Binge Drinking", "Coronary Heart Disease", "Asthma", "Smoking", "High Blood Pressure", "High Cholestrol", "Mental Health", "Obesity", "Physical Health"), 
                       selected = 1)
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("parkGraph"),
           plotOutput("parkBarGraph")
        )
      )
    ),
    
    tabPanel("Walkability")
    
  )
    
))
