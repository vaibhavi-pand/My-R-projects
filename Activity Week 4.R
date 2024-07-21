#Assignment: Week 4 Activity: Decision Tree

#installing packages
install.packages('ISLR')
install.packages('rpart')
install.packages('rpart.plot')

library(ISLR)
library(rpart)
library(rpart.plot)

#using Hitters data set
library(datasets)
data("Hitters")

#loading data
data <- Hitters
str(data)

#summary
summary(data) # 59 missing values in variable salary

#view first six rows of data set
head(data)

#removing observations with unknown salary information
colSums(is.na(data))
data1 <- na.omit(data)

#checking if missing information is removed
summary(data1) #missing values in variable salary are removed

#initial decision tree
tree <- rpart(Salary ~ Years + HmRun, data=data1, control=rpart.control(cp=.0001))
prp(tree, type = 1, extra = 1, split.font = 2, varlen = -10)

#identification of best cp value
best <- tree$cptable[which.min(tree$cptable[,"xerror"]),"CP"]

#pruned tree
pruned_tree <- prune(tree, cp = best)
prp(pruned_tree, type = 1, extra = 1, split.font = 2, varlen = -10)