# Week 2 Activity: GitHub and Linear Regression

#create dataset
df <- data.frame(years_experienced=c(1.1, 1.3, 1.5, 2.0, 2.2, 2.9, 3.0, 3.2, 3.2, 3.7),
                 salary=c(39343.00, 46205.00, 37731.00, 43525.00, 39891.00, 56642.00, 
                          60150.00, 54445.00, 64445.00, 57189.00))

#view first six rows of dataset
head(df)

#visualizing data 
plot(df$years_experienced, df$salary, main='Salary versus Years of Experience',xlab='Years of Experience',ylab='Salary')

#distribution of salary and checking for outliers
boxplot(df$salary)

#installing packages
install.packages('caTools')
library(caTools)

#fitting simple linear regression to the training set
set.seed(101)
split = sample.split(df$salary, SplitRatio = 0.7)
trainingset = subset(df, split == TRUE)
testset = subset(df, split == FALSE)
model= lm(formula = salary ~ years_experienced,
         data = trainingset)

#summary of the model
summary(model)

