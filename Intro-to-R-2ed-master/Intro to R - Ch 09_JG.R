############################################################
# R script to accompany Intro to R for Business, Chapter 09#
# This version is different from the original version      #
# Written by Jing Gong                                     #
############################################################

#Analyzing data in R using Rcmdr
#by Jing Gong

# Clear out Console and Enviroment before we start
rm(list=ls(all=TRUE))
cat("\014")

############ Installing and Loading Rcmdr ##############
# Please read the Rcmdr Installation Instructions before running the code below
# Windows users: make sure you have installed Rtools
# Mac users: make sure you have installed XQuartz

# now let's run Rcmdr
if (!require("Rcmdr")) install.packages("Rcmdr")
library(Rcmdr)

############ Installing readr (if required) and loading it into memory  ##############
if (!require("readr")) install.packages("readr")
library("readr")

############ Installing dplyr (if required) and loading it into memory  ##############
# We will be using dplyr as well, so let's load it
if (!require("dplyr")) install.packages("dplyr")
library("dplyr")

# Alternatively, you can install and load tidyverse
# if (!require("tidyverse")) install.packages("tidyverse")
# library(tidyverse)

############ Import data ##############
# The data we will use is Yellow_Sample.csv
# Make sure that you saved the csv file as well as this R script 
# in the working directory for your intro-to-R-2ed-master project
# you can check your working directory using getwd()


# before we start.... check the working directory
getwd()

# now import the data
DF <- read_csv("Yellow_Sample.csv", col_names=TRUE)

############ Using/Examining data ##############
View(DF)
str(DF)
summary(DF)

############ Filter rows with filter() ##############
Yellow_filter <-  filter(DF, trip_distance<100,fare_amount>=0,fare_amount<100000,
                         total_amount>0)
summary(Yellow_filter)

############ When done with Rcmdr, detach it ##############
detach("package:Rcmdr", unload = TRUE)
