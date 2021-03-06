library(data.table)
data <- fread("household_power_consumption.txt")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data1 <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")
data1$time <- paste(format(data1$Date, format = "%Y-%m-%d"), data1$Time)
data1$time <- as.POSIXct(data1$time, "%Y-%m-%d %H-%M-%S")
png(file="plot2.png", width = 480, height = 480)
plot(data1$time, data1$Global_active_power, type = "n", xlab = "", ylab="Global Active Power(kilowatts)")
lines(data1$time, data1$Global_active_power)
dev.off()




