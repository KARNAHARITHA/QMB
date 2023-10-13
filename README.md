# QMB
Determination of wages

## **SOURCE OF DATA**

This dataset pertains to the difference in wages paid for individuals considering the factors like education, experience, female or not, race and ethnicity . 
The data is sourced from GitHub from the mentioned link: https://github.com/bharathirajatut/sample-excel-dataset/blob/master/cps2.xls


This dataset consists of following columns: wage, education, experience, female, race, white, black, Hispanic, Asian, others.  
•	Wage:  A numeric vector in which the wages of the employees are conveyed.
The variable wage is going to be our dependent variable(Y)
•	Education: Years of education. This is a continuous variable; education is going to be our first independent variable (X1).
•	Experience: Number of years of work experience. This is a continuous variable; experience is going to be our second independent variable (X2).
•	Female: If the employee is female or not (Female=1, if not=0).This variable is a binary variable and will be third independent variable(X3). There are 2 levels which are 0 and 1.
•	Race : Hispanic/ white/ black/ Asian/ others


**Interpretation for the best fit model:**
For our dataset of wages, the best fit model is the multiple regression model with Wage as independent variable, education, and female as independent variables. As we know that higher the adjusted R squared value, better the model is and hence we came to this conclusion based on adjusted R squared value which is 0.08202 for the multiple regression model. In all the models we tested, most of the models has “education” as significant term.The following is the summary of that multiple regression model race_B.out:

Call:
lm(formula = wage ~ education + female, data = new_data)
Residuals:
    Min      1Q  Median      3Q     Max 
-16.719  -6.762  -2.063   4.244  33.570 
Coefficients:
            Estimate Std. Error t value Pr(>|t|)   
(Intercept)   5.4905     5.6175   0.977  0.33080   
education     1.1743     0.4019   2.922  0.00433 **
female       -3.7590     2.0842  -1.804  0.07440 . 

Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
Residual standard error: 10.32 on 97 degrees of freedom
Multiple R-squared:  0.1006,	Adjusted R-squared:  0.08202 
F-statistic: 5.423 on 2 and 97 DF,  p-value: 0.005856

## Equation for the model: 
Y= 20.98202 + 0.01295 *X2 – 3.12584
where  β0(intercept)= 20.98202 and β1(slope)= 0.01295, β2(slope)= – 3.12584

IV’s and DV’s
Here, the independent variables are Education, and Female whereas dependent variable is wage.

## **RESULT:**
 
The data points are not ideally normally distributed from the ggplot, but from the above histogram we can say that the data points are partially in conformity with normality.


Two types of prediction confidence intervals resulting from independent variable values
A prediction interval captures the uncertainty around a single value whereas confidence interval captures uncertainty around the mean predicted values.

updata=data.frame(education=50,female=1)
predict(race_B.out,updata,interval="predict")
   fit                 lwr             upr
1 60.44612          25.0484           95.84383

Interpretation :From the above predicted values in the interval=”predict”, we can say that if an employee has an education of 50 years and is “female” ,then she can earn upto $60.44612 per hour and least and highest pay in present being $25.0484 and $95.84383 respectively.

updata=data.frame(education=50,female=0)
predict(race_B.out,updata,interval="confidence")

         fit                lwr            upr
      64.20511             34.8893      93.52093

Interpretation :From the above predicted values in the interval=”confidence”, we can say that if an employee has an education of 50 years and is “male” ,then he can earn up to  $64.20511    per hour and least and highest pay being $34.8893 and $93.52093 respectively during some time in the future.





