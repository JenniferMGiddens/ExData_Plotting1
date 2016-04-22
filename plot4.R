data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";", 
                   stringsAsFactors = FALSE, 
                   dec = ".")  ## reads in the data

subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] ## creates subset of data for dates of interest
date <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ## transforms date

subsetdata$Global_active_power <- as.numeric(as.character(subsetdata$Global_active_power)) ## converts global active power values to numerics
voltage <- as.numeric(subSetData$Voltage) ## converts voltage values to numerics
subMetering1 <- as.numeric(subSetData$Sub_metering_1) ## converts Sub_metering_1 values to numerics
subMetering2 <- as.numeric(subSetData$Sub_metering_2) ## converts Sub_metering_2 values to numerics
subMetering3 <- as.numeric(subSetData$Sub_metering_3) ## converts Sub_metering_2 values to numerics
grp <- as.numeric(subSetData$Global_reactive_power) ## converts global reactive power values to numerics

png("plot4.png", width = 480, height = 480) ## opens / prepares png graphics device
par(mfrow = c(2, 2)) ## adds details of rows / columns for multiple plots

## Plot 1
plot(date, subsetdata$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l") ##creates plot 1

## Plot 2
plot(date, voltage, xlab = "datetime", ylab = "Voltage", type = "l") ## creates plot 2

## Plot 3
plot(date, subMetering1, type = "l", ylab = "Energy sub metering", xlab = "") ## starts plot 3
lines(date, subMetering2, type = "l", col = "red") ## adds to plot
lines(date, subMetering3, type = "l", col = "blue") ## adds to plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue")) ## makes legend

## Plot 4
plot(date, grp, xlab = "datetime", ylab = "Global_reactive_power", type = "l") ## reates plot 3

dev.off() ## closes graphics device