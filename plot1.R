tmpPlot <- function (){
    
file <- "household_power_consumption.txt"

dataset <- read.csv(file, header=TRUE, sep=";", na.strings = '?')


#dataset$Time <- paste (dataset$Date, dataset$Time)


dataset$Date <- as.Date(dataset$Date, '%d/%m/%Y')
#dataset$Time <- strptime(dataset$Time, '%H:%M:%S')

dataset = subset(dataset, (Date == '2007-02-01' | Date == '2007-02-02' ))


png("plot1.png", width = 480, height = 480)
hist(dataset$Global_active_power, main = "Global Active Power", xlab="Global Active Power (Kilowatts)", ylab="Frequency", col="red")
dev.off()




  }
