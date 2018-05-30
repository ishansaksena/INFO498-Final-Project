#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
source("park_viz.R")
source("walkability_viz.R")
source("food_access_viz.R")
source("introduction_viz.R")
source("data_viz.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$parkGraph <- renderPlotly({
    
    parkViz(input$select_condition)
    
  })
  
  output$parkBarGraph <- renderPlot({
    
    parkBarGraph(input$select_condition)
    
  })
  
  output$bikeGraph <- renderPlot({

    bikeviz(input$select_condition_bike)
  })
  
  output$bikeBarGraph <- renderPlot({
    bikeBarGraph(input$select_condition_bike)

  })
  
 
})
