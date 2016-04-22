data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";", 
                   stringsAsFactors = FALSE, 
                   dec = ".")  ## reads in the data

subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] ## creates subset of data for dates of interest
date <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ## transforms date

subMetering1 <- as.numeric(subSetData$Sub_metering_1) ## converts Sub_metering_1 values to numerics
subMetering2 <- as.numeric(subSetData$Sub_metering_2) ## converts Sub_metering_2 values to numerics
subMetering3 <- as.numeric(subSetData$Sub_metering_3) ## converts Sub_metering_2 values to numerics


png("plot3.png", width = 480, height = 480) ## opens / prepares png graphics device
plot(datetime, subMetering1, type = "l", ylab = "Energy sub metering", xlab = "") ## starts plot
lines(datetime, subMetering2, type = "l", col = "red") ## adds to plot
lines(datetime, subMetering3, type = "l", col = "blue") ## adds to plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue")) ## makes legend
dev.off()