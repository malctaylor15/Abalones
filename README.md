# Abalones

## Document and Strategy Guide 


***abalone.data*** is the raw data about the marine creatures 

***abalone.names*** describes the data and gives more context to the machine learning problem and history. 

Both files were downloaded from https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/

***toy_ds.csv*** is abalone.data file in CSV format, which is useful for working in R. 

***Abalones Journal*** has my progress as I tracked several of my major steps in looking through the dataset. 

***Baseline.R*** has my initial attempt without doing any special data cleaning. 
I used a random forest algorithm to get a baseline accuracy.  

***Abalone Strategy*** has the overall strategy for tackling the problem. 
The main problem are the 28 classes which range in number of observations from 1 to over 600. 
The strategy contains four parts- split the data set, run algoirthms on each split, 
then combine the results and find appropriate weights for the results of each outcome. 

There are two ways of splitting so far in the files 
***AutomatedSplit.R*** and ***ManualSplit.R*** 

Automated Split uses a top down criteria where the smallest class must be >10% of the total. 
Manual Split uses rough judgements I made when looking at the sizes of the classes. 

Please note that these files depend on the previous files being run 
and having the data stored in the memory. A future improvement could be reading and writing from and to CSVs. 

Next I began running algorithms on the partitions. ***DS1_V1.R*** and ***DS2_V1.R*** are the first attempts at running algorithms on the partitions. 
I began by using SMOTE to balance the datasets slightly more then ran a random forest algorithm. I was beginning to try a multinomial logisitic regression. 


I have stopped working on this project to focus on a python implementation that only involves using 3 larger class sizes. This will introduce other problems that I am excited to face. 


