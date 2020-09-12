library(openxlsx)
data<-read.xlsx("C:/Users/Srinidhi Devan/Documents/Sem-3 NMIMS/Predictive Analytics/R files/Data/Online Retail.xlsx")
library(arules)
library(arulesViz)
library(tidyverse)
library(plyr)
library(ggplot2)
library(knitr)
library(lubridate)
dim(data)

#removing the missing values
data<-data[complete.cases(data),]
#all coumns
dim(data)

#transforming to the factors-nominal variables are converted to factors (descriptions and country)
data%>%mutate(Description=as.factor(Description))
data%>%mutate(Country=as.factor(Country))
#%>%:mutate function

data$Date<-as.Date(data$InvoiceDate)
TransTime<-format(data$InvoiceDate,"%H%M%S")

invoiceno<-as.numeric(as.character(data$InvoiceNo))

cbind(data,TransTime)
cbind(data,invoiceno)
glimpse(data)

TransTime<-as.factor(TransTime)
a<-hms(as.character(data$TransTime))
data$TransTime=hour(a)
retail%>%
  ggplot(aes(x=TransTime))+geom_histogram(stat="count",fill="blue",xlim=c(4,22))


