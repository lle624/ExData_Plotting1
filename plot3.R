# create a function to retrieve the correct subset of data
getData <- function(){

  ## retrieve text file
  f <- "household_power_consumption.txt"
  
  ## using data from the dates 2007-02-01 and 2007-02-02
  dates <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
  myData <- read.csv.sql(f, sql=dates, sep=";")
  myData$DateTime <- as.POSIXct(strptime(paste(powerData$Date,powerData$Time), "%d/%m/%Y %H:%M:%S"))
  
  return(myData)
}

#plot the data
plotData <- getData()

png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")

plot(x=plotData$DateTime, y=plotData$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")

lines(x=plotData$DateTime, y=plotData$Sub_metering_2, type="l", col="red")

lines(x=plotData$DateTime, y=plotData$Sub_metering_3, type="l", col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="l", col=c("black","red","blue"), lwd=2, cex=0.7)

dev.off()
