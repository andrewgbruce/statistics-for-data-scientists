setwd("/Users/susheel/Documents/GitHub/statistics-for-data-scientists/data")

state <- read.csv("state.csv", header = TRUE)

# EXAMPLE: Location Estimates of Population and Murder Rates
# TASK: compute the mean, trimmed mean, and median for the population
mean(state$Population)
mean(state$Population, trim = 0.1) #top 10% and bottom 10% removed, after sorting 
median(state$Population)

# TASK: compute average murder rate for country
library(matrixStats)
weighted.mean(state$Murder.Rate, w = state$Population)

library(DescTools)
Median(state$Murder.Rate, weights = state$Population)

# EXAMPLE: Variability Estimates of State Population
# TASK: compute the standard deviation, IQR and median absolute deviation for the population
sd(state$Population)
IQR(state$Population)
mad(state$Population)
