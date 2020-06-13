
## 1. Loading Data
##################

t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
t$Date <- as.Date(t$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation
t <- t[complete.cases(t),]
head(t)
## Combine Date and Time column
dateTime <- paste(t$Date, t$Time)
head(t)
## Name the vector
dateTime <- setNames(dateTime, "DateTime")
dateTime
## Remove Date and Time column
t <- t[ ,!(names(t) %in% c("Date","Time"))]
head(t)
## Add DateTime column
t <- cbind(dateTime, t)
head(t)
## Format dateTime Column
t$dateTime <- as.POSIXct(dateTime)

# 2. Setting the plot 4:
########################
par(mfrow = c(2,2), mar= c(4,4,2,1), oma = c(0,0,2,0))
with(t,{
  #plot 1
  plot(Global_active_power ~ dateTime, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
  
  #plot 2
  plot(Voltage ~ dateTime, type = "l", xlab="")
  
  #plot 3
  plot(Sub_metering_1~dateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  #plot 4
  plot(Global_reactive_power ~ dateTime, type= "l", xlab="", ylab=" Global Reactive Power (Kilowatts)")
})



