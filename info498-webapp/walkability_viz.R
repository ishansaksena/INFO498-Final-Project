library("dplyr")
library("ggplot2")
library("knitr")
library("plotly")

bikeability_data <- read.csv("prepped_data/Walkability.csv")


bikeability_data <- bikeability_data[unique(park_data$City), ]
bikeability_data <- bikeability_data[order(-park_data$ParkScore), ]
cols <- c("City", "Arthritis.among.adults.aged...18.Years", "Binge.drinking.among.adults.aged...18.Years", "Coronary.heart.disease.among.adults.aged...18.Years", "Current.asthma.among.adults.aged...18.Years", "Current.smoking.among.adults.aged...18.Years", "High.blood.pressure.among.adults.aged...18.Years", "High.cholesterol.among.adults.aged...18.Years.who.have.been.screened.in.the.past.5.Years", "Mental.health.not.good.for...14.days.among.adults.aged...18.Years", "Obesity.among.adults.aged...18.Years", "Physical.health.not.good.for...14.days.among.adults.aged...18.Years", "Bike.Score")
#cols <- c("City", "CityFIPS", "City" , "ARTH", "BINGE" , "COR_HD", "ASTH", "SMOKE", "HIGH_BP", "HIGH_CHOL", "MENTAL_NOTGOOD", "OBESITY", "PHY_NOTGOOD", 
             #"BIKE_SCORE")
bike_data_viz <- bikeability_data[, cols]
colnames(bike_data_viz) <- c("City", "Arthritis", "Binge Drinking", "Coronary Heart Disease", "Asthma", "Smoking", "High Blood Pressure", "High Cholestrol", "Mental Health", "Obesity", "Physical Health", "Bike Score")


bikeviz <- function(condition) {
  plot <- ggplot(bike_data_viz, aes(x = bike_data_viz[condition], y = bike_data_viz$`Bike Score`)) + 
    scale_x_discrete(breaks = seq(20, 100, by = 10)) +
    geom_point(aes(col = "indianred")) +
    #geom_smooth(method = "lm", se = T, col = "deepskyblue3") +
    labs(x = condition, y = "Bike Score", title = paste0(condition, " VS Bike Score")) + 
    theme(
      legend.position = "none",
      panel.background = element_rect(size = 0.5, linetype = "solid"),
      panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                      colour = "gray94"),
      panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                      colour = "gray94")

    )
  return (plot)
}

bikeBarGraph <- function(condition) {
  df <- head(bike_data_viz[order(-bike_data_viz[condition]), ], 10)
  df <- df[, c("City", condition)]
  plot <- ggplot(df, aes(x = City, y = df[condition])) +
    geom_bar(stat = "identity", width = .5, fill = "lightcoral") + 
    labs(x = "City", y = paste0(condition, "(%)"), title = paste0("Top 10 Cities with Highest Levels of ", condition)) +
    theme(
      legend.position = "none",
      panel.background = element_rect(fill = "gray29",
                                      colour = "gray29",
                                      size = 0.5, linetype = "solid"),
      panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                      colour = "gray94"), 
      panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                      colour = "gray94")
    )
  return (plot)
}

