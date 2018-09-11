data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?", stringsAsFactors = FALSE)

data$Date <- strptime(data$Date, format = "%d/%m/%Y")

data2 <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

data2$datetime <- strptime(paste(data2$Date, data2$Time), "%Y-%m-%d %H:%M:%S")
data2 <- data2[, 3:10]

#4
png("./plot4.png")
par(mfrow = c(2,2))

plot(data2$datetime, data2$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")


plot(data2$datetime, data2$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")


plot(data2$datetime, data2$Sub_metering_1, type = "n", 
     xlab = "", ylab = "Energy sub metering")
points(data2$datetime, data2$Sub_metering_1, type = "l", col = "black")
points(data2$datetime, data2$Sub_metering_2, type = "l", col = "red")
points(data2$datetime, data2$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")


plot(data2$datetime, data2$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()