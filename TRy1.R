setwd("C:/Users/board/Desktop/Kaggle/Abalones")

# Establish baseline for using random forest 
library(randomForest)
set.seed(1)

data1 <- read.csv("toy_ds.csv")
summary(data1)
data1$Rings <- as.factor(data1$Rings)

# Create test set and training set 
# In the notes they used the first 3133 for training 
train <- data1[1:3133, ]
test_set <- data1[3134:4177, ]


# Use random forest on training set 
fit <- randomForest(as.factor(Rings)~., data= train, importance = TRUE )

# Evaluate Random Forest 
fit$confusion
r<- diag(fit$confusion)
model_accuracy <- sum(r)
varImpPlot(fit)

# Predictions 

predictions <- predict(fit, test_set)
r <- table(predictions, test_set$Rings)
sum(diag(r))/nrow(test_set)



############
###################
###########################
####################################
######################################################
###########################################################################

# Random sample 
want <- sample(4177, 3133)
train1 <- data1[want, ]
test1 <- data1[-want, ]


# Use random forest on training set 
fit1 <- randomForest(as.factor(Rings)~., data= train1, importance = TRUE )

# Evaluate Random Forest 
fit1$confusion
r1<- diag(fit1$confusion)
model_accuracy1 <- sum(r1)/nrow(train1)
model_accuracy1
varImpPlot(fit1)

# Predictions 

predictions1 <- predict(fit1, test1)
r11 <- table(predictions1, test1$Rings)
pred_accuracy1 <- sum(diag(r11))/nrow(test1)
pred_accuracy1
