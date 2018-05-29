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

    tabPanel("About Us" # Add a comma here when writing code for this tab
    
      # Add content for the About Us Tab
    
    ),
    
    tabPanel("Parks",
      sidebarLayout(
        sidebarPanel(
           selectInput("select_condition", label = h3("Select Condition"), 
                       choices = list("Arthritis", "Binge Drinking", "Coronary Heart Disease", "Asthma", "Smoking", "High Blood Pressure", "High Cholestrol", "Mental Health", "Obesity", "Physical Health"), 
                       selected = 1)
        ),
        
        mainPanel(
           plotOutput("parkGraph"),
           plotOutput("parkBarGraph")
        )
      )
    ),
    
    tabPanel("Walkability" # Add a comma here when writing code for this tab
    
      # Add code for walkability viz here
                      
    ),
    
    tabPanel("Food" # Add a comma here when writing code for this tab
      
      # Add code for food viz here
             
    )
    
  )
    
))
