library(dplyr)
library(ggplot2)

# 500 Cities Health Statistics
# https://www.cdc.gov/500cities/

cities_health = read.csv("data/500Cities.csv")
View(head(cities_health))

seattle_health = filter(cities_health, CityName == "Seattle")
View(head(seattle_health))

# National Household Travel Survey
# https://nhts.ornl.gov/documentation

hhpub= read.csv("data/NHTSData/hhpub.csv")
perpub= read.csv("data/NHTSData/perpub.csv")
trippub= read.csv("data/NHTSData/trippub.csv")
vehpub= read.csv("data/NHTSData/vehpub.csv")

View(head(hhpub))
View(head(perpub))
View(head(tripub))
View(head(vehpub))

# Food Access
food_access= read.csv("data/FoodAccess.csv")

View(head(food_access))
