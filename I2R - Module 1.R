###===================================================================================================###
###                                     Introduction to R                                          ###
###                                         MODULE 1                                          ###
###                                    [DATA AND VECTORS]                                             ###                
###===================================================================================================###
#1. READING THE CARS.CSV DATA IN R
#=======================================================================================================

getwd()                                 #get the working directory
setwd("C:\\Users\\hp\\Documents\\R\\Rscripts")  #set the working directory
cars = read.csv("cars.csv")             #read the data


#========================================================================================================
#2. SOME INITIAL STEPS WITH DATA
#========================================================================================================
#A. Checking the dimension of the data
summary(cars)

head(cars)
#B. Number of rows of the data

#C. Number of columns of the data


#D. Studying the Structure of the data


#E. Printing first and last few lines of a data


#F. Viewing the entire data

getwd()
setwd("C:\\Users\\hp\\Documents\\Praxis_Docs\\GOURAB_SIR_PYTHON_ML\\R")
getwd()
cars=read.csv("cars.csv")

dim(cars)
nrow(cars)
ncol(cars)
str(cars)

head(cars)
tail(cars)
tail(cars,10)
view(cars)
x=c(1,2,3,4,5,6,7,8,9)
x
1:20  #1 to 20
20:1  # 20 to 1
#genrating regular sequences..
#to create a sequence that starts for 50 goes 100 at an interval of 5
seq(50,100,5)
?seq # help for seq function 
seq(50,100,length.out =100)
#length of 100 b/n 50 and 100
seq(10,20,length.out = 4)
10 :20
rep(10,4)
#to repat nos
rep(c(1,2,3),4)
rep(c(1,2,3),each=5)

#get random numbers b/n 1 and 100
sample(1:100,10)
sample(c(0,1),size=10,replace=TRUE)
#random samples with replacement

sample(c(0,1,2,3,4,5),size=10,replace=TRUE)


sample(c(0,1),size=10,replace=TRUE,prob=c(0.8,0.2))


sample(c(0,1),size=10,replace=TRUE,prob=c(0.8,0.2))


set.seed(123)



sum(x)
length(x)
quantile(x,.25)
quantile(x,c(.25,0.90))
summary(x)

#========================================================================================================
#3. INTRODUCTION TO VECTORS
#========================================================================================================

v <- 5 #assignment symbol
v+1


#A. Defining a vector

x <- c(12,34,24,45,7,18) # c stands for combine
x

#B. Generating regular sequences - The colon [:] operator
x[1:5]

#C. Generating regular sequences - The seq() function


#D. Renerating simple random sample


#========================================================================================================
#4. SOME USEFUL FUNCTIONS
#========================================================================================================

#A. sum()


#B. mean(), median(), sd(), var()


#C. max(), min()


#D. quantile()


#E. length()


#F. summary




#========================================================================================================
#5. VECTOR SUBSETTING
#========================================================================================================

v=10 
v > 10 # its going to return False..
my_vec = c(10,15,23,36)
my_vec[1] # gives first element .. starts indexing at 1 
my_vec[1:3] # this vector 1,2 ,3 first 3 elements..
my_vec[c(1,4)] # gives first and fourth element
x=c(10,20,3,30,40,50,22,60,70)
(x>30 | x<10 )# or expression
(x<30 & x>10 )











#The conditional operators

# > is greater than
# < is less than
# == is equal to
# <= is less than or equal to
# >= is greater than or equal to

x
x > 20
x == 24


#and - &
#or - |

(x>30 | x<10)
(x<30 & x >10)


#PROBLEM:
#Consider the following two vectors

x <- c(33,45,23,67,54,48)
y <- c(108,151,164,119,135,122)

x
y
x[x<35] #values of x which are <35 
y[y>150]
length(y[y>150])
sum(y>150)


#Write a R code to find the folowing solutions
# a. Vaues of x that are less than 35




# b. The number of observations in y that are more than 150

sum(y>150)


# c. The number of observations in y that are between 120 and 165
sum(y>120 & y<165)



# d. The vaues in x that are less than 30 or greater than 50
x[x<30 & x>50]


# e. The values in x for which the values in y is less than or equal to 120

y[y<=120]


# f. The values in y for which the values in x is equal to 45

y[x == 45]


#========================================================================================================
#6. VECTORS IN DATA
#========================================================================================================

#Note that in a data set each rows or columns is nothing but a vector
#A variable in data can be extracted as follows:

cars$Horsepower
sum(cars$Horsepower)
mean(cars$Horsepower)












#PROBLEM (Reference: cars.csv)

# a. Which car has the highest mpg?
max(cars$MPG)
cars$Car[46.6]# 46 row car
cars$Car[cars$MPG == 46.6]# max mpg=46.6
cars$Car[cars$MPG == max(cars$MPG)]
max(cars$MPG)#max of mpg

#below both work..
cars$Car[cars$MPG ==max(cars$MPG)]
cars$Car[cars$MPG == 46.6] # this works 
# b. Which car is the heaviest?
max(cars$Weight )
cars$Car[cars$Weight ==max(cars$Weight)]


# c. Which car is the lightest?
min(cars$Weight )
cars$Car[cars$Weight ==max(cars$Weight )]
cars$Car[cars$Weight ==min(cars$Weight )]

# d. Which car has the highest value of the horsepower?
max(cars$Horsepower)
cars$Car[cars$Horsepower ==max(cars$Horsepower)]



# e. What is the lowest value of the horsepower?

min(cars$Horsepower)
cars$Car[cars$Horsepower ==min(cars$Horsepower)]


# f. What is the highest values of the mpg?
max(cars$MPG)


# g. List the top 10 percentile values of mpg.

cars$Car[cars$MPG]
cars$MPG[]
quantile(cars$MPG,c(.9,.91,.92,.93,.94,.95,.96,.97,.98,.99))

# h. List the name of cars which has mileage between 25 and 35 mpg.

cars$Car[cars$MPG>25 & cars$MPG <35 ]


# i. What is the average weight of the cars which has 8 cylinders?

mean(cars$Weight[cars$Cylinders == 8])

# j. What is the average weight of the cars that are originated in Japan?

mean(cars$Weight[cars$Origin == "Japan" ])

#Extract all the information of the cars which has MPG more than 40
cars[(cars$MPG > 40),]

# k. Randomly select 20 cars from the given list of cars.
sample(cars$Car,20,replace = TRUE)

mean(mtcars$mpg)
#Name the cars which has MPG more than 40 and Acceleration less than 20 or
# the car has three cylinders
cars$Car[(cars$MPG > 40 & (cars$Acceleration < 20 | cars$Cylinders == 3))]











