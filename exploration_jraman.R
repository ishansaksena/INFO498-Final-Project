library(dplyr)
library(ggplot2)
library(tidyverse)


#trippub= read.csv("data/NHTSData/trippub.csv")
#vehpub= read.csv("data/NHTSData/vehpub.csv")

# View(head(hhpub))
# View(head(perpub))
# View(head(tripub))
# View(head(vehpub))

# Food Access by Census Tract
food_access= read.csv("data/FoodAccess.csv")

#View(head(food_access))

# Park Rankings by City
park_rankings = read.csv("data/ParkRankings.csv")

#View(head(park_rankings))

# Walkability / Bikeability by City
walkability = read.csv("data/walk-bike-ability.csv")
#View(head(walkability))

# Cities that appear across all three datasets
cities_of_interest = intersect(cities_health$CityName, intersect(walkability$City, park_rankings$City))

# Filter down to city
filtered_cities_health_city_level = filter(cities_health, CityName %in% cities_of_interest)
filtered_cities_health_city_level = filter(filtered_cities_health_city_level, GeographicLevel == "City")
filtered_cities_health_city_level = filter(filtered_cities_health_city_level, Year == 2015)
filtered_cities_health_city_level = filter(filtered_cities_health_city_level, Data_Value_Type == "Age-adjusted prevalence")
View(filtered_cities_health_city_level)

# Reshape Data
filtered_cities_health_city_level_subset = filtered_cities_health_city_level[, c("CityFIPS" ,"CityName", "Measure", "Data_Value")]
# View(filtered_cities_health_city_level_subset)
city_level_reshaped = spread(filtered_cities_health_city_level_subset, Measure, Data_Value)
View(city_level_reshaped)

# Combine with Walkability and park rankings
colnames(city_level_reshaped)[2] <- "City"
city_level_park_data = left_join(city_level_reshaped, park_rankings)
View(city_level_park_data)
colnames(city_level_park_data) <- c('CityFIPS', 'City', 'ARTH', 'BINGE', 'CANCER', 'CHOLESTEROL', 'CHR_KIDNEY', 'CHR_PUL', 'COR_HD', 'ASTH', 'H_INS', 'SMOKE', 'DIAB', 'HIGH_BP', 'HIGH_CHOL', 'MENTAL_NOTGOOD', 'NO_LEISURE', 'OBESITY', 'PHY_NOTGOOD', 'STROKE', 'MED_BP', 'DOC', 'RANK','POPN', 'MEDIAN', 'PARKLAND', 'PERCENT','SPENDING','BASKETBALL', 'DOGPARK','PLAYGROUNDS','RECREATION','AMENITIES','RAW_TOT','PARK_SCORE', 'PS_RATING')
write.csv(city_level_park_data, file = "prepped_data/ParkRankings.csv")
city_level_park_data <- city_level_park_data %>% arrange(desc(POPN))


city_level_walk_data = left_join(city_level_reshaped, walkability)
View(city_level_walk_data)
colnames(city_level_walk_data) <- c('CityFIPS', 'City', 'ARTH', 'BINGE', 'CANCER', 'CHOLESTEROL', 'CHR_KIDNEY', 'CHR_PUL', 'COR_HD', 'ASTH', 'H_INS', 'SMOKE', 'DIAB', 'HIGH_BP', 'HIGH_CHOL', 'MENTAL_NOTGOOD', 'NO_LEISURE', 'OBESITY', 'PHY_NOTGOOD', 'STROKE', 'MED_BP', 'DOC', 'STATE', 'WALK_SCORE', 'TRANS_SCORE', 'BIKE_SCORE', 'POPN')
write.csv(city_level_walk_data, file = "prepped_data/Walkability.csv")
city_level_walk_data <- city_level_walk_data %>% arrange(desc(POPN))


# Filter down to census tract
filtered_cities_health_tract_level = filter(cities_health, CityName %in% cities_of_interest)
filtered_cities_health_tract_level = filter(filtered_cities_health_tract_level, GeographicLevel == "Census Tract")
filtered_cities_health_tract_level = filter(filtered_cities_health_tract_level, Year == 2015)
View(filtered_cities_health_tract_level)

# Reshape Data



# Combine with Food Access Data

# Outcomes of interest (Variable names) @Jayashreeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
# Binge drinking among adults aged >=18 Years
# Current smoking among adults aged >=18 Years
# < 7 hours of sleep, 
# No leisure-time physical activity among adults aged >=18 Years
# High blood pressure among adults aged >=18 Years
# Taking medicine for high blood pressure control among adults aged >=18 Years with high blood pressure
# Mental health not good for >=14 days among adults aged >=18 Years

city_level_walk_data <- city_level_walk_data %>% arrange(desc(POPN))

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


#Function To Compute Correlation and return Correlation Value and Corresponding P-Value
#Arguments: 

compute_correlation <- function(dfName, col1, col2, subsetNum=NULL){
  print(is.null(subsetNum))
  if(!is.null(subsetNum)){
    dfName <- head(dfName, subsetNum)
  }
  c1 <- dfName[, (col1)]
  c2 <- dfName[, (col2)]
  print(c1)
  corTestValue <- cor.test(as.numeric(c1), as.numeric(c2))
  invisible(c(corTestValue$estimate, corTestValue$p.value))
}



