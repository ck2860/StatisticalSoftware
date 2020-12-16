#R Code - Homework 3 (Week5)- Statistical Software#
#Condy Kan

#1. Given that x=c(-7.9, -5.6, 0.8, 1.2, 3, 8, 10.9, 12.3), please calculate ceiling, floor, trunc, and round value for vector x.
x=c(-7.9, -5.6, 0.8, 1.2, 3, 8, 10.9, 12.3)
ceiling(x)
floor(x)
trunc(x)
round(x,digits=0)

#2. Please write a simple program to get the abs of x=-0.3.
x=-0.3
abs(x)

#3. Given that y= c(10, 12, 15, 16, 3, 9, 6, 4, 10, 18, 21, 12, 7, 5), find the sd, var, sun, min, max, and range for vector y.
y= c(10, 12, 15, 16, 3, 9, 6, 4, 10, 18, 21, 12, 7, 5)
sd(y)
var(y)
sum(y)
min(y)
max(y)
range(y)

#4. Using the mtcars dataset from package Hmisc, create a vector including variables: mpg, hp, wt, and cyl, then aggregate the data first by mpg (mean), then by cyl (mean).
#install.packages("Hmisc")
library(Hmisc)
head(mtcars)
myvars <- c("mpg", "hp", "wt", "cyl") 
aggregate(mtcars[myvars], by=list(mpg=mtcars$am,cyl=mtcars$cyl), mean)

#5. Using the mtcars dataset from package Hmisc, create a one-way table shown below:
#carb
#1 2 3 4 6 8
#7 10 3 10 1 1
mytable5 <- with(mtcars, table(carb))
mytable5

#6. Using the Arthritis dataset from package vcd, create a two-way table as shown below:
#Treatment
#Sex Placebo Treated
#Female 32 27
#Male 11 14
#install.packages("vcd")
library(vcd)
mytable6 <- xtabs( ~ Sex  + Treatment, data=Arthritis)
mytable6

#7. Please use addmargins() to add row and column sums to the table you created in question 6.
addmargins(mytable6)

#8. Please create a 2+(6*x) function using R.
function8<-function(x){
  value=2+(6*x)
  print(value)
}


