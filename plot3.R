data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?", stringsAsFactors = FALSE)

data$Date <- strptime(data$Date, format = "%d/%m/%Y")

data2 <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

data2$datetime <- strptime(paste(data2$Date, data2$Time), "%Y-%m-%d %H:%M:%S")
data2 <- data2[, 3:10]

#3
png("./plot3.png")
plot(data2$datetime, data2$Sub_metering_1, type = "n", 
     xlab = "", ylab = "Energy sub metering")
points(data2$datetime, data2$Sub_metering_1, type = "l", col = "black")
points(data2$datetime, data2$Sub_metering_2, type = "l", col = "red")
points(data2$datetime, data2$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()