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
  titlePanel("Social Determinants of Health : Built Environments"),
  
  tabsetPanel(type = "tabs",

    tabPanel("Introduction", # Add a comma here when writing code for this tab
    
      # Add content for the About Us Tab
      mainPanel(
        h2("Built Environments: Neighbourhoods"),
        h5("A built environment includes, but is not limited to access to healthy food resources, parks, transportation facilities."),
        h5("We considered three main types of Built Environments:"),
        tags$ul(
          tags$li("Parks"), 
          tags$li("Transportation"), 
          tags$li("Food Access")
        ),
        h5("We used aggregated scores for each of these built environments for different cities in the United States and correlated it with the physical and mental heath outcomes for those cities"),
        
        h2("Significance"),
        h5("With most of the population migrating towards urban areas, we feel that planning and building a sustainable urban environment is very critical and essential"),
        h5("By analyzing the effect of different built environments and their effect on general public health, we wanted to emphasize what factors must be kept in mind while planning urban infrastructure."),
        
        
        h2("Target Audience"),
        tags$ul(
          tags$li("Urban City Planners"), 
          tags$li("Construction Firms"), 
          tags$li("Non-Profit organizations"),
          tags$li("Citizens")
        ),
        
        h5("Our goal is to explore the relation between neighbourhood built environments and public health through effective visualizations."),
        h5("Depending on how correlated these measures are, we could infer on how cities rank in these areas as well as set priorities for future research in this area.")
        
      
      )
    
    ),
    tabPanel("Data" # Add a comma here when writing code for this tab
             
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
    
    tabPanel("Bikeability", # Add a comma here when writing code for this tab
    
      # Add code for bikeability viz here
      sidebarLayout(
        sidebarPanel(
          selectInput("select_condition", label = h3("Select Condition"), 
                      choices = list("Arthritis", "Binge Drinking", "Coronary Heart Disease", "Asthma", "Smoking", "High Blood Pressure", "High Cholestrol", "Mental Health", "Obesity", "Physical Health"), 
                      selected = 1)
        ),
        
        mainPanel(
          plotOutput("bikeGraph"),
          plotOutput("bikeBarGraph")
        )
      )
                      
    ),
    
    tabPanel("Food" # Add a comma here when writing code for this tab
      
      # Add code for food viz here
             
    )
    
  )
    
))
