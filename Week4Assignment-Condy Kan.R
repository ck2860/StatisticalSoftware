#R Code - Homework 2 - Statistical Software#
#Condy Kan

#Question 1: we have a sample of 30 tax accountants from all the states and territories
#of Australia1 and their individual state of origin is specified by a character vector of state
#mnemonics as

state <- c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa",
           "qld", "vic", "nsw", "vic", "qld", "qld", "sa", "tas",
           "sa", "nt", "wa", "vic", "qld", "nsw", "nsw", "wa",
           "sa", "act", "nsw", "vic", "vic", "act")

#a. Please use factor function to create a new object name statef
statef <- factor(state)
statef
#b. please use the level() function to show how many levels or factors in this data set
levels(statef)
length(levels(statef))

#Question 2: 
#a. Based on the table below, please create a data frame and use str() function to look at the structure of the data frame 
#b. use print() function to show your data frame

#employee Johne Doe Peter Gynn Jolie Hope
#Salary: 21000, 234000, 268000
#Age: 34 43 37
#StartDate: 2010-11-1 2008-3-25 2007-3-14


Employee <-c("Johne Doe", "Peter Gynn", "Jolie Hope")
Salary <-c("21000", "234000", "268000")
Age <- c(34, 43,37)
StartDate <- as.Date(c('2010-11-1', "2008-3-25","2007-3-14"))

employeeData <-data.frame(Employee,Salary,Age,StartDate)
str(employeeData)

#Question 3 
#Please create the following data frame and merge the two data frame based on the requirements below

#Table 1

#employee id: 1 2 3 4 5 
#employee name: Rick Dan Michelle Ryan Gary 
#salary: 623 515 611 729 843
#startdate: 2012-01-01 2013-09-23 2014-11-15 2014-05-11 2015-03-27
#dept: IT Operations IT HR Finance 

#Table 2

#employee id: 6 7 8 
#employee name: Rasmi Pranab Tusar 
#salary: 578 72 632 
#start date: 2013-05-21 2013-07-30 2014-06-17
#dept: IT Operatiosn Fianance 

Table1 <-data.frame(EmployeeID=I(c(1,2,3,4,5)),
                    EmployeeName=c("Rick", "Dan", "Michelle", "Ryan", "Gary"),
                    Salary=c(623,515,611,729,843),
                    StartDate =as.Date(c('2010-01-01', "2013-09-23", "2014-11-15", "2014-05-11", "2015-03-27")),
                    Dept=c("IT", "Operations", "IT", "HR", "Finance"))

Table2 <-data.frame(EmployeeID=I(c(6,7,8)),
                    EmployeeName=c("Rasmi" , "Pranab", "Tusar"),
                    Salary=c(578,72,632),
                    StartDate =as.Date(c("2013-05-21", "2013-07-30", "2014-06-17")),
                    Dept=c("IT", "Operations", "Finance"))

#a. Please merge table 1 and table 2 by employee name use full outer join 

merge1 <- merge(Table1, Table2, by.x="EmployeeName", by.y="EmployeeName", all=TRUE)
merge1
#b. Please merge table 1 and table 2 by employee name use natural join 

merge2 <- merge(Table1, Table2, by.x="EmployeeName", by.y="EmployeeName", all=FALSE)
merge2

#c. Based on the merged table from question b, please select employee from IT department 
which(Table1$Dept=="IT")
which(Table2$Dept=="IT")
which(merge2$Dept=="IT")




