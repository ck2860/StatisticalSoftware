#R Code - Homework 4 (Week6)- Statistical Software#
#Condy Kan

#1. Please use the for loops with next to print integers: 1, 2, 3, 5, 6, 7, 8, 9, 10.

for(i in 1:10){
  if(i==4)
    next
  print (i)}

#2. What should be the output if I run these statements in R:
#i = -1
#  while (i<6) {
#  print(i)
#  i= i + 1
#}
The output should be: -1,0,1,2,3,4,5

#3. Create the following vectors,
#x = 1:5
#y = rep(4,5)
#x1 = 1.1:5.1
#y1 = 5:1
# 1. now plot those 3 levels in your scatterplot (x-y, x1-y1, x1-x)
# 2. pick a suitable format for your plot
# 3. add a legend without box to your plot

x = 1:5
y = rep(4,5)
x1 = 1.1:5.1
y1 = 5:1

plot(x,y, col="red", pch=3, main="Multi Scatterplot",
     col.main="black", cex.main=1, xlab="x", ylab="y")
points(x1,y1, col="blue", pch=5)
points (x1,x, col="green", pch = 9)

legend(2,3, legend=c("x-y", "x1-y1", "x1-1"),
       col =c(r="red", "blue", "green"), pch=c(3,5,9),cex=0.65, bty="n")


#4. Use the lynx dataset, plot a simple histogram.
hist(lynx)
# 1. Adjust heading and labs according to graph below
hist(lynx, main = "Histogram of Lynx",
     col.main = "black", ylab="Frequency", xlab="Lnyx")
# 2. Adjust the y axis scale horizontally
hist(lynx, ylim = c(0,70),main = "Histogram of Lynx",
     col.main = "black", ylab="Lynx", xlab="Time")
# 3. Insert the count number in the graph
hist(lynx, ylim = c(0,70),main = "Histogram of Lynx",
     col.main = "black", ylab="Lynx", xlab="Time", labels=T)
# 4. Adjust the graph area that every count number is visible
hist(lynx, ylim = c(0,70),main = "Histogram of Lynx",
     col.main = "black", ylab="Lynx", xlab="Time", labels=T,breaks = 20)
# 5. Add coloration to the graph: hint - color vector
hist(lynx, ylim = c(0,70), col="#996633", main = "Histogram of Lynx",
     col.main = "black", ylab="Lynx", xlab="Time", labels=T,breaks = 20)
#5. If you take a look at the 4 functions: rowSums, rowMeans, colSums, colMeans, could you use the apply function to get the same results?
mymatrix <- matrix((1:30),ncol=2,byrow=F)
mymatrix

apply(mymatrix, 1, sum) #rowSums
apply(mymatrix, 1, mean) #rowMeans
apply(mymatrix, 2, sum) #colSums
apply(mymatrix, 2, mean) #colMeans


#6. mapply: Create 2 lists consisting of 3 elements each. All elements have the same length.
a=mapply(rep, 1:2, 3:3)
# 1. get the sum and the mean of all elements of list 1 and elements 2 and 3 from list 2
sum1 = sum(a[1,1],a[2,1],a[3,1],a[2,2],a[3,2])
mean1 = mean(a[1,1],a[2,1],a[3,1],a[2,2],a[3,2])
# 2. the result should be 2 vectors (sum, mean) of the same length as the elements
mapply(rep,c(sum1,mean1),3:3)
#7. Create a matrix of 4 rows and 5 columns with random normal distributed numbers with mean 8.
matrix((rnorm(20, mean=8)),nrow=4, ncol=5,byrow=F)
# 1. make the result reproducible
a1=rnorm(20, mean=8)
mymatrix2 <- matrix(a1,nrow=4, ncol=5,byrow=F)
mymatrix2
# 2. calculate the mean for every row
apply(mymatrix2,1,mean)
