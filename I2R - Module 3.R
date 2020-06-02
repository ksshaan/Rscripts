###===================================================================================================###
###                                    INTRODUCTION TO R                                          ###
###                                        MODULE 3                                                  ###
###                                 [DESCRIPTIVE ANALYTICS]                                           ###                
###===================================================================================================###
#1. SUMMARIES AND STATISTICS
#=======================================================================================================

setwd("C:\\Users\\hp\\Documents\\R\\Rscripts")  #set the working directory
cars = read.csv("cars.csv") 

#A. The summary() function
summary(cars$MPG)
summary(cars$Origin)
summary(cars)


#B. The by() / tapply() function
?by
by(cars$Weight, cars$Origin, FUN=mean)
by(cars$Weight, cars$Origin, FUN=median)
by(cars$Weight, cars$Origin, FUN=sd)
by(cars$Weight, cars$Origin, FUN=summary)
summ1 =by(cars$Weight, cars$Origin, FUN=summary)
summ1
summ1['Europe']
summ1$Japan

summ0=by(cars$Cylinders, cars$Origin, FUN=mean)
summ0

sum=by(cars$Weight, cars$Cylinders, FUN=summary)
sum
sum$`3`


tsum = tapply(cars$Weight, cars$Cylinders, FUN=summary)
tsum
tsum$`3`
tapply(cars$Weight, cars$Origin, FUN=mean)
summ00=tapply(cars$Cylinders, cars$Origin, FUN=mean)
summ00
tapply(cars$Weight,cars$Origin,FUN=mean) 
#o/p is a vector with tapply vs by 
summ2 = tapply(cars$Weight,cars$Origin,FUN=mean) 
summ2['Europe'] 
summ3=tapply(cars$Weight,cars$Origin,FUN=summary) 

summ3$Europe

require(mat.1K)
hold.df = mat.1K
head(hold.df)

head(mtcars)
by(mtcars$mpg,list(am=mtcars$am,cyl=mtcars$cyl),mean)
tapply(mtcars$mpg,list(am=mtcars$am,cyl=mtcars$cyl),mean)

by(mtcars[,c('hp','wt')],list(am=mtcars$am),mean)
tapply(mtcars[,c('hp','wt')],list(am=mtcars$am),mean)#arguments must have same length


help(by)
s1=by(mtcars$mpg,mtcars$am,mean)
t1=tapply(mtcars$mpg,mtcars$am,mean)
class(s1)
class(t1)

tapply(mtcars$mpg,list(mtcars$am,mtcars$cyl),mean) 
by(mtcars$mpg,list(mtcars$am,mtcars$cyl),mean) 

tummy=tapply(cars$Acceleration,cars$Weight,FUN=mean)
plot(tummy)
accavg <- data.frame(tapply(cars$Acceleration,cars$Weight,FUN=mean) )
accavg
plot(accavg)

summy=by(cars$Acceleration,cars$Weight,FUN=mean)
plot(summy)

accavgby <- data.frame(by(cars$Acceleration,cars$Weight,FUN=mean) )
accavgby

acccyl <- data.frame(tapply(cars$Acceleration,cars$Cylinder,FUN=mean) )
colnames(acccyl) = "Mean_Acceleration_bycyl"
acccyl

s = data.frame(by(cars$Acceleration,cars$Cylinder,FUN=mean) )
#Error observed :: cannot coerce class ‘"by"’ to a data.frame 

acccyl <- data.frame(tapply(cars$Acceleration,cars$Cylinder,FUN=mean) )
colnames(acccyl) = "Mean_Acceleration_bycyl"
acccyl


#=======================================================================================================
#2. TABLES
#=======================================================================================================





#=======================================================================================================
#3. HISTOGRAMS
#=======================================================================================================





#=======================================================================================================
#4. BOXPLOTS
#=======================================================================================================





#=======================================================================================================
#5. BAR CHARTS
#=======================================================================================================




#=======================================================================================================
#6. SCATTERPLOTS AND PAIRWISE SCATTERPLOTS
#=======================================================================================================





