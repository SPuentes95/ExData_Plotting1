x = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
x$Date = as.Date(x$Date, "%d/%m/%Y")
x = x[x$Date >= as.Date("01-02-2007", "%d-%m-%Y"),]
x = x[x$Date <= as.Date("02-02-2007", "%d-%m-%Y"),]
x$DateTime = paste(x$Date, x$Time)
x$DateTime = strptime(x$DateTime, format = "%Y-%m-%d %H:%M:%S")
x$Sub_metering_1 = as.numeric(x$Sub_metering_1)
x$Sub_metering_2 = as.numeric(x$Sub_metering_2)
png(filename = "plot3.png")
par(mar = c(3,5,2,2))
plot(x$DateTime, x$Sub_metering_1, type = "n", ylab = "Energy sub mettering")
lines(x$DateTime, x$Sub_metering_1, col = "black")
lines(x$DateTime, x$Sub_metering_2, col = "red")
lines(x$DateTime, x$Sub_metering_3, col = "blue")
legend(x = "topright", legend = c("Sub_mettering_1","Sub_mettering_2","Sub_mettering_3"), col = c("black","red","blue"), lty = c(1,1,1))
dev.off()