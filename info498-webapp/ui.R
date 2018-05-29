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
    tabPanel("Data", # Add a comma here when writing code for this tab
             
        h2("500 Cities Health Data"),
        p(
          a(href="https://www.cdc.gov/500cities/", "The 500 cities health dataset"),
          " provides city and census tract level estimates on chronic disease factors, health outcomes and 
            clinical preventive services.",
          "From this dataset we used data on binge drinking, smoking, sleep durations, time for leisure and physical activities,
          blood pressure and mental health."
        ),
        
        h2("Park Quality"),
        p(
          a(href="http://parkscore.tpl.org/rankings_advanced.php#sm.0000kbft6m124iel6ufsl45r54oqa", "The Parkscore 2018 dataset"),
          " provides city level scores for the quality of parks measured by acreage, access, safety, amenities 
          for the 100 most populous cities in the US. 93 of these cities also appear in 500 Cities health dataset.",
          "From this dataset we used just the park score for each city. We then calculated correlations with 
          the above listed factors from the 500 Cities Health Dataset."
        ),
        
        h2("Walkability and Bikeability"),
        p(
          a(href="https://www.walkscore.com/cities-and-neighborhoods/", "The Walkability annd Bikeability dataset"),
          " ranks cities based on walkability and bikeabilty. It scores both measures on the basis of access to public transit, 
          distances to amenities, proximity to other people and places of interest. ",
          "From this dataset we used just the three scores i.e. walkability, bikeability, and transit scores for each city. 
          We then calculated correlations with the above listed factors from the 500 Cities Health Dataset."
        ),
        
        
        h2("Food Access"),
        p(
          a(href="https://www.ers.usda.gov/data-products/food-access-research-atlas/", "The Food Access Dataset"),
          " provides a census level overview for food access indicators and breaks it down further by race, age and income. 
          It provides measures for how many people have access to a grocery store within half a mile, 1 mile, and 10 miles.",
          "From this dataset we used just data on the share of people who live far away from grocery stores for each census tract. 
          We then calculated correlations with the above listed factors from the 500 Cities Health Dataset."
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
