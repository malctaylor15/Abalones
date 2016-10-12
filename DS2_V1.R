# Run Split attempt.R before running this code 
# This code assumes the data has already been split 

# Begin working on first dataset 
library(DMwR)
library(unbalanced)
ds2$Rings <- as.factor(ds2$Rings)

# Balance dataset 
ds2_ed <- ds2[,-ncol(ds2)]
Rings <- ds2$Rings

ds2_under <- ubUnder(X = ds2_ed, Y = Rings)
ds2_smote1 <- SMOTE(Rings ~. , data = ds2, perc.over = 100, perc.under = 1000)
# ds2_smote2 <- SMOTE(Rings~., data = ds2_smote1, perc.over = 100, perc.under = 1000)

# Properties of new smote'd dataset 

sort(prop.table(table(ds2_smote1$Rings)))
sort(prop.table(table(ds2$Rings)))

# table(ds2_smote1$Rings)


# Original number of observations 
# table(ds2$Rings)

#########

# Start using algorithms on newly balanced dataset 
library(randomForest)

ds2_fit1 <- randomForest(Rings ~ ., data = ds2_smote2)
ds2_fit1$confusion
accuracy_ds2 <- sum(diag(ds2_fit1$confusion))/nrow(ds2_smote2)
accuracy_ds2

######

# Test and training Set 
numb_obs_ds2_2 <- nrow(ds2_smote2)
want1 <- sample(numb_obs_ds2_2, 0.75*numb_obs_ds2_2)
train1 <- ds2_smote2[want1, ]
test1 <- ds2_smote2[-want1, ]

# Train and predict on samples 
ds2_fit2 <-randomForest(Rings~., data = train1, importance = T)
ds2_fit2$confusion
accuracy_ds2_2 <- sum(diag(ds2_fit2$confusion))/nrow(train1)
accuracy_ds2_2

predictions_ds2_2 <- predict(ds2_fit2, test1)
r_ds2_2 <- table(predictions_ds2_2, test1$Rings)
pred_accuracy <- sum(diag(r_ds2_2))/nrow(test1)
pred_accuracy
