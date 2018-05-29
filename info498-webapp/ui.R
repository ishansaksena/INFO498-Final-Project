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

    tabPanel("Introduction" # Add a comma here when writing code for this tab
    
      # Add content for the About Us Tab
    
    ),
    tabPanel("Data", # Add a comma here when writing code for this tab
             
        h2("500 Cities Health Data"),
        p(
          a(href="https://www.cdc.gov/500cities/", "The 500 cities health dataset"),
          " provides city and census tract level estimates on chronic disease factors, health outcomes and 
            clinical preventive services."
        ),
        
        h2("Park Quality"),
        p(
          a(href="http://parkscore.tpl.org/rankings_advanced.php#sm.0000kbft6m124iel6ufsl45r54oqa", "The Parkscore 2018 dataset"),
          " provides city level scores for the quality of parks measured by acreage, access, safety, amenities 
          for the 100 most populous cities in the US. 93 of these cities also appear in 500 Cities health dataset."
        ),
        
        h2("Walkability and Bikeability"),
        p(
          a(href="https://www.walkscore.com/cities-and-neighborhoods/", "The Walkability annd Bikeability dataset"),
          " ranks cities based on walkability and bikeabilty. It scores both measures on the basis of access to public transit, 
          distances to amenities, proximity to other people and places of interest. "
        ),
        
        
        h2("Food Access"),
        p(
          a(href="https://www.ers.usda.gov/data-products/food-access-research-atlas/", "The Food Access Dataset"),
          " provides a census level overview for food access indicators and breaks it down further by race, age and income. 
          It provides measures for how many people have access to a grocery store within half a mile, 1 mile, and 10 miles."
        )
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
