library(tidyverse)
library(cluster)
library(factoextra)
library(dendextend)
data<-mtcars
View(data)
dim(data)
carsdata1<-na.omit(data) #removing missing values
dim(carsdata1)
carsdata2<-scale(carsdata1) #standaradizing the variables to make them in same scale (like mpg, weights etc have different scales and hence useful for the analysis)
carsdata2
dim(carsdata2)

d<-dist(carsdata2,method="euclidian")
hca<-hclust(d,method="complete",members=NULL) #hierarchical clustering
plot(hca,cex=0.6,hang=-1) #hang-1:aligned form diagram
#vertical:distance scale; horizontal:models
#cadillac and lincoln have lesser distance b/w them implying they are similar so they will be merged first

groups<-cutree(hca,k=4)
table(groups) #groups and the count in each group

carsdata1%>%mutate(cluster=groups) #to put cluster number for each model in the data file
head(carsdata1)

plot(hca,cex=0.6,hang=-1)
rect.hclust(hca,k=4,border=2.5)
fviz_cluster(list(data=carsdata2,cluster=groups))

fviz_nbclust(carsdata2,FUN=hcut,method="wss") #optimal number of clusters are 4


#k-means- Using in-built dataset 'USArrests'
data1<-USArrests
dim(data1)
head(data1)
data1<-na.omit(data1)
dim(data1)
data1<-scale(data1) #since mean=0, sd=1(i.e., standardizing the data) the values can be negative
head(data1)

distance<-get_dist(data1)
fviz_dist(distance,gradient=list(low="#00AFBB",mid="white",high="#FC4E07"))
#diagonal is dark as distb=ance from itself will be 0
#Euclidian distance b/w objects for 4 variables in the dataset
clus2<-kmeans(data1,centers = 2,nstart=25)
#centers: no. of centroids
#nstart: no of configuration
str(clus2)
#size from the cluster is important
clus2
#cluster 1:high crime (associated with positive values) & cluter 2:v.v.

fviz_cluster(clus2,data=data1)

data1%>%as_tibble()%>%mutate(cluster=clus2$cluster,state=row.names(USArrests))%>%ggplot(aes(UrbanPop,Murder,color=factor(cluster),label=state))+geom_text()

clus3<-kmeans(data1,centers = 3,nstart=25)
clus4<-kmeans(data1,centers = 4,nstart=25)
clus5<-kmeans(data1,centers = 5,nstart=25)

#plots to compare
p1<-fviz_cluster(clus2,geom="point",data=data1)+ggtitle("cluster=2")
p2<-fviz_cluster(clus3,geom="point",data=data1)+ggtitle("cluster=3")
p3<-fviz_cluster(clus4,geom="point",data=data1)+ggtitle("cluster=4")
p4<-fviz_cluster(clus5,geom="point",data=data1)+ggtitle("cluster=5")

library(gridExtra)
grid.arrange(p1,p2,p3,p4,nrow=2)
