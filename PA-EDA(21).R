#READ THE DATA
churn<-read.csv("C:/Users/Srinidhi Devan/Documents/Sem-3 NMIMS/Predictive Analytics/R files/Data/churn.csv")

#DISPLAYS THE NAMES OF THE COLUMNS(VARIABLES)
names(churn)

#VIEWING THE DATA
View(churn)

#NO. OF ROWS IN THE DATA
nrow(churn)

#NO. OF COLUMNS IN THE DATA
ncol(churn)

#SUMMARY OF THE DATA
sum_churn<-summary(churn)

#SUMMARY OF THE VARIABLE 'CHURN'
Churn_sum<-summary(churn$Churn)

#CONVERTING 'AREA.CODE' TO FACTOR
areacode_factor<-as.factor(churn$Area.Code)
summary(areacode_factor)

#CROSS TABULATION FOR 'CHURN' AND 'VMAIL.PLAN' VARIABLES
cross_tab<-table(churn$Churn,churn$VMail.Plan)
cross_tab

#PROPORTION OF FALSE AND TRUE WRT 'VMAIL.PLAN'
a<-prop.table(cross_tab,2)
#ROUNDING THE ABOVE TABLE TO 2 DECIMAL PLACES
round(a,2)

#CHI-SQUARE VALUE OF THE CROSS TAB
chisq.test(cross_tab)
