data <- read.table("household_power_consumption.txt", 
          header=TRUE, 
          sep=";", 
          stringsAsFactors=FALSE, 
          dec=".")  ## reads in the data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")  ## converts date column
subsetdata <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]  ## creates subset of data for dates of interest
subsetdata$Global_active_power <- as.numeric(as.character(subsetdata$Global_active_power))  ## converts global active power values to numerics

png(file = "plot1.png", height = 480, width = 480) ## opens / prepares png graphics device
hist(subsetdata$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")  ##creates historgram
dev.off() ## closes png graphics device