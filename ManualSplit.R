setwd("C:/Users/board/Desktop/Kaggle/Abalones")

# This file splits the data into the appropriate seperate datasets

data1 <- read.csv("toy_ds.csv")
summary(data1)

# Split into 4 datasets so each one will have a similar number of observations 

# Create table to observe frequencies 
counts <- data.frame(table(data1$Rings))
counts

# ds1 will have the ring classes with most number of observations 
low_samp_ring_rows1 <- which(counts$Freq>266) # select classes with more than 266 observations 
ds1 <- data1[data1$Rings %in% low_samp_ring_rows1,]
# Check percentages
prop.table(table(ds1$Rings))


# ds2 will have the ring classes with second most number of observations 
low_samp_ring_rows2 <- which(counts$Freq<266 & counts$Freq> 100) # select classes with observations between 266 and 100
ds2 <- data1[data1$Rings %in% low_samp_ring_rows2,]
# Check percentages
prop.table(table(ds2$Rings))


# ds3 will 
# ds3 will have the ring classes with second smallest number of observations 
low_samp_ring_rows3 <- which(counts$Freq<70 & counts$Freq>20 ) # select classes with observations between 266 and 100
ds3 <- data1[data1$Rings %in% low_samp_ring_rows3,]
# Check percentages
prop.table(table(ds3$Rings))


# ds4 will 
# ds4 will have the ring classes with smallest number of observations 
low_samp_ring_rows4 <- which(counts$Freq<20 ) # select classes with observations between 266 and 100
ds4 <- data1[data1$Rings %in% low_samp_ring_rows4,]
# Check percentages
prop.table(table(ds4$Rings))


