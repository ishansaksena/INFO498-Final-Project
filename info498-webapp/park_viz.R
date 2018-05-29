library("dplyr")
library("ggplot2")
library("knitr")

park_data <- read.csv("prepped_data/ParkRankings.csv")

park_data <- park_data[unique(park_data$City), ]
park_data <- park_data[order(-park_data$ParkScore), ]
park_data_viz <- park_data %>% select("City", "Arthritis.among.adults.aged...18.Years", "Binge.drinking.among.adults.aged...18.Years", "Coronary.heart.disease.among.adults.aged...18.Years", "Current.asthma.among.adults.aged...18.Years", "Current.smoking.among.adults.aged...18.Years", "High.blood.pressure.among.adults.aged...18.Years", "High.cholesterol.among.adults.aged...18.Years.who.have.been.screened.in.the.past.5.Years", "Mental.health.not.good.for...14.days.among.adults.aged...18.Years", "Obesity.among.adults.aged...18.Years", "Physical.health.not.good.for...14.days.among.adults.aged...18.Years", "ParkScore")
colnames(park_data_viz) <- c("City", "Arthiritis", "Binge Drinking", "Coronary Heart Disease", "Asthma", "Smoking", "High Blood Pressure", "High Cholestrol", "Mental Health", "Obesity", "Physical Health", "Park Score")

parkViz <- function(condition) {
  plot <- ggplot(park_data_viz, aes(x = park_data_viz[condition], y = park_data_viz$`Park Score`)) + 
    geom_point(aes(col = "indianred")) +
    geom_smooth(method = "lm", se = T, col = "deepskyblue3") +
    labs(x = condition, y = "Park Score") + 
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

parkBarGraph <- function(condition) {
  df <- head(park_data_viz[order(-park_data_viz[condition]), ] %>% select("City", condition), 10)
  plot <- ggplot(df, aes(x = City, y = df[condition])) +
    geom_bar(stat = "identity", width = .5, fill = "lightcoral") + 
    labs(x = "City", y = paste0(condition, "(%)")) +
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
