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

# Plot sub metering 1 over time
plot(xlab = "", ylab = "Energy sub metering", strptime(paste(as.character(data$Date), " ", as.character(data$Time)), "%d/%m/%Y %H:%M:%S" ),data$Sub_metering_1, type = "l", col="black")
# Plot sub metering 2 over time
points(strptime(paste(as.character(data$Date), " ", as.character(data$Time)), "%d/%m/%Y %H:%M:%S" ),data$Sub_metering_2, type = "l", col="red")
# Plot sub metering 3 over time
points(strptime(paste(as.character(data$Date), " ", as.character(data$Time)), "%d/%m/%Y %H:%M:%S" ),data$Sub_metering_3, type = "l", col="blue")

# Add legend for sub metering 1, 2, and 3
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1.5, text.width = 60000 )

# Copy plot to png file
dev.copy(png, file = "plot3.png")
dev.off()