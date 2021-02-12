#############################################################
# R script to supplement Intro to R for Business, Chapter 05#
# Written by Jing Gong                                      #
#############################################################
# "if" conditional statements and "for" loops

#Relational operators to build logical expressions
x<-5
y<-16
x<y
x>y
x<=5
y>=20
y==16
x!=5

#Logical operators: !, &,  |
x
y
x>4
y<10
x>4 & y<10
x>4 | y<10
!x>4
!y<10

#if
x <- 5
if(x > 0){
  print("Positive number")
}

#if...else
x <- -5
if(x > 0){
  print("Positive number")
} else {
  print("Negative number")
}

#if...else if...else
x <- 0
if(x > 0){
  print("Positive number")
} else if (x < 0){
  print("Negative number")
} else {
  print("Zero")
}


#for loop
names <- c("Mike", "Lucy","John")
for (name in names){
  print(name)
}

#for loop - another example
sum <- 0
for (i in 1:100){
  sum <- sum + i*2
}
sum

#for loop - a third example
radius<-c(2.5, 2.1, 3.8, 6, 1.1, 8)
area <- rep(NA,length(radius))
for(i in 1:length(radius)){
  area[i]<-pi*radius[i]^2
}
area