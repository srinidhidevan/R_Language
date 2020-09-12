#MONTE-CARLO SIMULATION
name<-c("A","B",NA)
age<-c(12,NA,34)
gender<-c("F","M","F")

#CREATING A DATA FRAME 
data<-data.frame(name,age,gender)
data

#TO FIND OUT IF THERE'S ANY MISSING VALUES IN THE DATA
is.na(data)

#TO FIND OUT THE NO OF MISSING VALUES IN THE DATA
sum_na<-sum(is.na(data))
sum_na

#MEAN OF NO OF MISSING VALUES
mean(is.na(data))

#TO OMIT THE MISSING VALUES (IF ANY) FROM THE DATA
na.omit(data)


