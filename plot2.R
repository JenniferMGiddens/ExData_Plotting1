data <- read.table("household_power_consumption.txt", 
                   header=TRUE, 
                   sep=";", 
                   stringsAsFactors=FALSE, 
                   dec=".")  ## reads in the data

subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] ## creates subset of data for dates of interest
date <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ## transforms date
subsetdata$Global_active_power <- as.numeric(as.character(subsetdata$Global_active_power)) ## converts global active power values to numerics


png(file = "plot2.png", height = 480, width = 480) ## opens / prepares png graphics device
plot(date, subsetdata$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l") ##creates plot
dev.off() ## closes png graphics device