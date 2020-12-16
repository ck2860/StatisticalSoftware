#R Code - Homework 1 - Statistical Software#
#Condy Kan

#1. Please create a new variable, called "Feedback" which will contain the numbers: 3,4,5,3,2,3,2,1,4,5,3,2,3,4,5,2,1,3,4,5,1,2,3,2,3,4,1,4,5,2,3.
#code:
Feedback = c(3,4,5,3,2,3,2,1,4,5,3,2,3,4,5,2,1,3,4,5,1,2,3,2,3,4,1,4,5,2,3)

#2. Please check the mode and class of feedback
#code:
mode(Feedback)
class(Feedback)

#3. Please extract the 10th number
#code:
Feedback[10]

#4.
#1). Create the matrix below
#[,1] [,2] [,3]
#[1,] 7 -7 7
#[2,] 7 -7 7
#[3,] 7 -7 7
#2). Name columns and rows as " row 1", "row 2", "row 3","col 1", "col 2", "col 3"
#code:
matrixA = matrix(c(7,-7,7,7,-7,7,7,-7,7), nr=3, nc=3, byrow=T, dimnames=list(c("row 1", "row 2", "row 3"),
                                                               c("col 1", "col 2", "col 3")))
matrixA

#5. Create a 2*10 matrix with median market capitalizaiton per year (in billions of dollars), between 2005 and 2014, for Google and Apple market cap: (35.5,58.8,107.2,130.8,127.5,234.5,330.1,545.1,428.3,563.9,50.15,86.38,119,112.62,103.35,130.68,145.69,164.6,239.14,163.67)
#code:
matrixB = matrix(c(35.5,58.8,107.2,130.8,127.5,234.5,330.1,545.1,428.3,563.9,50.15,86.38,119,112.62,103.35,130.68,145.69,164.6,239.14,163.67), nr=2, nc=10, byrow=T, dimnames=list(c("Google", "Apple"),
                                                                                                                                                                            c("2005", "2006", "2007","2008", "2009", "2010", "2011", "2012", "2013", "2014")))
matrixB

#6. Please create a employee information dataset contain the following information  (use data frame)
#employe id 1 2 3 4 5
#employee name "Rick","Dan","Michelle","Ryan","Gary"
#salary 623.3,515.2,611.0,729.0,843.25
#code:

employee_ID <- c(1,2,3,4,5)
employee_name <- c("Rick", "Dan", "Michelle", "Ryan", "Gary")
salary <- c(623.3,515.2,611.0,729.0,843.25)
employee_data <-data.frame(employee_ID, employee_name, salary)
employee_data

#7. Please create an array (with 3*3*2 dimension) shown below
#, , Matrix1
#     COL1 COL2 COL3
#ROW1    5   10   13
#ROW2    9   11   14
#ROW3    3   12   15

#, , Matrix2
#     COL1 COL2 COL3
#ROW1    5   10   13
#ROW2    9   11   14
#ROW3    3   12   15
#code:
myarray<-array(c(5,9,3,10,11,12,13,14,15), dim=c(3,3,2),dimnames = list( c( "ROW 1", "ROW 2", "ROW 3" ),
                                                                         c( "COL 1", "COL 2", "COL 3"),
                                                                         c( "Matrix 1", "Matrix 2" )))
myarray 

#8. Create the object "studentID" and assign the values 1:10 in at least 3 different ways
#code:
studentID=1:10
studentID
studentID<-1:10
studentID
assign("studentID", 1:10)
studentID

#9. Create an object and get the sum of the object
#code:
x=1:8
sum(x)

#10. Please download scarementorealesate.csv, and import into R
data1<-read.csv("C:/Users/Condy/Desktop/Fall2020/STAT 611 - Statistical Software/Week3/Sacramentorealestatetransactions.csv",header=T, skip=,nrows=, blank.lines.skip = TRUE)

