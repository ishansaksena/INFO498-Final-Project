library(dplyr)
library(ggplot2)
library(tidyverse)
source("exploration_ishy.R")


#Function To Compute Correlation and return Correlation Value and Corresponding P-Value
#Arguments: 

compute_correlation <- function(dfName, col1, col2, subsetNum=NULL){
  print(is.null(subsetNum))
  if(!is.null(subsetNum)){
    dfName <- head(dfName, subsetNum)
  }
  c1 <- dfName[, (col1)]
  c2 <- dfName[, (col2)]
  #print(c1)
  corTestValue <- cor.test((c1), (c2))
  return(invisible(c(corVal=corTestValue$estimate, pVal=corTestValue$p.value)))
}

################# FUnction Usage Example Start ################
# list_of_outcomes <- c('','','','','')
# col1 <- score being tested
# corValuesForListOfOutcomes <- data.frame()
# for (i in 1:length(list_of_outcomes)) {
#   x <- compute_correlation(df, col1, list_of_outcomes[i], subsetVal)
#   rbind(corValuesForListOfOutcomes, x)
# }
################# FUnction Usage Example Start ################









#head(city_level_walk_data)
test <- head(city_level_walk_data, 40)

x2 <- cor.test(as.numeric(test$BIKE_SCORE), test$NO_LEISURE)
apa(x2)
#"r = -0.52, t(38) = -3.75, p < 0.01 (2-tailed)"


x1 <- cor.test(as.numeric(city_level_walk_data$Transit.Score), city_level_walk_data$`No leisure-time physical activity among adults aged >=18 Years`)
#-0.05
x2 <- cor.test(as.numeric(city_level_walk_data$Transit.Score), city_level_walk_data$`High blood pressure among adults aged >=18 Years`)
#-0.07
x3 <- cor.test(as.numeric(city_level_walk_data$Transit.Score), city_level_walk_data$`Mental health not good for >=14 days among adults aged >=18 Years`)
#0.05
x4 <- cor.test(as.numeric(city_level_walk_data$Transit.Score), city_level_walk_data$`High blood pressure among adults aged >=18 Years`)
#-0.07(high p-value)
x5 <- cor.test(as.numeric(city_level_walk_data$Transit.Score), city_level_walk_data$`Taking medicine for high blood pressure control among adults aged >=18 Years with high blood pressure`)
#-0.1(high p-value)
