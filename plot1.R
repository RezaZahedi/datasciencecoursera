data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?", stringsAsFactors = FALSE)

data$Date <- strptime(data$Date, format = "%d/%m/%Y")

data2 <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

data2$datetime <- strptime(paste(data2$Date, data2$Time), "%Y-%m-%d %H:%M:%S")
data2 <- data2[, 3:10]
#1
png("./plot1.png")
hist(data2$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()