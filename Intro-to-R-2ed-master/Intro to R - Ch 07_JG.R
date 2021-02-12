############################################################
# R script to accompany Intro to R for Business, Chapter 07#
# This version is different from the original version      #
# Written by Jing Gong                                     #
############################################################

# Cleaning Data in R

# Clear out Console and Enviroment before we start
rm(list=ls(all=TRUE))
cat("\014")

#The data is downloaded from New York Times Coronavirus (Covid-19) Data in the US
# https://github.com/nytimes/covid-19-data

#Make sure that you saved the file in the working directory for your intro-to-R-2ed-master project
#you can check your working directory using getwd()

# The file name of the data I use is covid19-us-counties-0328.csv
# If you have a different file name, you should use the file name you have


#before we start.... check the working directory
getwd()

############ Import data ##############
DF <- read.csv("covid19-us-counties-0328.csv") 


############ Using/Examining data ##############
View(DF)
str(DF)
head(DF)
summary(DF)


############ Installing dplyr (if required) and loading it into memory  ##############
if (!require("dplyr")) install.packages("dplyr")
library("dplyr")

# Alternatively, you can install and load tidyverse
# if (!require("tidyverse")) install.packages("tidyverse")
# library(tidyverse)

############ Filter rows with filter() ##############
# Pick all rows for Philadelphia, Pennsylvania
filter(DF,county=="Lehigh",state=="Pennsylvania")

# Save the subset as a new data frame
lehigh <- filter(DF,county=="Lehigh",state=="Pennsylvania")

-# Observations in Pennsylvania with more than 100 cases on 2020-03-28
  filter(DF,state=="Pennsylvania",cases>100,date=="2020-03-28")
# Using logical operators
filter(DF,state=="Pennsylvania" & cases>100 & date=="2020-03-28")

# Observations in Lehigh County or Northampton County
filter(DF, state=="Pennsylvania" & (county=="Lehigh"|county=="Northampton"))


############ Arrange rows with arrange() ##############
#Sort rows based on state and county names
arrange(DF,state,county)

#Save it as a new data frame
DF_arranged <- arrange(DF, state, county)

#sort rows based on date (in ascending order), cases (in descending order)
arrange(DF,state,desc(cases))

############ Select columns with select() ##############
#Select date, county, state, and cases
select(DF,date,county,state,cases)

#Selecting all columns between date and state, (inclusive), as well as cases
select(DF,date:state,cases)

#Selecting all columns except fips and cases
select(DF,-(fips:cases))

#Save as a new data frame
DF_death<-select(DF,-(fips:cases))


############ Select columns with select() ##############
#Add a column representing death rate
mutate(DF, death_rate = deaths/cases)

#Add another column converting the date from character type to date type
mutate(DF, death_rate = deaths/cases, date_new = as.Date(date))

#Save it as a new data frame
DF_new <- mutate(DF, death_rate = deaths/cases, 
                 date_new = as.Date(date))
str(DF_new)

############ Grouped summaries with summarise() ##############
#summarise() gives the summary statistics
#group by date
by_day <- group_by(DF,date)
#the total number of cases and number of counties with cases
summarise(by_day,tot_cases=sum(cases),num_counties=n())

#group by date and state
by_day_state <- group_by(DF,date,state)
#the total number of cases and number of counties with cases
cases_day_state <- summarise(by_day_state,tot_cases=sum(cases),num_counties=n())
View(cases_day_state)

############ Merging COVID-19 data with population data ##############
# importing the population data
pop <- read.csv("population2018.csv") 
View(pop)

# merging using left_join
DF_pop <- left_join(DF, pop, by="fips")
View(DF_pop)
