# Run Split attempt.R before running this code 
# This code assumes the data has already been split 

# Begin working on first dataset 
library(DMwR)
ds1$Rings <- as.factor(ds1$Rings)

# SMOTE dataset 
ds1_smote1 <- SMOTE(Rings ~. , data = ds1, perc.over = 100, perc.under = 1000)
ds1_smote2 <- SMOTE(Rings~., data = ds1_smote1, perc.over = 100, perc.under = 1100)

# Properties of new smote'd dataset 
prop.table(table(ds1_smote2$Rings))
table(ds1_smote2$Rings)


# Original number of observations 
table(ds1$Rings)
prop.table(table(ds1$Rings))

#########

# Start using algorithms on newly balanced dataset 
library(randomForest)

ds1_fit1 <- randomForest(Rings ~ ., data = ds1_smote2)
ds1_fit1$confusion
accuracy_ds1 <- sum(diag(ds1_fit1$confusion))/nrow(ds1_smote2)
accuracy_ds1

######

# Test and training Set 
numb_obs_ds1_2 <- nrow(ds1_smote2)
want1 <- sample(numb_obs_ds1_2, 0.75*numb_obs_ds1_2)
train1 <- ds1_smote2[want1, ]
test1 <- ds1_smote2[-want1, ]

# Train and predict on samples 
ds1_fit2 <-randomForest(Rings~., data = train1, importance = T)
ds1_fit2$confusion
accuracy_ds1_2 <- sum(diag(ds1_fit2$confusion))/nrow(train1)
accuracy_ds1_2

predictions_ds1_2 <- predict(ds1_fit2, test1)
r_ds1_2 <- table(predictions_ds1_2, test1$Rings)
pred_accuracy <- sum(diag(r_ds1_2))/nrow(test1)
pred_accuracy


# Multinomial regression 
library(nnet)
# Do I need to set a baseline before multinomial regression
# Guide http://www.ats.ucla.edu/stat/r/dae/mlogit.htm 
# http://stats.stackexchange.com/questions/63222/getting-p-values-for-multinom-in-r-nnet-package
# ds1_smote2$Sex <- relevel(ds1_smote2$Sex, "M")
# ds1_smote2$Rings <- relevel(ds1_smote2$Rings, "9")

test <- multinom(Rings~., data = ds1_smote2)
summary(test)
