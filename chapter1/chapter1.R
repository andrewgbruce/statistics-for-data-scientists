setwd("/Users/susheel/Documents/GitHub/statistics-for-data-scientists/data")

state <- read.csv("state.csv", header = TRUE)

# TOPIC: Location Estimates of Population and Murder Rates
# TASK: compute the mean, trimmed mean, and median for the population
mean(state$Population)
mean(state$Population, trim = 0.1) #top 10% and bottom 10% removed, after sorting 
median(state$Population)

# TASK: compute average murder rate for country
library(matrixStats)
weighted.mean(state$Murder.Rate, w = state$Population)

library(DescTools)
Median(state$Murder.Rate, weights = state$Population)

# TOPIC: Variability Estimates of State Population
# TASK: compute the standard deviation, IQR and median absolute deviation for the population
sd(state$Population)
IQR(state$Population)
mad(state$Population, constant = 1)

#manually creating the median absolute deviation to test it against the f'n in Python
median_minus_observed <- state$Population - Median(state$Population)
abs_median_minus_observed <- abs(median_minus_observed)
median_absolute_deviation <- Median(abs_median_minus_observed)
median_absolute_deviation

# TOPIC: Data distribution
# TASK: Calculate percentiles of the Murder Rate by State
quantile(state$Murder.Rate, p = c(0.05, 0.25, 0.5, 0.75, 0.95))

# TASK: Boxplot of the Population by State
boxplot(state$Population/1000000, ylab = "Population (millions)")

# TASK: Create frequency Table of State Population 
#1: make breaks 
breaks <- seq(from = min(state$Population), to = max(state$Population), length = 11)
#2: divide data based on breaks (divide the data into 11 equal sections)
pop_freq <- cut(state$Population, breaks = breaks, right = TRUE, include.lowest = TRUE)
#3: make freq. table
table(pop_freq)

# TASK: Create histogram of State Population
hist(state$Population, breaks = breaks, ylim = c(0, 25))

# TASK: Depict density estimate plot of Murder Rate
hist(state$Murder.Rate, freq = FALSE)
lines(density(state$Murder.Rate), lwd = 3, col = 'blue')
#by setting 'freq = FALSE', density is used on the y-axis instead of frequency (proportion instead of counts)
?density

dfw <- read.csv("dfw_airline.csv", header = TRUE)

# TOPIC: Explore Binary and Categorical Data  
# TASK: Barplot to show airport delays per year by cause for DFW 
barplot(as.matrix(dfw)/6, cex.axis = 0.5, las = 2, ylim = c(0, 20000))
?barplot
#added las = 2: orientation of axis labels to be perpendicular to x axis
#counts divided by 6 to reduce scale of data - shows the trend of data but not the actual data

# TASK: Correlation matrix 
wines <- read.csv("winequality-red.csv", header = TRUE)

install.packages("corrplot")
library(corrplot)
corrplot(cor(wines), method = "ellipse")

?corrplot
corrplot(cor(wines), method = "number", number.cex = 0.5, bg = "black")
#changed format of correlation matrix since ellipse was too fancy and easier to just read numbers and interpret the corr. coeff.
#changed background to black since it's difficult to see light colors on white and the diagonal values have no significance

# TASK: Scatterplot to explore relationship between pH and chlorides in winequality-red data
# r of pH and chlorides: -0.27 
# interpretation: weak negative correlation

plot(wines$pH, wines$chlorides, xlab = "pH", ylab = "chlorides")
#makes sense as to why it's a negative yet weak relationship, it does seem to slope downward from high chloride, low pH to low chloride, high pH; however, a great majority of values are gathered, away from the pattern, in the lower values of each variable - thus causing a weak correlation between pH and chlorides.

# TASK: hexagonal binning to explore relationship between SqftTotLiving and TaxAssessedValue (2 numeric variables)
df <- read.csv("kc_tax.csv", header = TRUE)

kc_tax <- subset(df, TaxAssessedValue < 750000 & SqFtTotLiving > 100 & SqFtTotLiving < 3500)
#subset the data

library(ggplot2)
library(hexbin)
ggplot(kc_tax, (aes(x = SqFtTotLiving, y = TaxAssessedValue))) + stat_binhex(color = "white") + theme_bw() + scale_fill_gradient(low = "white", high = "black") + labs(x = "Finished Square Feet", y = "Tax Assessed Value")


# TASK: contour plot to explore relationship between SqftTotLiving and TaxAssessedValue to visualize 2 numeric variables
ggplot(kc_tax, aes(SqFtTotLiving, TaxAssessedValue)) + theme_bw() + geom_point(alpha = 0.1) + geom_density2d(color = "white") + labs(x = "Finished Square Feet", y = "Tax Assessed Value")


# TASK: Contingency Table of loan grade and status to visualize 2 categorical variables
lc_loans <- read.csv("lc_loans.csv", header = TRUE)
install.packages("descr")

library(descr)

x_tab <- CrossTable(lc_loans$grade, lc_loans$status, prop.c = FALSE, prop.chisq = FALSE, prop.t = FALSE)
x_tab

?CrossTable

# TASK: Plot boxplot to visualize categorical and numerical variables
df <- read.csv("airline_stats.csv", header = TRUE)
boxplot(pct_atc_delay ~ airline, data = df, ylim = c(0, 100))

# TASK: Plot violin plot to visualize categorical and numerical variables
df <- read.csv("airline_stats.csv", header = TRUE)
ggplot(data = df, aes(airline, pct_carrier_delay)) + ylim(0, 50) + geom_violin() + labs(x = "", y = "Daily % of Delayed Flights")


#ggplot(data = df, aes(airline, pct_carrier_delay)) + ylim(0, 50) + geom_violin() + geom_boxplot() + labs(x = "", y = "Daily % of Delayed Flights")

# TASK: Plot various aspects of the effect of Finished Square Feet on Tax Value for data conditioning
df <- read.csv("kc_tax.csv", header = TRUE)

kc_tax <- subset(df, TaxAssessedValue < 750000 & SqFtTotLiving > 100 & SqFtTotLiving < 3500)

ggplot(subset(kc_tax, ZipCode %in% c(98188, 98105, 98108, 98126)), aes(x = SqFtTotLiving, y = TaxAssessedValue)) + 
stat_binhex(color = "white") + theme_bw() + scale_fill_gradient(low = "white", high = "blue") + labs(x = "Finished Square Feet", y = "Tax Assessed Value") + facet_wrap("ZipCode")
