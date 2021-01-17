# Introduction into Data Visualization

library(dataset)
iris
datax <- datasets::iris
datax
# Loading data and storing it in "datax"
# Because why not?

# Panel Plot
plot(iris, col = "purple")

# Scatter Plot
plot(datax$Sepal.Length, datax$Sepal.Width)

plot(datax$Petal.Width,datax$Petal.Length,col="blue",
     xlab="Petal Width",ylab="Pepal Length")

# Histogram
hist(datax$Sepal.Length)
hist(datax$Petal.Length, col="23")

# Feature Plot
# We're gonna need "caret package" for this one.
#install.packages("caret")
library(caret)

featurePlot(x=datax[,1:4],
            y= datax$Species,
            plot="box",
            strip=strip.custom(par.strip.text=list(cex=.7)),
            scales = list(x=list(relation="free"),
                          y=list(relation="free")))
# Box plot for each variables.
            