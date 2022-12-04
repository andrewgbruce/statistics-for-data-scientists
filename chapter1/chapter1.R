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
mad(state$Population, constant = 1)


#manually creating the median absolute deviation to test it against the f'n in Python
median_minus_observed <- state$Population - Median(state$Population)
abs_median_minus_observed <- abs(median_minus_observed)
median_absolute_deviation <- Median(abs_median_minus_observed)
median_absolute_deviation

# Percentiles of the Murder Rate by State
quantile(state$Murder.Rate, p = c(0.05, 0.25, 0.5, 0.75, 0.95))

# Boxplot of the Population by State
boxplot(state$Population/1000000, ylab = "Population (millions)")

# Frequency Table of State Population 
#1: make breaks 
breaks <- seq(from = min(state$Population), to = max(state$Population), length = 11)
#2: divide data based on breaks (divide the data into 11 equal sections)
pop_freq <- cut(state$Population, breaks = breaks, right = TRUE, include.lowest = TRUE)
#3: make freq. table
table(pop_freq)

# Histogram of State Population
hist(state$Population, breaks = breaks, ylim = c(0, 25))

# Density estimate of Murder Rate
hist(state$Murder.Rate, freq = FALSE)
lines(density(state$Murder.Rate), lwd = 3, col = 'blue')
#by setting 'freq = FALSE', density is used on the y-axis instead of frequency (proportion instead of counts)
?density

dfw <- read.csv("dfw_airline.csv", header = TRUE)

# Barplot to show airport delays per year by cause for DFW 
barplot(as.matrix(dfw)/6, cex.axis = 0.5, las = 2, ylim = c(0, 20000))
?barplot
#added las = 2: orientation of axis labels to be perpendicular to x axis
#counts divided by 6 to reduce scale of data - shows the trend of data but not the actual data


