library(data.table)
data <- fread("household_power_consumption.txt")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data1 <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")
data1$time <- paste(format(data1$Date, format = "%Y-%m-%d"), data1$Time)
data1$time <- as.POSIXct(data1$time, "%Y-%m-%d %H-%M-%S")

png(file="plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
par(mar=c(4,3,3,1))
plot(data1$time, data1$Global_active_power, type = "n", xlab = "", ylab="Global Active Power(kilowatts)")
lines(data1$time, data1$Global_active_power)

data1$Voltage <- as.numeric(data1$Voltage)
plot(data1$time, data1$Voltage, type = "n", xlab="datetime", ylab="Voltage")
lines(data1$time, data1$Voltage)

plot(data1$time, data1$Sub_metering_1, type = "n", xlab = "", ylab="Energy sub metering")
lines(data1$time, data1$Sub_metering_1)
lines(data1$time, data1$Sub_metering_2, col = "red")
lines(data1$time, data1$Sub_metering_3, col = "blue")
legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black", "red", "blue"),cex = 0.7, bty="n")

data1$Global_reactive_power <- as.numeric(data1$Global_reactive_power)
plot(data1$time, data1$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", pch=20, cex = 0.3)
lines(data1$time, data1$Global_reactive_power)

dev.off()