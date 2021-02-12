############################################################
# R script to accompany Intro to R for Business, Chapter 10#
# This version is different from the original version      #
# Written by Jing Gong                                     #
############################################################

# Visualizing data in R using ggplot2
# Adapted from Intro to R for Business, Chapter 10 by Troy Adair#

# Clear out Console and Enviroment before we start
rm(list=ls(all=TRUE))
cat("\014")

############ Install and load ggplot2 package ############ 
if (!require("ggplot2")) install.packages("ggplot2")
library(ggplot2)


############ Import data ##############
# The data we will use is Yellow_Sample_Small.csv
# Make sure that you saved the csv file as well as this R script 
# in the working directory for your intro-to-R-2ed-master project
# you can check your working directory using getwd()


# before we start.... check the working directory
getwd()

# now import the data
DF <- read.csv("Yellow_Sample_Small.csv")

############ Using/Examining data ##############
View(DF)
str(DF)
summary(DF)


############ Visualizing data using base R's functions ############ 

hist(DF$trip_distance)
plot (fare_amount ~ trip_distance, data=DF)


############ Visualizing data using ggplot2 ############ 
ggplot(data = DF, aes(x=trip_distance))
ggplot(data = DF, aes(x=trip_distance)) + geom_histogram()
ggplot(data = DF, aes(passenger_count)) +  geom_bar()
ggplot(data = DF, aes(x=trip_distance, y=fare_amount)) +   geom_point()
ggplot(data = DF, aes(x=trip_distance, y=fare_amount)) + 
  geom_point() +
  geom_smooth(method=lm)


ggplot(data = DF, aes(x=trip_distance)) + 
  geom_histogram(binwidth=2) + 
  ggtitle("Trip Distance Distribution") + 
  xlab("Trip Distance (miles)")  + 
  ylab("Frequency")


ggplot(data = DF, aes(x=trip_distance)) + 
  geom_histogram(binwidth=2) + 
  ggtitle("Trip Distance Distribution") + 
  xlab("Trip Distance (miles)") + 
  ylab("Frequency") +
  theme_classic()

ggplot(data = DF, aes(x=trip_distance, y=fare_amount)) + 
  geom_point() +
  xlab("Trip Distance (miles)") + 
  ylab("Fare Amount ($)")

ggplot(data = DF, aes(x=trip_distance, y=fare_amount,color=passenger_count)) + 
  geom_point() +
  xlab("Trip Distance (miles)") + 
  ylab("Fare Amount ($)")

ggplot(data = DF, aes(x=trip_distance)) + 
  geom_histogram(binwidth=2) + 
  ggtitle("Trip Distance Distribution") +  
  xlab("Trip Distance (miles)") + 
  ylab("Frequency") + 
  facet_wrap(~passenger_count)


help(aes)
help(geom_boxplot)
help(geom_map)