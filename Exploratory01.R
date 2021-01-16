#install.packages("tidyverse")
#install.packages("funModeling")
#install.packages("Hmisc")
#install.packages("dplyr")
#install.packages("skimr")
#install.packages("RCurl")
#install.packages("database")



# Importing Data

library(datasets) # loading the needed library

data(iris) # loading data

data <- datasets::iris
data

library(RCurl)

View(data)
iris$Sepal.Length
iris$Species
Species <- iris$Species
Species

# Summary Statistics

head(data,5)
# looking at the first 5 rows of data.

summary(data)
# Summary statistics for 
# every variable.
summary(data$Sepal.Length)
# Sepal.length's sum. statistics
# We can also use skimr function to get
# more info about data.
# install.packages("skimr")

sum(is.na(data))
is.na(data)
# We can se that there are no missing value
#in the dataframe.


library(skimr)
skim(data)
# It gives an in-depth summary statistics.
# We can see that there are no missing value.
# We can say that all of the variables are not normally
# distributed according to histogram graphs.
# We can also see 1st, 2nd, 3rd, 4th quarter spans. 


# Grouping data by Species and performing skim on it.
# We need dply library to do that.
library(dplyr)

iris %>%
  dplyr::group_by(Species) %>%
  skim()
# In Sepal.Length, virginica has the highest mean value.


# Panel Plot
plot(data)
plot(data, col="red")

# Scatter Plot
plot(data$Petal.Width, data$Petal.Length)

# Histogram Plot
hist(data$Sepal.Length)
# After the small introduction now we can
# dive into the EDA.

# Subsetting a factor variable and looking for
# a value in it or a factor in our case.
Species <- subset(data, select="Species")
Setosa <- filter(data,Species == "setosa")
count(Setosa)


######## EDA(Explatory Data Analysis) ########

glimpse(data) # it is in the 
# Getting the metrics about data types, zeros,
# infinite numbers and missing values.
# Which in our cause Species is factor and other than that
# all variables are double.

# We need 
# install.packages("funModeling")
library(funModeling) # to continue.

status(data)
# We can see the types of variables.
# Sepal.Length has 35 unique values.
# Petal.Width  has 22 unique values.
# p_na means that %100 of NON-NA Values
# All variables has no missing values.

# Analyzing Categorical Variables
freq(data)
# We can see that %33.33 of data is virginica
# %33.33 is versicolor and %33.33 is setosa.
# We can also have a look at their cumulative_percs.

# Analyzing Numerical Variables
plot_num(data)


######## Analyzing with both Numerical and Categorical ########
# using Hmisc library

library(Hmisc)
describe(data)


# Customizing graphs in R

hist(data$Sepal.Length,xlab="Sepal Length", ylab="Freq", title="Histogram of Sepal Length")
# xlab= xaxis title
# ylab= yaxis title
# title = graphs main title


species <- group_by(data,Species)
species

hist(species,xlab="Specie Names", ylab="Freq", title="Species")
Species

verginica <- count(data$Species())


