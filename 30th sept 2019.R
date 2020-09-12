library(class)
#BREAST CANCER DATASET- WDBC
wdbc<-read.table(file.choose(),sep=',')
wdbc<-wdbc[,-1]
data_norm<-function(x){((x-min(x))/(max(x)-min(x)))}
wdbc_norm<-as.data.frame(lapply(wdbc[,-1],data_norm))
head(wdbc_norm)
summary(wdbc[,2:5])
summary(wdbc_norm[,1:4])
wdbc_train<-wdbc_norm[1:450,]
wdbc_test<-wdbc_norm[451:569,]
wdbc_pred<-knn(wdbc_train,wdbc_test,wdbc[1:450,1],k=21) #prediction for test based on the training dataset
#sqrt(450)=21.21 so approx k=21
table(wdbc_pred,wdbc[451:569,1])
#2 of them are wrongly predicted as cancer positive when they actually don't have it
#accuracy is 98.3%
