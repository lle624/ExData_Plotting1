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

lim <- c(0,1200)

png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")

hist(plotData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red", ylim=lim)

dev.off()
