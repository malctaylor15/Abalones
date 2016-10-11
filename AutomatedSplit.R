# Split Attempt part two 
# Split by algorithm 

setwd("C:/Users/board/Desktop/Kaggle/Abalones")
data1 <- read.csv("toy_ds.csv")

sorted_freq <- sort(table(data1$Rings), decreasing = TRUE)
numb_classes <- length(sorted_freq)

# Pre allocate space for class observations 
classes_df <- data.frame(matrix(0,nrow = numb_classes, ncol = 2))
classes_df[,1] <- sorted_freq
names(classes_df)[1:2] <- c("# of observations", "Class #")

# Parameters for partitions 
min_precentage <- 0.10
partition <- 1

for(ring_class in 1:numb_classes){
  
  # Current class total 
  class_total <- sum(classes_df[(which(classes_df[[2]] == partition)),1])
  
  percentageIfAdded <- sorted_freq[ring_class]/ (sorted_freq[ring_class]+ class_total)
  

  #If above the min threshold add to class
  if(percentageIfAdded > min_precentage ){
    classes_df[ring_class,2] <- partition
  }
  else {
    # New partition Will be small part of new data set, switch to next partition
    partition <- partition +1  
    classes_df[ring_class,2] <- partition
  }
}

# Next make and name the data sets 

