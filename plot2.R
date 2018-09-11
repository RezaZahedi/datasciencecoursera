data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?", stringsAsFactors = FALSE)

data$Date <- strptime(data$Date, format = "%d/%m/%Y")

data2 <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

data2$datetime <- strptime(paste(data2$Date, data2$Time), "%Y-%m-%d %H:%M:%S")
data2 <- data2[, 3:10]

#2
png("./plot2.png")
plot(data2$datetime, data2$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()