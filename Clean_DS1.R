setwd("C:/Users/board/Desktop/Kaggle/Abalones")

library(randomForest)
set.seed(1)
data1 <- read.csv("toy_ds.csv")

hist(data1$Rings)
summary(data1$Rings)

# Drop rows with low observations 
counts <- data.frame(table(data1$Rings))
counts
prop.table(table(data1$Rings))
low_samp_ring_rows <- which(counts$Freq<150) # remove when less tha 150 observations
ds <- data1[!data1$Rings %in% low_samp_ring_rows,]
(unique(ds$Rings))
prop.table(table(ds$Rings))
# Not great but slightly better - 20% max, 7.4% min 

ds2 <- data1[data1$Rings %in% low_samp_ring_rows,]

prop.table(table(ds2$Rings))
# Split data set 
train <- data1[1:2882, ]
test_set <- data1[2883:3843, ]


# Random Forest 

fit1 <- randomForest(as.factor(Rings)~., data= ds, importance = TRUE )
names(fit1)
fit1$confusion
