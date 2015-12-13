tmpPlot <- function() {

setwd("E:\\Coursera\\Data Science Specialization\\Exploratory Data Science\\Project1")
file <- "household_power_consumption.txt"

# required packages
library(data.table)
library(lubridate)

   
# get two days of data
variable.class<-c(rep('character',2),rep('numeric',7))
pwr.con<-read.table('household_power_consumption.txt',header=TRUE,
                              sep=';',na.strings='?',colClasses=variable.class)
pwr.con<-pwr.con[pwr.con$Date=='1/2/2007' | pwr.con$Date=='2/2/2007',]


# Clean up Data
cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
        'SubMetering1','SubMetering2','SubMetering3')
colnames(pwr.con)<-cols
pwr.con$DateTime<-dmy(pwr.con$Date)+hms(pwr.con$Time)
pwr.con<-pwr.con[,c(10,3:9)]

# write a clean data set to the directory
write.table(pwr.con,file='source data/power_consumption.txt',sep='|',row.names=FALSE)


pwr.con<-read.table('source data/power_consumption.txt',header=TRUE,sep='|')
pwr.con$DateTime<-as.POSIXlt(pwr.con$DateTime)


# open device
png(filename='plot4.png',width=480,height=480,units='px')

# make 4 plots
par(mfrow=c(2,2))

# Plot 1
plot(pwr.con$DateTime,pwr.con$GlobalActivePower,ylab='Global Active Power',xlab='',type='l')

# Plot 2
plot(pwr.con$DateTime,pwr.con$Voltage,xlab='datetime',ylab='Voltage',type='l')

# Plot 3
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(pwr.con$DateTime,pwr.con$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(pwr.con$DateTime,pwr.con$SubMetering2,col=lncol[2])
lines(pwr.con$DateTime,pwr.con$SubMetering3,col=lncol[3])

# Plot 4
plot(pwr.con$DateTime,pwr.con$GlobalReactivePower,xlab='datetime',ylab='Global_reactive_power',type='l')



x<-dev.off()


 }
 
 