tmpPlot <- function() {
  
  setwd("E:\\Coursera\\Data Science Specialization\\Exploratory Data Science\\Project1")
  file <- "household_power_consumption.txt"
  
  dataset <- read.table(file, header=T, sep=";")
  dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
  df <- dataset[(dataset$Date=="2007-02-01") | (dataset$Date=="2007-02-02"),]
  
  df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
  df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active dataset (kilowatts)")
  
  dev.copy(png, file="plot2.png", width=480, height=480)

  cat("plot2.png has been saved in", getwd())  
  
  dev.off()
}

