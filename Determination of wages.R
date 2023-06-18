rm(list=ls())
library(rio)
library(moments)
setwd=("C:/Users/harsh/OneDrive/Desktop")
Datas=import('CPS2.xlsx')
names(Datas)
set.seed(100)
new_data=Datas[sample(1:nrow(Datas),100),]
new_data



#______________________SIMPLE REGRESSION_________________________
race1.out=lm(wage~education,data=new_data)
summary(race1.out)

race2.out=lm(wage~experience,data=new_data)
summary(race2.out)



race3.out=lm(wage~female,data=new_data)
summary(race3.out)

#_____________MULTIPLE REGRESSION_____________
race_A.out=lm(wage ~ education+experience,data=new_data)
summary(race_A.out)

race_B.out=lm(wage ~ education+female,data=new_data)
summary(race_B.out)

race_C.out=lm(wage ~ experience+female,data=new_data)
summary(race_C.out)


#______________FULL REGRESSION MODEL________________
full.out=lm(wage ~ education+experience+female,data=new_data)
summary(full.out)



#_______________MULTIPLE REGRESSION WITH INTERACTION_____________

employ1_int= lm(wage ~ education+experience+I(education*experience),data=new_data)
summary(employ1_int)

#________________SIMPLE REGRESSION USING SQUARED TERMS_______________
races_reg1.out= lm(wage ~ education+experience+I(education^2),data=new_data)
summary(races_reg1.out)

races_reg2.out= lm(wage ~ education+experience+I(experience^2),data=new_data)
summary(races_reg2.out)
#_______________________-LINE_____________________
##LINEARITY
plot(new_data$wage,
     race_B.out$fitted.values,
     pch=19,main="Wages Actuals v. Fitted")
abline(0,1,lwd=3,col="red")

##Normality
plot(race_B.out$residuals,
     pch=19,main="Normality-WAGES")
abline(0,1,lwd=3,col="red")
qqline(race_B.out$residuals,lwd=3,col="red")
hist(race_B.out$residuals,col="red",probability = TRUE,
     main="Normality -WAGES")
curve(dnorm(x,0,sd(race_A.out$residuals)),
      from=min(race_A.out$residuals),
      to=max(race_A.out$residuals),
      lwd=3,col="blue",add=TRUE)
##EQULAITY OF VARIANCES
plot(race_B.out$fitted.values,rstandard(race_B.out),pch=19,
     main="Standardized Residuals - WAGES")
abline(0,0,col="red",lwd=3)




#_____________________PREDICT___________
updata=data.frame(education=50,female=1)
predict(race_B.out,updata,interval="predict")

updata=data.frame(education=50,female=0)
predict(race_B.out,updata,interval="confidence")

updata=data.frame(education=50,female=0)
predict(race_B.out,updata,interval="predict")

updata=data.frame(education=50,female=1)
predict(race_B.out,updata,interval="confidence")




##################################



