install.packages("psych")
library(psych)
data<-bfi
#bfi- big five items

data<-na.omit(data)
#removing the missing values
dim(data)

data_1<-data[c(-26,-27,-28)]
#removing the last 3 variables (unnecessary)
dim(data_1)

ev<-eigen(cor(data_1))
ev
print(ev$values)
#if eigen val is 5 (say), it explains the variablility of that of 5 variables
#if the variables have eigenval>1, we consider them. In this case, it is the first 6 variables

fit<-princomp(data_1,cor=TRUE)
#principle component analysis
summary(fit)
#total variance explained by 6 factors is 58%
#and we are losing 40% of the info
#considering the complexities, it is a fine factor analysis
#however 70% is considered a good factpr analysis

fit_1<-principal(data_1,nfactors=6,rotate="varimax")
fit_1
#nfactor=6: the chosen 6 variables
#3 options: varimax-variance maximiser; equimax-make variance equitable
#key output of the factor analysis-result of rotation and the proportion variance explained also changes but the total variance explained remains the same
#mean item complexity=1.7-->higher the complexity, bad it is
#upto RC4 it is FACTOR LOADINGS
