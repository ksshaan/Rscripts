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
View(cars)

#descriptive stats...
#creating tables in R 
table(cars$Origin) #frequency distribution table
table(cars$Cylinders) #frequency distribution table
table(cars$Origin,cars$Cylinders) # there are no cars under our analysis which was manufactured in Japan and has 5 cylinders
#take proportions
round(prop.table(table(cars$Origin))*100,2)#from our analysys of the sample , from the sample we have observed 19.46 cars come from Japan..
#19.46% of all the  cars under our analysys originates in Japan 
#from our sample we have observed that 19.46% of cars originates in Japan 
#creating a bivariate proportion table 
round(prop.table((table(cars$Origin,cars$Cylinders))),2)
#from our sample of analysis it is observed that 0% of total number of cars with 8 CYlinders are manufactured in Japan 
#P(cars has 4 cylinders|Cars are originated in Eu) =16 % not correct
#P(cars having 4 cylinders & cars originated in Eu) = 0.16 [correct]

#conditioning by rows for row 1 column 2 .. joint probability we give nothing..
round(prop.table((table(cars$Origin,cars$Cylinders)),1),2)
#by column  conditioning
round(prop.table((table(cars$Origin,cars$Cylinders)),2),2)
#out of all the cars having 8 cylinders 100% of them are originated from US.. or 100% of all the cars with 8 cylinders are from US origin 

round(prop.table(table(cars$Horsepower,cars$Origin),2),2)


#from our sample , we have observed that 90% of the total numbe rof cars in Europe has got 4 cylinders 
#P(Cars has 4 cylinders|cars are originated in Eu) =0.9

#conditioning by column :
round(prop.table(table(cars$Origin,cars$Cylinders),2),2)



#=======================================================================================================
#3. HISTOGRAMS


hist(cars$MPG)
hist(cars$MPG,xlab='Miles per Gallon',ylab='no of cars', main='Histogram of MPG',breaks=10)
hist(cars$MPG,xlab='Miles per Gallon',ylab='no of cars', main='Histogram of MPG',col='gold',border=FALSE)

hist(cars$MPG,xlab='Miles per Gallon',ylab='no of cars', main='Histogram of MPG',col='gold',border=FALSE,breaks(seq(min(cars$MPG),round(max(cars$MPG),0)+1,2))

#=======================================================================================================





#=======================================================================================================
#4. BOXPLOTS


boxplot(cars$MPG)

boxplot(cars$MPG,horizontal=T,notch =T,col='lightgreen',xlab ='miles per gallon',main='boxplot of MPG')

boxplot(cars$MPG,horizontal=T,notch =T,col='lightgreen',xlab ='miles per gallon',main='boxplot of MPG')

boxplot(cars$MPG,horizontal=T,notch =T,breaks=15,col='lightgreen',xlab ='miles per gallon',main='boxplot of MPG')

#=======================================================================================================

#side by side box plot
boxplot(cars$MPG ~cars$Origin)



#=======================================================================================================
#5. BAR CHARTS
#=======================================================================================================

#bar charts.. plotting the freqs ...
barplot(table(cars$Origin))
barplot(prop.table(table(cars$Origin)),col='orange')
barplot(table(cars$Origin,cars$Cylinders))
barplot(prop.table(table(cars$Origin,cars$Cylinders)),beside=T)




#=======================================================================================================
#6. SCATTERPLOTS AND PAIRWISE SCATTERPLOTS
#=======================================================================================================
#scatterplot :
plot(cars$Weight,cars$MPG,xlab="Weight of the car",ylab="Miles per Gallon",main="Association between MPG and Weight")
plot(cars$Weight,cars$MPG,xlab="Weight of the car",ylab="Miles per Gallon",main="Association between MPG and Weight",pch=20)
highlights=cars[cars$MPG>35 & cars$Weight>2900,c("MPG","Weight")]
points(x=highlights$Weight,y=highlights$MPG,pch=0,cex=1.5,col='red')
points(x=2950,y=36.4,pch=0,cex=1.5,col='red')




