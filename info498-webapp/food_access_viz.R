library("dplyr")
library("ggplot2")
library("knitr")
library("plotly")

bikeability_data <- read.csv("prepped_data/Walkability.csv")


bikeability_data <- bikeability_data[unique(park_data$City), ]
bikeability_data <- bikeability_data[order(-park_data$ParkScore), ]
cols <- c("City", "CityFIPS", "City" , "ARTH", "BINGE" , "COR_HD", "ASTH", "SMOKE", "HIGH_BP", "HIGH_CHOL", "MENTAL_NOTGOOD", "OBESITY", "PHY_NOTGOOD", 
          [25] "WALK_SCORE"     "TRANS_SCORE"    "BIKE_SCORE"    
          [28] "POPN" 
bike_data_viz <- bikeability_data[, cols]
colnames(park_data_viz) <- c("City", "Arthritis", "Binge Drinking", "Coronary Heart Disease", "Asthma", "Smoking", "High Blood Pressure", "High Cholestrol", "Mental Health", "Obesity", "Physical Health", "Park Score")


