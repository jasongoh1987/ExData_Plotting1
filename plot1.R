# Download power consumption data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","powerConsumption.zip")
# Unzip downloaded file
unzip("powerConsumption.zip")
# read data
data <- read.table("household_power_consumption.txt",sep = ";",na.strings = "?",header = TRUE)
# Filter data to have only data for Date 2007-02-01 and 2007-02-02
data <- data[(as.Date(data$Date, "%d/%m/%Y") == as.Date("2007-02-01") ) | (as.Date(data$Date, "%d/%m/%Y") == as.Date("2007-02-02")), ]

# Place plot on 1 row by 1 column
par(mfrow = c(1,1))

# Plot histogram
hist(data$Global_active_power,xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col="red")

# Copy plot to png file
dev.copy(png, file = "plot1.png")
dev.off()