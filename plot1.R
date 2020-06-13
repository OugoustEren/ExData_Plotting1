
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

# 2. Setting the plot 1:
########################

hist(t$Global_active_power, xlab = "Global Active Power(kilowatts)", ylab = "Frequency", col= "red", main = "Global Active Power")










