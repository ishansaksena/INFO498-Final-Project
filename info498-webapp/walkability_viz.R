library("dplyr")
library("ggplot2")
library("knitr")
library("plotly")

bikeability_data <- read.csv("prepped_data/Walkability.csv")


bikeability_data <- bikeability_data[unique(bikeability_data$City), ]
bikeability_data <- bikeability_data %>% arrange(desc(Bike.Score))
#cols <- c("City", "Arthritis.among.adults.aged...18.Years", "Binge.drinking.among.adults.aged...18.Years", "Coronary.heart.disease.among.adults.aged...18.Years", "Current.asthma.among.adults.aged...18.Years", "Current.smoking.among.adults.aged...18.Years", "High.blood.pressure.among.adults.aged...18.Years", "High.cholesterol.among.adults.aged...18.Years.who.have.been.screened.in.the.past.5.Years", "Mental.health.not.good.for...14.days.among.adults.aged...18.Years", "Obesity.among.adults.aged...18.Years", "Physical.health.not.good.for...14.days.among.adults.aged...18.Years", "Bike.Score")
cols <- c("City" , "ARTH", "BINGE" , "COR_HD", "ASTH", "SMOKE", "HIGH_BP", "HIGH_CHOL", "MENTAL_NOTGOOD", "OBESITY", "PHY_NOTGOOD", "BIKE_SCORE") 
bike_data_viz <- bikeability_data[, cols]
colnames(bike_data_viz) <- c("City", "Arthritis", "Binge Drinking", "Coronary Heart Disease", "Asthma", "Smoking", "High Blood Pressure", "High Cholestrol", "Mental Health", "Obesity", "Physical Health", "Bike Score")
