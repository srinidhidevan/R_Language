library(FactoMineR)
library(factoextra)
library(gplots)

data<-housetasks
x<-as.table(as.matrix(housetasks))
balloonplot(t(x),main="housetasks",xlab="done by",ylab="work",label=FALSE,show.margins=FALSE)
#if the balloon size is small, then that work is done less frequently and v.v
chisq<-chisq.test(housetasks)
chisq
#p-val<0.05, hence row and col variables are associated
CA(data,ncp=7,graph=TRUE)
#ncp:character size
#CA:correspondence analysis
#husband-drving &repairs; wife-laundry,main,dinner,breakfast and so on
#col-red; rows-blue
#dim 1 explains 48.69% of the variation and dim 2 explains 39.9%, almost 90% is explained by both dimensions
#so only 10% info is lost, so it is a good model
res.ca<-CA(housetasks,graph=FALSE)
eigenval<-get_eigenvalue(res.ca)
eigenval
#keep performing the above step until we get: dim 1+dim 2=100
#dim 3 can be ignored as most of the variations are explaining most of the variations in the data
#Hence reducing 4-dimension to 2-dimension, therefore known as "data reduction method"

#CA-exercise 2
smoke<-matrix(c(4,2,3,2,4,3,7,4,25,10,12,4,18,24,33,13,10,6,7,2),ncol=4,byrow=TRUE)
colnames(smoke)<-c("None","light","medium","high")
rownames(smoke)<-c("sr.managers","jr.managers","sr.employees","jr.employees","secretaries")
smoke_1<-as.matrix(smoke)
smoke
CA(smoke_1,ncp=5,graph=TRUE)





